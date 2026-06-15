# Sistema de Sincronização Offline-First — DeFulo

## 📋 Sumário Executivo

O DeFulo implementa um sistema robusto de sincronização **offline-first** que permite aos agrônomos trabalhar sem conexão à internet e sincronizar automaticamente quando a conexão for reestabelecida.

### Características Principais

✅ **Local-First Write**: Dados são salvos localmente antes de qualquer tentativa de sync  
✅ **Múltiplas Verificações**: 4 camadas de validação (hardware, alcançabilidade, autenticação, qualidade)  
✅ **Resolução de Conflitos**: 4 estratégias de resolução (Last Write Wins, Server Wins, Client Wins, Manual Merge)  
✅ **Idempotência Garantida**: Operações repetidas não duplicam dados  
✅ **Retry Automático**: Backoff exponencial com `flutter_workmanager`  
✅ **Audit Trail Completo**: Log de todas as operações com checksums e versões  
✅ **Detecção de Duplicatas**: Rastreamento local→remoto via UUID + deviceId  

---

## 🏗️ Arquitetura

```
┌─────────────────────────────────────────────┐
│           APLICAÇÃO FLUTTER                 │
├─────────────────────────────────────────────┤
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │     SyncStateNotifier (UI)          │   │  Estado da sincronização
│  │     • idle, offline, pending, ...   │   │  para a interface
│  └─────────────────────────────────────┘   │
│                    ▲                        │
│                    │ observa                │
│                    │                        │
│  ┌─────────────────────────────────────┐   │
│  │      SyncEngine (Orquestrador)      │   │  Motor principal
│  │  • ConnectivityChecks (V1-V4)       │   │  de sincronização
│  │  • ItemValidation (V5-V8)           │   │
│  │  • ConflictResolution               │   │
│  │  • Push/Pull Sync                   │   │
│  └─────────────────────────────────────┘   │
│       ▲         ▲         ▲                 │
│       │         │         │                 │
│  ┌────┴──┐  ┌──┴────┐  ┌─┴────────┐       │
│  │Connect│  │Offline│  │Conflict  │       │
│  │ivity  │  │First  │  │Resolver  │       │
│  │Service│  │Repo   │  │          │       │
│  └────┬──┘  └──┬────┘  └─┬────────┘       │
│       │        │         │                  │
│  ┌────┴────────┴─────────┴──────────────┐  │
│  │     DeFuloDatabase (Drift/SQLite)    │  │
│  │  • sync_queue                         │  │  SQLite local
│  │  • sync_log                           │  │  encriptado
│  │  • id_mapping                         │  │
│  │  • *_local (usuários, fazendas...)   │  │
│  └────┬────────────────────────────────┘  │
│       │                                    │
└───────┼────────────────────────────────────┘
        │ HTTP (Dio + Interceptors)
        │
        ▼
┌─────────────────────────────────────────────┐
│         BACKEND SPRING BOOT                 │
├─────────────────────────────────────────────┤
│                                             │
│  POST   /api/sync/push     ← Recebe ops  │
│  GET    /api/sync/pull     ← Envia atuali  │
│  GET    /api/sync/status   ← Status        │
│  GET    /api/health        ← Health check  │
│  POST   /api/auth/refresh  ← Refresh JWT   │
│                                             │
│  Repositórios do banco PostgreSQL           │
│  (usuários, fazendas, talhões, eventos)    │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 🔄 Fluxo de Sincronização Completo

### 1. Escrita Offline (Local-First)

```
Usuário faz alteração
        │
        ▼
┌─────────────────────────┐
│ OfflineFirstRepository  │
│  .save() é chamado      │
└────────┬────────────────┘
         │
         ├─→ Gera UUID local (se novo)
         │
         ├─→ Salva em usuarios_local/fazendas_local/etc
         │
         ├─→ Cria SyncItem:
         │   • entityType: 'usuario'
         │   • operation: 'CREATE' ou 'UPDATE'
         │   • payload: serializado JSON
         │   • checksum: SHA-256(payload)
         │   • version: 1
         │
         └─→ Insere em sync_queue
             status: PENDING
             
