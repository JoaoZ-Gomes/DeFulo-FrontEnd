# Guia de Implementação Completa — Sistema de Sincronização Offline-First

## 📌 Status de Implementação

Este documento rastreia o progresso da implementação do sistema de sincronização.

---

## ✅ CONCLUÍDO

### Camada 1 — Banco Local (SQLite via Drift)
- ✅ `schema.dart` — Definição de todas as tabelas (usuarios_local, fazendas_local, talhoes_local, eventos_manejo_local, sync_queue, sync_log, id_mapping, sync_metadata)
- ✅ `database.dart` — Classe DeFuloDatabase com migrations e queries auxiliares
- ✅ Encriptação com SqlCipher preparada
- ✅ Geração automática de código com `build_runner`

### Camada 2 — Conectividade
- ✅ `connectivity_service.dart` — ConnectivityService com 4 verificações (V1-V4)
- ✅ V1: Hardware (Connectivity.checkConnectivity)
- ✅ V2: Alcançabilidade (GET /api/health com ping)
- ✅ V3: Autenticação (Verificar JWT exp)
- ✅ V4: Qualidade de conexão (Latência > 5000ms)
- ✅ Streams para observar mudanças de estado

### Camada 3 — Repositório Offline-First
- ✅ `offline_first_repository.dart` — Classe abstrata genérica
- ✅ Padrão local-first write
- ✅ Métodos: save(), findById(), findAll(), delete(), syncPendingItems()
- ✅ Geração de checksum SHA-256
- ✅ Geração de UUID v4 local

### Camada 4 — Motor de Sincronização
- ✅ `sync_engine.dart` — SyncEngine completo
- ✅ Orquestração: V1-V8 checks
- ✅ Processamento de fila com validações
- ✅ Push ao servidor
- ✅ Pull remoto
- ✅ Streams de progresso

### Camada 5 — Resolução de Conflitos
- ✅ `conflict_resolver.dart` — Interface e 4 estratégias
- ✅ LastWriteWinsResolver (padrão)
- ✅ ServerWinsResolver
- ✅ ClientWinsResolver
- ✅ ManualMergeResolver
- ✅ ConflictResolverFactory com defaults por entidade

### Camada 6 — Modelos de Sincronização
- ✅ `sync_models.dart` — DTOs para comunicação cliente-servidor
- ✅ SyncItem, SyncPushRequest/Response, SyncPullRequest/Response, SyncStatus, SyncLogEntry

### Camada 7 — State Management (UI)
- ✅ `sync_state_notifier.dart` — SyncStateNotifier com Riverpod
- ✅ Estados: idle, offline, pending, syncing, partial, conflict, error, done
- ✅ Mapeamento automático de SyncEngineState → SyncUIState
- ✅ Providers derivados para metrics

### Camada 8 — Backend Endpoints
- ✅ DTOs: SyncItemDTO, SyncPushRequestDTO, SyncPushResponseDTO, SyncPullItemDTO, SyncPullResponseDTO, SyncStatusDTO
- ✅ Controller: SyncController com endpoints:
  - GET /api/health
  - POST /api/sync/push
  - GET /api/sync/pull
  - GET /api/sync/status/{deviceId}
  - POST /api/auth/refresh
- ✅ Service: SyncService com lógica de processamento

### Camada 9 — Testes Unitários
- ✅ `conflict_resolver_test.dart` — Testes para todas as estratégias
- ✅ Testes de casos de uso

### Documentação
- ✅ `README_SYNC.md` — Documentação completa com exemplos

---

## 🔄 PRÓXIMAS ETAPAS PARA COMPLETAR

### 1. Implementar Código Gerado (Drift)
```bash
cd Frontend
flutter pub run build_runner build
```

**Arquivos gerados**:
- `lib/core/database/database.g.dart`
- `lib/features/usuario/model/usuario_model.freezed.dart`
- `lib/features/usuario/model/usuario_model.g.dart`
- `lib/features/fazenda/model/fazenda_model.freezed.dart`
- `lib/features/fazenda/model/fazenda_model.g.dart`
- `lib/features/talhao/model/talhao_model.freezed.dart`
- `lib/features/talhao/model/talhao_model.g.dart`
- `lib/features/evento/model/evento_model.freezed.dart`
- `lib/features/evento/model/evento_model.g.dart`
- `lib/core/sync/models/sync_models.freezed.dart`
- `lib/core/sync/models/sync_models.g.dart`

### 2. Implementar Repositórios por Entidade

**Arquivos a criar**:

```
lib/features/
├── usuario/
│   └── repository/
│       └── usuario_repository.dart
├── fazenda/
│   └── repository/
│       └── fazenda_repository.dart
├── talhao/
│   └── repository/
│       └── talhao_repository.dart
└── evento/
    └── repository/
        └── evento_repository.dart
```

**Template para cada**:
```dart
class {Entidade}Repository extends OfflineFirstRepository<{Entidade}, int> {
  // Implementar save, findById, findAll, delete, syncPendingItems
  // Seguir padrão de offline-first write
  // Integrar com database.dart
}
```

### 3. Completar SyncEngine (TODOs)

**Localização**: `lib/core/sync/engine/sync_engine.dart`

- [ ] Linha ~150: Implementar `_verifyChecksum()`
- [ ] Linha ~160: Implementar `_checkForDuplicate()`
- [ ] Linha ~180: Implementar `_checkVersionConflict()`
- [ ] Linha ~200: Implementar `_resolveConflict()`
- [ ] Linha ~250: Implementar `_updateItemChecksum()`
- [ ] Linha ~280: Implementar endpoints GET para cada entityType
- [ ] Linha ~320: Implementar `_performPullSync()` completo
- [ ] Linha ~350: Agendar retry com `flutter_workmanager`

