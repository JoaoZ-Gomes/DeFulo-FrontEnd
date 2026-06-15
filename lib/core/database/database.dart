import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite_sqlcipher/sqflite.dart';
import 'schema.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    UsuariosLocal,
    FazendasLocal,
    TalhoesLocal,
    EventosManejosLocal,
    SyncQueue,
    SyncLog,
    IdMapping,
    SyncMetadata,
  ],
)
class DeFuloDatabase extends _$DeFuloDatabaseImpl {
  static DeFuloDatabase? _instance;

  DeFuloDatabase._private(QueryExecutor e) : super(e);

  static Future<DeFuloDatabase> getInstance() async {
    if (_instance != null) return _instance!;

    final dbPath = await _getDatabasePath();
    _instance = DeFuloDatabase._private(
      _openDatabaseWithEncryption(dbPath),
    );
    return _instance!;
  }

  // Fechar a conexão
  static Future<void> closeInstance() async {
    await _instance?.close();
    _instance = null;
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      // Executar migração inicial
      await m.createAll();
      
      // Inicializar metadados de sync
      await into(syncMetadata).insert(
        SyncMetadataCompanion(
          key: const Value('last_sync_timestamp'),
          value: const Value('1970-01-01T00:00:00Z'),
          updatedAt: Value(DateTime.now().toUtc().toIso8601String()),
        ),
      );
      await into(syncMetadata).insert(
        SyncMetadataCompanion(
          key: const Value('device_id'),
          value: Value(_generateDeviceId()),
          updatedAt: Value(DateTime.now().toUtc().toIso8601String()),
        ),
      );
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // Implementar migrações futuras aqui
    },
  );

  // =========================================================================
  // QUERIES AUXILIARES
  // =========================================================================

  /// Obter todos os itens pendentes de sincronização
  Future<List<SyncQueueData>> getPendingItems() {
    return (select(syncQueue)
          ..where((tbl) => tbl.status.isNotIn(['SUCCESS'])))
        .get();
  }

  /// Atualizar status de um item da fila
  Future<void> updateSyncQueueStatus(
    int id,
    String status, {
    String? errorMessage,
  }) {
    return (update(syncQueue)..where((tbl) => tbl.id.equals(id))).write(
      SyncQueueCompanion(
        status: Value(status),
        errorMessage: Value(errorMessage),
        lastAttemptAt: Value(DateTime.now().toUtc().toIso8601String()),
      ),
    );
  }

  /// Incrementar retry count
  Future<void> incrementRetryCount(int id) async {
    final item = await (select(syncQueue)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
    if (item != null) {
      await (update(syncQueue)..where((tbl) => tbl.id.equals(id))).write(
        SyncQueueCompanion(
          retryCount: Value(item.retryCount + 1),
        ),
      );
    }
  }

  /// Obter metadata de sincronização
  Future<String?> getMetadata(String key) async {
    final result = await (select(syncMetadata)
          ..where((tbl) => tbl.key.equals(key)))
        .getSingleOrNull();
    return result?.value;
  }

  /// Atualizar metadata de sincronização
  Future<void> setMetadata(String key, String value) async {
    await into(syncMetadata).insertOnConflictUpdate(
      SyncMetadataCompanion(
        key: Value(key),
        value: Value(value),
        updatedAt: Value(DateTime.now().toUtc().toIso8601String()),
      ),
    );
  }

  /// Obter último timestamp de sincronização
  Future<DateTime> getLastSyncTimestamp() async {
    final metadata = await getMetadata('last_sync_timestamp');
    return DateTime.parse(metadata ?? '1970-01-01T00:00:00Z');
  }

  /// Atualizar último timestamp de sincronização
  Future<void> setLastSyncTimestamp(DateTime timestamp) async {
    await setMetadata(
      'last_sync_timestamp',
      timestamp.toUtc().toIso8601String(),
    );
  }

  /// Obter Device ID
  Future<String> getDeviceId() async {
    final deviceId = await getMetadata('device_id');
    return deviceId ?? _generateDeviceId();
  }

  /// Contar itens pendentes
  Future<int> countPendingItems() async {
    return (select(syncQueue)
          ..where((tbl) => tbl.status.equals('PENDING')))
        .count()
        .getSingle();
  }

  /// Limpar fila de sync concluída
  Future<void> clearSuccessfulItems() async {
    await (delete(syncQueue)
          ..where((tbl) => tbl.status.equals('SUCCESS')))
        .go();
  }
}

// ============================================================================
// FUNÇÕES AUXILIARES
// ============================================================================

Future<String> _getDatabasePath() async {
  final dir = await getApplicationDocumentsDirectory();
  return path.join(dir.path, 'defulo_database.db');
}

NativeDatabase _openDatabaseWithEncryption(String dbPath) {
  return NativeDatabase.createBackgroundConnection(
    () {
      final sqliteConnection = SqliteConnection(dbPath);
      return sqliteConnection.createConnection();
    },
    closeStreamsSynchronously: true,
  );
}

// Alternativa usando sqlcipher diretamente (mais seguro)
Future<NativeDatabase> _openDatabaseWithSqlCipher(String dbPath) async {
  final password = 'your-encryption-password'; // TODO: Usar SecureStorage
  
  return NativeDatabase.createBackgroundConnection(
    () async {
      final db = await openDatabaseWithSqlCipher(
        dbPath,
        password: password,
        singleInstance: true,
      );
      return db;
    },
    closeStreamsSynchronously: true,
  );
}

String _generateDeviceId() {
  // Em produção, gerar UUIDv4 e armazenar permanentemente
  // Por enquanto, usar package uuid
  return 'device_${DateTime.now().millisecondsSinceEpoch}';
}