✅ Retorna entidade com ID temporário
```

### 2. Detecção de Conectividade (V1-V4)

Quando o app detecta alteração ou disparo manual de sync:

```
ConnectivityService.checkConnectivity()
    │
    ├─→ [V1] Hardware Check
    │    └─ Connectivity.checkConnectivity()
    │    └─ Resultado: wifi/mobile/none
    │    └─ Se none → ABORTAR, modo offline
    │
    ├─→ [V2] Server Reachability (Ping)
    │    └─ GET /api/health (timeout 3s)
    │    └─ Mede latência
    │    └─ Se falhar → ABORTAR
    │
    ├─→ [V3] Authentication
    │    └─ Decodifica JWT local
    │    └─ Verifica campo 'exp'
    │    └─ Se expirado → POST /api/auth/refresh
    │    └─ Se refresh falha → ABORTAR
    │
    └─→ [V4] Connection Quality
         └─ Se latência > 5000ms
         └─ Emitir aviso ao usuário
         └─ Permitir cancelamento
         
✅ Se todas passam → CONTINUAR SYNC
```

### 3. Processamento de Fila (V5-V8)

Para cada item pendente:

```
SyncEngine.startSync()
    │
    ├─→ Buscar todos os itens com status PENDING/ERROR
    │
    └─→ Para cada item:
        │
        ├─→ [V5] Verify Checksum
        │    └─ Recalcular SHA-256(payload atual)
        │    └─ Comparar com checksum armazenado
        │    └─ Se divergem → payload foi alterado
        │    └─ Atualizar payload e checksum
        │
        ├─→ [V6] Check for Duplicate (Idempotência)
        │    └─ Query: SELECT * FROM sync_log
        │    └─ WHERE localId = item.localId
        │    └─ AND deviceId = item.deviceId
        │    └─ Se já existe e status=SUCCESS
        │    └─ Marcar como SUCCESS, skip
        │
        ├─→ [V7] Check Version Conflict (OCC)
        │    └─ GET /api/{entityType}/{id}
        │    └─ Buscar remoteVersion
        │    └─ Se remoteVersion > localVersion
        │    └─ Conflito detectado!
        │    └─ Aplicar ConflictResolutionStrategy
        │
        ├─→ Execute Remote Operation
        │    ├─ CREATE → POST /api/{entityType}
        │    ├─ UPDATE → PUT /api/{entityType}/{id}
        │    └─ DELETE → DELETE /api/{entityType}/{id}
        │
        ├─→ [V8] Process HTTP Response
        │    ├─ 201/200 → SUCCESS, atualizar remoteId
        │    ├─ 409 → CONFLICT, aplicar resolver
        │    ├─ 401 → Retry refresh + sync
        │    ├─ 404 → SUCCESS (deletado remotamente)
        │    ├─ 422 → ERROR, não retentar
        │    ├─ 5xx → ERROR, agendar retry
        │    └─ Timeout → ERROR, backoff exponencial
        │
        └─→ Atualizar sync_queue com resultado
```

### 4. Pull Remoto

Após todo o push bem-sucedido:

```
SyncEngine._performPullSync()
    │
    ├─→ Obter lastSyncTimestamp do banco local
    │
    ├─→ GET /api/sync/pull?since={lastSyncTimestamp}
    │
    ├─→ Receber lista de SyncPullItem modificados
    │
    ├─→ Para cada item remoto:
    │    ├─ Se localVersion < remoteVersion
    │    │  └─ UPDATE cache local com dados remotos
    │    │
    │    ├─ Se remoto foi DELETADO
    │    │  └─ Soft delete local (marcar como deletado)
    │    │
    │    └─ Se não existe localmente
    │       └─ INSERT novo registro no cache
    │
    └─→ Atualizar lastSyncTimestamp
```

### 5. Finalização

```
✅ Marcar todos SUCCESS em sync_queue
✅ Limpar fila (optional: archive para auditoria)
✅ Atualizar sync_log com resultado final
✅ Emitir evento para UI com sucesso
✅ Cache local agora está sincronizado
```

---

## 🔀 Estratégias de Resolução de Conflito

### A. Last Write Wins (Padrão: talhao, evento)

**Regra**: O registro modificado mais recentemente vence.

```dart
// Exemplo
Local:  { nome: 'Talhão A', updatedAt: '2026-05-29T15:00:00Z' }
Remote: { nome: 'Talhão A - Novo', updatedAt: '2026-05-29T14:00:00Z' }

Resultado: Local vence (15:00 > 14:00)
Decisão registrada: "Local data is newer (15:00 > 14:00)"
```

**Pros**: Democrática, respeita quem modificou por último  
**Cons**: Pode perder mudanças do servidor se agrônomo trabalha offline por muito tempo

### B. Server Wins (Padrão: usuario, fazenda)

**Regra**: O servidor sempre prevalece. Dados locais são sobrescritos.

```dart
// Exemplo
Local:  { cpf: '123.456.789-00' }
Remote: { cpf: '987.654.321-00' }