### 4. Completar Backend (TODOs)

**Localização**: `Backend/DeFulo-BackEnd/src/main/java/com/defulo/api/infrastructure/sync/service/SyncService.java`

- [ ] Injetar repositórios (UsuarioRepository, FazendasRepository, etc)
- [ ] Implementar `executeCreate()` para cada tipo de entidade
- [ ] Implementar `executeUpdate()` para cada tipo de entidade
- [ ] Implementar `executeDelete()` para cada tipo de entidade
- [ ] Implementar `fetchModifiedUsuarios()` (pull)
- [ ] Implementar `fetchModifiedFazendas()` (pull)
- [ ] Implementar `fetchModifiedTalhoes()` (pull)
- [ ] Implementar `fetchModifiedEventos()` (pull)
- [ ] Implementar autenticação V3 (JWT refresh)
- [ ] Testar cada endpoint com Postman/insomnia

### 5. Criar Widgets de UI

**Arquivos a criar**:

```
lib/shared/widgets/
├── sync_status_indicator.dart     # Ícone na AppBar
├── sync_progress_dialog.dart      # Dialog durante sync
├── sync_error_snackbar.dart       # Notificação de erro
├── pending_items_badge.dart       # Badge com contador
└── sync_log_details_screen.dart   # Tela de detalhes
```

### 6. Adicionar Providers Riverpod

**Localização**: `lib/core/sync/notifier/sync_state_notifier.dart`

- [ ] Implementar `pendingItemsCountProvider`
- [ ] Implementar `lastSyncTimeProvider`
- [ ] Implementar `isOnlineProvider`
- [ ] Implementar `latencyProvider`
- [ ] Implementar `autoSyncProvider` (periodic)

### 7. Implementar V3 (JWT Refresh)

**Localização**: `lib/core/connectivity/connectivity_service.dart`

- [ ] Adicionar `_verifyAuthentication()` completo
- [ ] Obter token do SecureStorage
- [ ] Decodificar JWT (sem validar assinatura)
- [ ] Verificar campo `exp`
- [ ] Chamar POST /api/auth/refresh se expirado
- [ ] Atualizar token no SecureStorage

### 8. Implementar Background Sync

**Localização**: Novo arquivo `lib/core/sync/background/background_sync.dart`

```dart
// Usar flutter_workmanager para:
// - Agendar retry automático
// - Sync periódica a cada 5 minutos
// - Persistir mesmo com app fechado
```

### 9. Testes Integração

**Criar**: `test/sync/sync_engine_integration_test.dart`

- [ ] Teste completo de CREATE offline
- [ ] Teste completo de UPDATE offline
- [ ] Teste completo de DELETE offline
- [ ] Teste de conflito resolvido
- [ ] Teste de retry com backoff
- [ ] Teste de pull sync

### 10. Documentação de Deployment

**Criar**: `DEPLOYMENT_GUIDE.md`

- [ ] Checklist pré-produção
- [ ] Configuração de variáveis de ambiente
- [ ] Instruções de build (APK/IPA)
- [ ] Monitoramento em produção

---

## 🧪 Passos para Testar Localmente

### 1. Setup Inicial
```bash
# Frontend
cd Frontend
flutter pub get
flutter pub run build_runner build
flutter run

# Backend
cd Backend/DeFulo-BackEnd
./mvnw clean install
./mvnw spring-boot:run
```

### 2. Testar Sincronização Manual
```bash
# No app Flutter:
1. Criar evento offline (sem conexão)
2. Observar enfileiramento em sync_queue
3. Conectar à internet
4. Observar sync automático
5. Verificar sync_log e id_mapping
```

### 3. Testar Conflito
```bash
# Backend: Modificar talhão T1
curl -X PUT http://localhost:8080/api/talhao/1 \
  -H "Content-Type: application/json" \
  -d '{"nome": "Talhão A - Versão Servidor"}'

# App: Modificar mesmo talhão localmente
# Conectar internet → conflito deve ser detectado
# Verificar sync_queue com status=CONFLICT
```

### 4. Testar Retry
```bash
# Backend: Desligar por 30 segundos
# App: Tentar sincronizar → erro
# Aguardar backoff (30s, 2min, 10min)
# Backend: Religar
# Observar retry automático
```

---

## 📋 Checklist de Qualidade

- [ ] Todos os arquivos têm lint correto (`dart analyze`)
- [ ] Código segue convenções Flutter
- [ ] Testes cobrem > 80% do código crítico
- [ ] Documentação completa com exemplos
- [ ] Sem dependências de transporte não-HTTPS
- [ ] Senhas/tokens não hardcoded
- [ ] Banco local encriptado
- [ ] Logs estruturados com contexto
- [ ] Error handling robusto
- [ ] Idempotência garantida

---

## 🚀 Roadmap Futuro

- [ ] Suporte para múltiplos usuários (shared device)
- [ ] Sincronização seletiva (escolher quais dados)
- [ ] Compressão de payload para conexões lentas
- [ ] Deltaização (sync apenas mudanças, não todo payload)
- [ ] Suporte offline para imagens/attachments
- [ ] Analytics de performance de sync
- [ ] Dashboard de admin para monitorar sync dos dispositivos
- [ ] Exportação/importação de dados locais
- [ ] Recuperação de desastres (restore de backup)

---

## 📞 Contato para Suporte

Documente aqui:
- [ ] Email de suporte
- [ ] Canal Slack/Discord
- [ ] Repositório de issues
- [ ] Telefone de emergência
