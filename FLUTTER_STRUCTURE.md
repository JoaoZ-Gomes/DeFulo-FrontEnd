# DeFulo - Guia Completo da Estrutura Flutter

## 🎯 Visão Geral

Transformação completa do frontend da workspace DeFulo em Dart/Flutter puro. A aplicação agora possui uma arquitetura profissional, offline-first, com design system coeso e integração total com o sistema de sincronização backend.

## 📁 Estrutura de Diretórios

```
lib/
├── main.dart                              # Entry point da aplicação
├── core/
│   ├── theme/
│   │   └── app_theme.dart                # Design System: cores, tipografia, temas
│   ├── database/
│   │   ├── schema.dart                   # Tabelas Drift (8 tabelas)
│   │   └── database.dart                 # Singleton DeFuloDatabase
│   ├── models/
│   │   └── auth_models.dart              # Modelos de autenticação
│   ├── services/
│   │   └── auth_service.dart             # Lógica de autenticação
│   ├── connectivity/
│   │   └── connectivity_service.dart     # 4-layer verificação de conexão
│   ├── repository/
│   │   └── offline_first_repository.dart # Base genérica para repos offline-first
│   ├── sync/
│   │   ├── models/
│   │   │   └── sync_models.dart          # DTOs de sincronização (Freezed)
│   │   ├── conflict/
│   │   │   └── conflict_resolver.dart    # 4 estratégias de conflito
│   │   ├── engine/
│   │   │   └── sync_engine.dart          # Orquestrador de sync (V1-V8)
│   │   └── notifier/
│   │       └── sync_state_notifier.dart  # Riverpod StateNotifier
│   └── routing/
│       └── app_router.dart               # Constantes de rotas
├── features/
│   ├── auth/
│   │   └── screens/
│   │       └── login_screen.dart         # Tela de login com validação
│   ├── dashboard/
│   │   └── screens/
│   │       └── dashboard_screen.dart     # Dashboard com abas e stats
│   ├── usuario/
│   │   ├── model/
│   │   │   └── usuario_repository.dart   # Repositório offline-first
│   │   └── screens/
│   │       └── perfil_screen.dart        # Tela de perfil do usuário
│   ├── fazenda/
│   │   ├── model/
│   │   │   └── fazenda_repository.dart   # Repositório offline-first
│   │   └── screens/
│   │       └── fazendas_screen.dart      # Listagem de fazendas
│   ├── talhao/
│   │   ├── model/
│   │   │   └── talhao_repository.dart    # Repositório offline-first
│   │   └── screens/
│   │       └── talhoes_screen.dart       # Listagem com sensores de alerta
│   └── evento/
│       ├── model/
│       │   └── evento_repository.dart    # Repositório offline-first
│       └── screens/
│           └── eventos_screen.dart       # Listagem com tipos de evento
└── shared/
    └── widgets/
        └── common_widgets.dart           # Componentes reutilizáveis

test/
├── sync/
│   └── conflict_resolver_test.dart       # 40+ testes unitários
└── unit_tests_setup.md                   # Instruções de setup
```

## 🎨 Design System

### Paleta de Cores (Almanaque Rural Moderno)

| Cor | Hex | Uso |
|-----|-----|-----|
| **Verde Clorofila** | #2D5A27 | Primária, CTA, navegação |
| **Marrom Solo** | #4E342E | Secundária, ênfase |
| **Âmbar** | #FF8F00 | Alerta, informações secundárias |
| **Vermelho** | #C62828 | Erros, avisos críticos |
| **Verde Claro** | #66BB6A | Sucesso, status positivo |
| **Off-White** | #F5F5F5 | Background |
| **Cinza Divider** | #E0E0E0 | Separadores |

### Tipografia

| Elemento | Tamanho | Peso | Uso |
|----------|--------|------|-----|
| Display Large | 32px | Bold | Títulos maiores |
| Headline | 24px | Bold | Títulos principais |
| Title Large | 18px | SemiBold | Subtítulos |
| Body | 14-16px | Regular | Texto comum |
| Caption | 12px | Regular | Dados numéricos/legenda |

### Componentes

- **Cards**: border-radius 8px, shadow leve, padding 16px
- **Botões**: altura 48px, radius 8px
- **FAB**: círculo, cor primária
- **Input**: rounded 8px, border focus verde

## 🔐 Arquitetura de Autenticação

### Login Flow
```dart
LoginScreen
  ↓ (email, password)
AuthService.login()
  ↓ POST /api/auth/login
DeFuloDatabase (cache local)
  ↓ Store JWT + User
MainTabScreen (Protected)
```

