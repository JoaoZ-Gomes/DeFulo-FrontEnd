# Build Configuration — DeFulo Offline-First Sync System

## pubspec.yaml

Todas as dependências já estão configuradas em `pubspec.yaml`. Principais packages:

### State Management & UI
```yaml
flutter_riverpod: ^2.4.0          # State management
riverpod_generator: ^2.3.0        # Code generation for providers
```

### Local Database
```yaml
drift: ^2.13.0                    # ORM
sqlite3_flutter_libs: ^0.5.8      # SQLite bindings
sqflite_sqlcipher: ^2.6.0         # Encryption
```

### Network
```yaml
dio: ^5.3.0                       # HTTP client
connectivity_plus: ^5.0.0         # Connectivity detection
```

### Utilities
```yaml
uuid: ^4.0.0                      # UUID generation
crypto: ^3.0.3                    # Hashing (SHA-256)
freezed_annotation: ^2.4.0        # Code generation
json_annotation: ^4.8.0           # JSON serialization
```

### Background Tasks (Future)
```yaml
flutter_workmanager: ^0.6.1       # Background sync
```

## Build Steps

### 1. Generate Code
```bash
cd Frontend
flutter pub run build_runner build
```

This generates:
- Drift database (`database.g.dart`)
- Freezed models (`.freezed.dart`)
- JSON serialization (`.g.dart`)
- Riverpod providers (optional)

### 2. Format Code
```bash
dart format lib/
dart analyze
```

### 3. Run Tests
```bash
flutter test test/sync/
```

### 4. Build APK/IPA
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## Environment Variables

Create `.env` file:
```
API_BASE_URL=https://api.defulo.com
JWT_SECRET=your-secret-key-here
DB_ENCRYPTION_PASSWORD=your-db-password
DEVICE_ID_PREFERENCE_KEY=defulo_device_id
```

Load in `main.dart`:
```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  // ...
}
```

## Backend (Spring Boot)

### Prerequisites
- Java 17+
- Maven 3.8+
- PostgreSQL 14+

### Build
```bash
cd Backend/DeFulo-BackEnd
./mvnw clean install
```

### Run
```bash
./mvnw spring-boot:run
```

Server starts at: `http://localhost:8080`

### Docker Compose
```bash
docker-compose up -d
# PostgreSQL on :5432
# Backend on :8080
```

## Database Initialization

### Local (Flutter/Drift)
Automatic on first run. Drift handles migrations in `database.dart`.

### Remote (Spring Boot)
Flyway migrations in `src/main/resources/db/migration/`:
- V1__create_usuarios_table.sql
- V2__create_fazendas_talhoes_table.sql
- V3__create_eventos_manejo_table.sql

Automatic on app startup (Flyway configured in pom.xml).

## Configuration Files

### pubspec.yaml
Flutter dependencies and assets

### pom.xml
Maven dependencies for Spring Boot

### compose.yaml
Docker Compose for local development
- PostgreSQL 14
- Adminer (web UI for DB)

## IDE Setup

### VS Code
Extensions:
- Dart Code
- Flutter
- SQLite Viewer
- REST Client

### IntelliJ IDEA
Plugins:
- Dart
- Flutter
- Database Tools
- REST Client

## Troubleshooting Build Issues

### Issue: "Drift table 'XYZ' not found"
**Solution**: Run `flutter pub run build_runner clean && flutter pub run build_runner build`

### Issue: "JsonSerializable annotation missing"
**Solution**: Ensure `@freezed` or `@JsonSerializable()` on models before regenerating

### Issue: "Cannot resolve Riverpod provider"
**Solution**: Regenerate with `flutter pub run build_runner build --delete-conflicting-outputs`

### Issue: "SQLite version mismatch"
**Solution**: Update `sqlite3_flutter_libs` and clean build folder: `flutter clean`

## Performance Tips

1. **Database Queries**
   - Use indexed columns for frequent filters
   - Batch operations when possible
   - Limit query results with `.limit()`

2. **Sync Operations**
   - Process items in batches of 50-100
   - Compress payloads for slow connections
   - Cache frequently accessed entities

3. **Memory Management**
   - Dispose streams properly
   - Use `.maybeWhen()` instead of `.when()` in UI
   - Avoid rebuilding entire lists

4. **Network**
   - Enable HTTP/2 in Dio
   - Set appropriate timeouts (3s for health, 10s for operations)
   - Compress responses with gzip

## Logging Configuration

Enable debug logging:
```dart
// main.dart
if (kDebugMode) {
  Logger.level = Level.debug;
}
```

Logs written to:
- Console (development)
- File (optional, use `logger` with file handler)

Access sync logs:
```dart
final logs = await database.select(database.syncLog).get();
logs.forEach((log) => print('${log.syncId}: ${log.status}'));
```

## Testing Strategy

### Unit Tests
```bash
flutter test test/sync/conflict_resolver_test.dart
```

### Integration Tests
```bash
flutter drive --target=test_driver/app.dart
```

### Mock Backend
Use `mockito` or `nock` for testing without real server.

## CI/CD Pipeline (GitHub Actions)

```yaml
name: Test & Build

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v1
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test
      - run: flutter build apk
```

## Release Checklist

- [ ] Version bumped in `pubspec.yaml`
- [ ] CHANGELOG.md updated
- [ ] Backend endpoints documented
- [ ] All tests passing
- [ ] Code coverage > 80%
- [ ] Secrets not committed
- [ ] Lint checks pass (`dart analyze`)
- [ ] Performance profiled
- [ ] Conflict resolution strategies tested
- [ ] Backup migration plan documented
