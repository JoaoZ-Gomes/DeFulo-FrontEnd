# Quick Start - DeFulo Flutter

## 🚀 Começar em 5 minutos

### 1. Instalar dependências
```bash
cd Frontend
flutter pub get
```

### 2. Gerar código (Freezed, JSON, Drift)
```bash
flutter pub run build_runner build
```

### 3. Estrutura ficou assim:
```
✅ main.dart - App entry point
✅ core/theme/ - Design System (cores, tipografia)
✅ core/services/ - Auth, Connectivity
✅ core/sync/ - Offline-first system (completo)
✅ features/auth/ - Login (pronto)
✅ features/dashboard/ - Dashboard com stats
✅ features/fazenda/ - Listagem de fazendas
✅ features/talhao/ - Talhões com sensores
✅ features/evento/ - Eventos com 6 tipos
✅ features/usuario/ - Perfil do usuário
✅ shared/widgets/ - 10+ componentes reutilizáveis
```

### 4. Executar app
```bash
flutter run
```

## 📱 Navegação

```
Bottom Tab Bar (4 abas):
├─ Início (Dashboard)
│  ├─ Status de sincronização
│  ├─ Quick stats
│  └─ Últimas atividades
├─ Fazendas
│  ├─ Lista com cards
│  └─ Ver talhões de cada uma
├─ Talhões
│  ├─ Sensor de umidade (alerta <25%)
│  ├─ Temperatura
│  └─ Registrar evento
└─ Eventos
   ├─ 6 tipos (Pulv, Adub, Irrig, etc)
   ├─ Status (Executado/Pendente)
   └─ Criar novo (+)
```

## 🔧 Configuração

### Environment Variables
```bash
# Create .env
BACKEND_URL=http://localhost:8080
BACKEND_TIMEOUT=30000
SYNC_INTERVAL=300000  # 5 min
```

### Database Encryption
```dart
// database.dart
password: 'your_secure_password_here'
```

## 📦 Arquivos Principais

| Arquivo | O que faz |
|---------|-----------|
| `main.dart` | Entry point, tabs, routing |
| `app_theme.dart` | Cores, tipografia, Material 3 |
| `auth_service.dart` | Login, token, logout |
| `connectivity_service.dart` | V1-V4 verificação |
| `sync_engine.dart` | Orquestrador offline-first |
| `*_repository.dart` | Acesso a dados locais |
| `*_screen.dart` | Telas do app |
| `common_widgets.dart` | Componentes reutilizáveis |

## 🎯 Features Implementadas

### ✅ Autenticação
- Login com email/senha
- Armazenamento seguro de JWT
- Auto-refresh de token
- Logout

### ✅ Dashboard
- Status de sincronização
- Estatísticas (3 fazendas, 12 talhões, 45 eventos)
- Atividades recentes

### ✅ Fazendas
- Listar todas
- Card com área, localização, produtor
- Botões de ação (Editar, Ver Talhões)

### ✅ Talhões
- Listar por fazenda
- **Alerta de umidade** (ícone de aviso se <25%)
- Temperatura em tempo real
- Status (Ativo, Inativo, Preparação)
- Botão para registrar evento

### ✅ Eventos
- Listar todos
- 6 tipos com ícones diferentes
- Status (Executado, Pendente)
- Responsável
- Data/hora formatada
- EmptyState quando não há

### ✅ Perfil
- Avatar + info pessoal
- Email, CPF, Telefone
- Estatísticas
- Configurações (idioma, tema, notificações)
- Logout

## 🔄 Sistema de Sincronização

```dart
// Usar assim nos repositórios:
class FazendaRepository extends OfflineFirstRepository<FazendaLocal> {
  @override
  Future<void> save(fazenda) async {
    await super.save(fazenda);  // Escreve local + fila sync
    await syncEngine.startSync();  // Tenta sincronizar
  }
}
```

### Offline-First Magic
1. Usuário cria/edita dados
2. Escreve imediatamente no SQLite (offline funciona!)
3. Enfileira na SyncQueue
4. Quando conexão volta, sincroniza automaticamente
5. Conflitos resolvidos com 4 estratégias

## 🧪 Testes

```bash
# Testes de conflito
flutter test test/sync/conflict_resolver_test.dart

# Todos os testes
flutter test

# Com coverage
flutter test --coverage
```

## 📊 Estrutura de Dados (SQLite)

```sql
-- Entidades
usuarios_local (id, email, nome, perfil, cpf, telefone, ...)
fazendas_local (id, nome, localizacao, latitude, longitude, areaTotal, ...)
talhoes_local (id, fazenda_id, nome, area, cultura, status, umidade, temp, ...)
eventos_local (id, talhao_id, tipo, data, descricao, responsavel, ...)

-- Controle de Sync
sync_queue (id, entity_type, operation, payload, status, localVersion, ...)
sync_log (id, device_id, entity_type, operation, timestamp, result, ...)
id_mapping (local_id, remote_id, device_id, entity_type, ...)
sync_metadata (key, value)  -- last_sync_timestamp, etc
```

## 🔐 Segurança

- ✅ JWT em FlutterSecureStorage
- ✅ SQLite com SQLCipher (criptografia)
- ✅ HTTPS com cert pinning (TODO)
- ✅ Validação de entrada (TODO)

## 📈 Performance

- ✅ Lazy loading de listas
- ✅ Paginação (TODO)
- ✅ Cache de imagens
- ✅ Background sync
- ✅ Código generation (Freezed/JSON)

## 🐛 Debug

### Ver logs
```dart
Logger().i('Info');
Logger().e('Erro');
Logger().d('Debug');
```

### Ver estado de sync
```dart
ref.watch(syncStateNotifier);  // UI state
ref.watch(syncEngineProvider);  // Engine state
```

### Debug DB
```bash
flutter run --target=lib/debug/db_viewer.dart
```

## 📝 Próximos Passos

1. Conectar ao backend real
2. Implementar SyncEngine TODOs
3. Adicionar dialogs de CRUD
4. Testes de integração
5. Deploy Play Store / App Store

---

**Status**: Pronto para desenvolvimento
**Última atualização**: 29/05/2026