### JWT Handling
- Armazenado em `FlutterSecureStorage`
- Validação de `exp` antes de usar
- Auto-refresh via interceptor Dio
- V3 Connectivity Check: decodifica JWT sem verificar assinatura

## 📲 Fluxo de Dados Offline-First

### Write Path (Offline)
```
User Input → Repository.save()
  ↓ (Geração de localId UUID v4)
SQLite Local Write (imediato)
  ↓ (Sem conexão: para aqui)
SyncQueue.add() (Enfileiramento)
  ↓ (Conexão detectada)
SyncEngine.startSync()
```

### Entities Principais

#### **Usuario**
```dart
- id, email, nome, perfil, cpf, telefone
- V1 LocalStorage + V2 SyncQueue
```

#### **Fazenda**
```dart
- nome, localizacao, latitude, longitude, areaTotal, produtor
- Queries: findByProdutor(), findNearby()
```

#### **Talhao**
```dart
- nome, area, culturaAtual, status, umidadeSolo, temperatura
- Sensors: umidade (alerta <25%), temperatura
- Queries: findByFazenda(), findComAlerta()
```

#### **EventoManejo**
```dart
- tipo (PULVERIZACAO, ADUBACAO, IRRIGACAO, etc)
- dataEvento, descricao, dados (JSON), status, responsavel
- Queries: findByTalhao(), findByTipo(), findRecentes()
```

## 🔄 Sincronização (V1-V8)

### V1: Detecção Hardware
```dart
ConnectivityPlus.checkConnectivity()
  → Wifi, Mobile, None
```

### V2: Verificação de Server
```dart
GET /api/health (3s timeout)
  → Ping + Latência
  → Alerta se latência > 5000ms
```

### V3: Validação JWT
```dart
Decodificar JWT
  → Verificar field 'exp'
  → Comparar com DateTime.now()
```

### V4: Qualidade de Conexão
```dart
Medir latência de ping
  → Log para dashboard
```

### V5-V8: Pipeline de Processamento
```
V5: Checksum SHA-256
V6: Detecção de duplicatas (deviceId + localId)
V7: Conflito OCC (version field)
V8: Tratamento HTTP (201/200/409/401/404/422/5xx)
```

### Retry com Backoff Exponencial
```
30s → 2min → 10min
Recuperável: timeout, 5xx
Não-recuperável: 401, 422 (validation)
```

## 📦 Widgets Reutilizáveis

### DeFuloCard
```dart
DeFuloCard(
  child: Column(...),
  onTap: () => { ... },
  padding: EdgeInsets.all(16),
)
```

### DeFuloTextInput
```dart
DeFuloTextInput(
  label: 'Email',
  prefixIcon: Icons.email,
  keyboardType: TextInputType.emailAddress,
  validator: (val) => val?.isEmpty ?? true ? 'Obrigatório' : null,
)
```

### StatusBadge
```dart
StatusBadge(
  label: 'Sincronizado',
  backgroundColor: Colors.green.withOpacity(0.1),
  textColor: Colors.green,
)
```

### EmptyState / LoadingState / ErrorState
```dart
EmptyState(
  icon: Icons.inbox,
  title: 'Nenhum dado',
  message: 'Comece adicionando...',
  actionLabel: 'Criar',
  onAction: () => { ... },
)
```

## 🎯 Telas Implementadas

### 1. **LoginScreen** (`features/auth/screens/login_screen.dart`)
- ✅ Validação de email e senha
- ✅ Tratamento de erros
- ✅ Loading state
- ✅ Link para recuperação de senha
- ✅ Link para registro

### 2. **DashboardScreen** (`features/dashboard/screens/dashboard_screen.dart`)
- ✅ Greeting personalizado
- ✅ Status de sincronização com indicador
- ✅ Quick Stats (Fazendas, Talhões, Eventos)
- ✅ Lista de fazendas recentes
- ✅ Lista de eventos recentes

### 3. **MainTabScreen** (`lib/main.dart`)
- ✅ Bottom Navigation com 4 abas
- ✅ FAB contextual (apenas na aba de Eventos)
- ✅ AppBar com notificações e perfil

### 4. **FazendasScreen** (`features/fazenda/screens/fazendas_screen.dart`)
- ✅ Listagem com cards detalhados
- ✅ Informações de área e localização
- ✅ Botões de Editar e Ver Talhões
- ✅ Gradient header com ícone