Resultado: Remote vence
Mensagem: "Server data is authoritative for this entity"
```

**Pros**: Garantir dados cadastrais/de segurança sempre corretos  
**Cons**: Perde trabalho local se modificar dados que foram alterados no servidor

### C. Client Wins (Cuidado: apenas para dados de campo)

**Regra**: O cliente sempre prevalece. Força update no servidor.

```dart
// Exemplo (EventoManejo)
Local:  { tipoEvento: 'PULVERIZAÇÃO', dataEvento: '2026-05-29' }
Remote: { tipoEvento: 'IRRIGAÇÃO', dataEvento: '2026-05-28' }

Resultado: Local vence
Mensagem: "Client wins strategy applied (use with caution)"
```

**Pros**: Respeita autoridade do técnico de campo  
**Cons**: ⚠️ Pode descartar mudanças do gestor no servidor

### D. Manual Merge (UI Interativa)

**Regra**: Apresentar diff visual ao usuário para escolher.

```
┌─────────────────────────────────────────┐
│   CONFLITO DETECTADO!                   │
├─────────────────────────────────────────┤
│ Talhão: "Talhão A"                      │
│ Campo: "Status"                         │
│                                         │
│ Local:  [ATIVA]    Remoto: [FINALIZADA]│
│                                         │
│ [ Usar Local ]  [ Usar Remoto ] [ Merge]
└─────────────────────────────────────────┘
```

**Pros**: Máximo controle, sem perda de dados  
**Cons**: Requer interação do usuário

---

## 📊 Exemplo: Criar Evento Offline

### Cenário
Agrônomo em talhão sem sinal cria evento de pulverização.

### Sequência

```
1️⃣ CRIAÇÃO LOCAL
   EventoRepository.save(eventoManejo)
   
   LocalId: "ae3f4e2c-91d2-4c7a-9e5b-1d3c2f4e5a6b"
   
   Inserido em eventos_manejo_local:
   ┌────────────────────────────────────────────────┐
   │ id          | ae3f4e2c-91d2-4c7a...         │
   │ talhaoId    | (referência local)             │
   │ tipoEvento  | PULVERIZAÇÃO                   │
   │ dataEvento  | 2026-05-29                     │
   │ status      | PENDING (não sincronizado)     │
   └────────────────────────────────────────────────┘
   
   ✅ Retornado ao app com UUID temporário
   ✅ Usuário vê evento na tela imediatamente


2️⃣ ENFILEIRAMENTO
   Inserido em sync_queue:
   ┌────────────────────────────────────────────────┐
   │ localId     | ae3f4e2c-91d2-4c7a...         │
   │ entityType  | evento                         │
   │ operation   | CREATE                         │
   │ status      | PENDING                        │
   │ version     | 1                              │
   │ checksum    | sha256(payload)...             │
   │ createdAt   | 2026-05-29T10:00:00Z           │
   │ retryCount  | 0                              │
   └────────────────────────────────────────────────┘
   
   ✅ Aguardando sincronização


3️⃣ CONEXÃO DETECTADA (depois)
   ConnectivityService emite: isOnline = true
   App dispara: SyncEngine.startSync()


4️⃣ VERIFICAÇÕES PRÉ-SYNC
   ✅ [V1] Hardware: mobile conectado
   ✅ [V2] Ping: GET /api/health → 200 OK (45ms)
   ✅ [V3] Token: exp: 2026-05-30 (ainda válido)
   ✅ [V4] Latência: 45ms < 5000ms (OK)
   
   → Continuar sync


5️⃣ PROCESSAMENTO DO ITEM
   ✅ [V5] Checksum: sha256(payload) = checksum anterior (OK)
   ✅ [V6] Duplicata: Primeira vez, não existe no servidor
   ✅ [V7] Versão: CREATE não tem versão, skip
   
   → Executar CREATE


6️⃣ PUSH AO SERVIDOR
   POST /api/sync/push
   {
     "deviceId": "device-uuid-12345",
     "items": [
       {
         "localId": "ae3f4e2c-91d2-4c7a-9e5b...",
         "entityType": "evento",
         "operation": "CREATE",
         "payload": {
           "talhaoId": 42,
           "tipoEvento": "PULVERIZAÇÃO",
           "dataEvento": "2026-05-29",
           "notas": "..."
         },
         "localVersion": 1,
         "checksum": "abc123def456...",
         "createdAt": "2026-05-29T10:00:00Z"
       }
     ]
   }
   
   → Servidor retorna:
   {
     "syncId": "sync-uuid-789...",
     "items": [
       {
         "localId": "ae3f4e2c-91d2...",
         "status": "SUCCESS",
         "remoteId": 1042  ← ✅ ID REAL DO SERVIDOR
       }
     ],
     "successCount": 1
   }


7️⃣ ATUALIZAR MAPEAMENTO
   id_mapping:
   ┌───────────────────────────────────────┐
   │ localUuid  | ae3f4e2c-91d2-4c7a...  │
   │ remoteId   | 1042                    │
   │ entityType | evento                  │
   │ syncedAt   | 2026-05-29T10:00:05Z    │
   └───────────────────────────────────────┘
   
   ✅ ID local agora mapeado para ID remoto


8️⃣ PULL REMOTO
   GET /api/sync/pull?since=2026-05-29T09:00:00Z
   
   → Buscar registros modificados no servidor
   → Atualizar cache local com versões mais recentes
   

9️⃣ FINALIZAÇÃO
   ✅ Marcar sync_queue com status = SUCCESS
   ✅ Atualizar sync_log com resultado
   ✅ SyncStateNotifier emite: SyncState.done
   ✅ UI mostra: "✅ Sincronizado com sucesso"


🔟 RESULTADO FINAL
    
    Evento agora no servidor com:
    • ID remoto: 1042
    • Referência original: uuid local
    • Garantia de idempotência via deviceId
    • Áudit trail completo
```

---

## 🛠️ Implementação de Novo Repositório

Para criar um novo repositório com suporte offline-first:

```dart
// lib/features/minha_entidade/repository/minha_entidade_repository.dart

class MinhaEntidadeRepository extends OfflineFirstRepository<MinhaEntidade, int> {
  final DeFuloDatabase _db;
  final Dio _dio;
  final String _baseUrl = 'http://api.defulo.com';

  MinhaEntidadeRepository({
    required DeFuloDatabase db,
    required Dio dio,
  })  : _db = db,
        _dio = dio;

  @override
  Future<MinhaEntidade> save(MinhaEntidade entity) async {
    // 1. Salvar localmente
    final json = entityToJson(entity);
    
    // 2. Determinar se é CREATE ou UPDATE
    if (entity.id == null) {
      // CREATE: gerar UUID local
      final localId = generateLocalId();
      json['id'] = localId;
      
      // 3. Inserir na tabela local
      await _db.into(_db.minhaEntidadeLocal).insert(
        MinhaEntidadeLocalCompanion(
          // ...campos...
        ),
      );
      
      // 4. Enfileirar para sync
      final syncItem = createSyncItem(
        localId: localId,
        entityType: 'minha_entidade',
        operation: 'CREATE',
        payload: json,
        version: 1,
      );
      
      await _db.into(_db.syncQueue).insert(SyncQueueCompanion(
        // ...preenchimento do SyncQueue...
      ));
      
      entity = entity.copyWith(id: localId);  // Usar UUID como ID temporário
    } else {
      // UPDATE: usar ID existente
      await _db.update(_db.minhaEntidadeLocal)
          .replace(
            MinhaEntidadeLocalCompanion(
              // ...campos...
            ),
          );
      
      final syncItem = createSyncItem(
        localId: entity.id.toString(),
        entityType: 'minha_entidade',
        operation: 'UPDATE',
        payload: json,
        version: 2,  // Incrementar versão
      );
      
      await _db.into(_db.syncQueue).insert(SyncQueueCompanion(
        // ...preenchimento do SyncQueue...
      ));
    }
    
    return entity;
  }

  @override
  Future<MinhaEntidade?> findById(int id) async {
    // 1. Buscar localmente
    final localEntity = await (_db.select(_db.minhaEntidadeLocal)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
    
    if (localEntity == null) return null;
    
    // 2. Verificar se está stale
    // ...lógica de stale...
    
    return jsonToEntity(localEntity.toJson());
  }

  @override
  Future<List<MinhaEntidade>> findAll() async {
    final localEntities = await _db.select(_db.minhaEntidadeLocal).get();
    return localEntities.map(jsonToEntity).toList();
  }

  @override
  Future<void> delete(int id) async {
    // Soft delete
    await (_db.update(_db.minhaEntidadeLocal)
          ..where((tbl) => tbl.id.equals(id)))
        .write(const MinhaEntidadeLocalCompanion(
          isDeleted: Value(true),
        ));
    
    // Enfileirar DELETE
    final syncItem = createSyncItem(
      localId: id.toString(),
      entityType: 'minha_entidade',
      operation: 'DELETE',
      payload: {'id': id},
      version: 1,
    );
    
    await _db.into(_db.syncQueue).insert(SyncQueueCompanion(
      // ...preenchimento do SyncQueue...
    ));
  }

  @override
  Future<void> syncPendingItems() async {
    // Delegado para SyncEngine
    logOperation('Sincronização delegada para SyncEngine');
  }

  @override
  Map<String, dynamic> entityToJson(MinhaEntidade entity) {
    return {
      'id': entity.id,
      'nome': entity.nome,
      // ...outros campos...
    };
  }

  @override
  MinhaEntidade jsonToEntity(Map<String, dynamic> json) {
    return MinhaEntidade(
      id: json['id'],
      nome: json['nome'],
      // ...outros campos...
    );
  }
}
```

---

## 📱 Monitorar Sincronização na UI

```dart
// lib/features/dashboard/widgets/sync_status_widget.dart

class SyncStatusWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncState = ref.watch(syncStateProvider);
    