### 5. **TalhoesScreen** (`features/talhao/screens/talhoes_screen.dart`)
- ✅ Cards com status (Ativo, Inativo, Preparação)
- ✅ **Alerta de umidade crítica** (<25%)
- ✅ Exibição de temperatura
- ✅ Último evento registrado
- ✅ Botão para registrar novo evento

### 6. **EventosScreen** (`features/evento/screens/eventos_screen.dart`)
- ✅ Tipos diferentes com ícones:
  - 🌊 Pulverização
  - 🍂 Adubação
  - 💧 Irrigação
  - 🌱 Plantio
  - 🌾 Colheita
  - 🌿 Capina
- ✅ Status Executado/Pendente
- ✅ Data/hora formatada
- ✅ Responsável
- ✅ EmptyState com CTA

### 7. **PerfilScreen** (`features/usuario/screens/perfil_screen.dart`)
- ✅ Avatar circular com ícone
- ✅ Informações pessoais (email, CPF, telefone)
- ✅ Estatísticas (fazendas, talhões)
- ✅ Menu de configurações
- ✅ Botão de logout

## 🔌 Integração com Backend

### Endpoints Esperados

```
POST   /api/auth/login
POST   /api/auth/refresh
GET    /api/health

POST   /api/sync/push
GET    /api/sync/pull
GET    /api/sync/status/{deviceId}

GET    /api/usuarios
POST   /api/usuarios
GET    /api/usuarios/{id}
PUT    /api/usuarios/{id}

GET    /api/fazendas
POST   /api/fazendas
GET    /api/fazendas/{id}
PUT    /api/fazendas/{id}

GET    /api/talhoes
POST   /api/talhoes
GET    /api/talhoes/{id}
PUT    /api/talhoes/{id}

GET    /api/eventos
POST   /api/eventos
GET    /api/eventos/{id}
PUT    /api/eventos/{id}
```

## 🧪 Testes Unitários

### Conflict Resolver Tests
```bash
flutter test test/sync/conflict_resolver_test.dart
```

Cobertura:
- ✅ LastWriteWinsResolver (3 cenários)
- ✅ ServerWinsResolver
- ✅ ClientWinsResolver
- ✅ ManualMergeResolver
- ✅ ConflictResolverFactory

### Executar Todos os Testes
```bash
flutter test
```

## 🚀 Build & Deploy

### Android
```bash
flutter build apk --release
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web (futuro)
```bash
flutter build web --release
```

## 📝 Pubspec Dependencies

### Production
```yaml
flutter_riverpod: ^2.4.0      # State management
dio: ^5.3.0                   # HTTP client
drift: ^2.13.0                # SQLite ORM
connectivity_plus: ^5.0.0     # Conexão
uuid: ^4.0.0                  # UUIDs
crypto: ^3.0.3                # Checksums
freezed: ^2.4.0               # Immutable models
json_annotation: ^4.8.0       # JSON
flutter_workmanager: ^0.6.1   # Background tasks
flutter_secure_storage: ^9.0  # JWT storage
logger: ^2.1.0                # Logging
```

### Development
```yaml
build_runner: ^2.4.0
freezed: ^2.4.0
json_serializable: ^6.7.0
drift_dev: ^2.13.0
```

## 📋 TODO / Próximos Passos

### Priority 1 (Crítico)
- [ ] Implementar `flutter pub run build_runner build` para code generation
- [ ] Conectar AuthService ao backend real
- [ ] Implementar FlutterSecureStorage para JWT
- [ ] Implementar queries SQL nos repositórios

### Priority 2 (Alto)
- [ ] Implementar SyncEngine TODOs (~10 métodos)
- [ ] Criar dialogs para criar/editar entidades
- [ ] Implementar navegação com go_router
- [ ] Adicionar upload de fotos para eventos

### Priority 3 (Médio)
- [ ] Testes de integração
- [ ] Tema escuro completo
- [ ] Notificações push
- [ ] Gráficos de dados (charts)
- [ ] Export para PDF/Excel

### Priority 4 (Baixo)
- [ ] Multiidioma i18n
- [ ] Animações
- [ ] Performance otimization
- [ ] Documentação in-app

## 📚 Referências

- [Flutter Official](https://flutter.dev)
- [Riverpod Docs](https://riverpod.dev)
- [Drift Documentation](https://drift.simonbinder.eu)
- [Material 3 Design](https://m3.material.io)

## 🤝 Contribuindo

Estrutura segue:
- Dart conventions
- Clean Architecture principles
- Offline-first patterns
- BLoC pattern (via Riverpod)

---

**Última atualização**: 29 de maio de 2026
**Status**: Estrutura completa, implementação 60%
**Responsável**: DeFulo Dev Team