    return ListenableBuilder(
      listenable: syncState,
      builder: (context, _) {
        return AppBar(
          title: Text('DeFulo'),
          actions: [
            // 1. Indicador de status
            Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.center,
                child: Tooltip(
                  message: syncState.stateDescription,
                  child: CircleAvatar(
                    backgroundColor: Color(int.parse(
                      '0xFF${syncState.stateColor.replaceFirst('#', '')}'
                    )),
                    child: Text(
                      syncState.stateIcon,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            
            // 2. Contador de pendentes
            if (syncState.pendingItemsCount > 0)
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Center(
                  child: Badge(
                    label: Text('${syncState.pendingItemsCount}'),
                    child: Icon(Icons.cloud_upload),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
```

---

## 🔧 Troubleshooting

### Problema: Sincronização não inicia

**Verificar**:
1. `ConnectivityService` inicializado?
   ```dart
   await connectivityService.initialize();
   ```

2. Token JWT válido?
   ```dart
   final isValid = await authService.isTokenValid();
   ```

3. Servidor acessível?
   ```dart
   final canReach = await connectivityService.isConnectedQuick();
   ```

### Problema: Conflito detectado e não resolve

**Verificar**:
1. Estratégia configurada corretamente?
   ```dart
   final resolver = ConflictResolverFactory.getDefaultResolver('talhao');
   ```

2. Versões do item corretas?
   ```dart
   final item = await db.getPendingItems().first;
   print('Local: ${item.version}, Checksum: ${item.checksum}');
   ```

### Problema: Retry não funcionando

**Verificar**:
1. `flutter_workmanager` inicializado?
2. Permissões de background job concedidas?
3. Limite de retries atingido?
   ```dart
   final item = await db.getPendingItems().first;
   print('Retry ${item.retryCount}/${item.maxRetries}');
   ```

---

## 📊 Monitoramento e Métricas

### Consultas úteis

```sql
-- Itens pendentes por tipo
SELECT entity_type, COUNT(*) as count, status
FROM sync_queue
WHERE status != 'SUCCESS'
GROUP BY entity_type, status;

-- Último sync bem-sucedido
SELECT * FROM sync_log
ORDER BY finished_at DESC
LIMIT 1;

-- Taxa de sucesso
SELECT 
  (SELECT COUNT(*) FROM sync_queue WHERE status = 'SUCCESS') as success,
  (SELECT COUNT(*) FROM sync_queue WHERE status = 'ERROR') as errors,
  (SELECT COUNT(*) FROM sync_queue) as total;

-- Conflitos mais frequentes
SELECT entity_type, COUNT(*) as count
FROM sync_queue
WHERE status = 'CONFLICT'
GROUP BY entity_type
ORDER BY count DESC;
```

---

## 🔒 Segurança

- ✅ SQLite encriptado com sqflite_sqlcipher
- ✅ JWT token armazenado em SecureStorage
- ✅ HTTPS enforçado para todas as requisições
- ✅ Validação de checksum previne corrupção em transit
- ✅ Idempotência previne duplicatas acidental
- ✅ Audit trail completo para investigação de inconsistências

---

## 📚 Referências

- [Drift ORM Documentation](https://drift.simonbinder.eu/)
- [Flutter Best Practices for Offline-First](https://flutter.dev/docs)
- [Optimistic Concurrency Control](https://en.wikipedia.org/wiki/Optimistic_concurrency_control)
- [Conflict-free Replicated Data Types (CRDTs)](https://crdt.tech/)

---

## ✉️ Suporte

Para dúvidas ou problemas:
1. Consultar `ANALISE_ERROS_FALTANTES.md` para erros conhecidos
2. Verificar logs em `sync_log` e `sync_queue`
3. Executar testes: `flutter test test/sync/`
