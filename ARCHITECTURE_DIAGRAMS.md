# DeFulo Offline-First Sync System — Diagrama UML

## Class Diagram - Sync Engine

```
┌─────────────────────────────────────────────────────────────────┐
│                        SyncEngine                               │
├─────────────────────────────────────────────────────────────────┤
│ - _db: DeFuloDatabase                                           │
│ - _dio: Dio                                                     │
│ - _connectivityService: ConnectivityService                     │
│ - _baseUrl: String                                              │
│ - _isSyncing: bool                                              │
├─────────────────────────────────────────────────────────────────┤
│ + startSync(): Future<void>                                     │
│ - _performConnectivityChecks(): Future<bool>      [V1-V4]       │
│ - _verifyChecksum(item): Future<bool>             [V5]          │
│ - _checkForDuplicate(item): Future<bool>          [V6]          │
│ - _checkVersionConflict(item): Future<bool>       [V7]          │
│ - _executeRemoteOperation(item): Future<Result>   [V8a]         │
│ - _handleRemoteOperationError(item, result)       [V8b-d]       │
│ - _scheduleRetry(item): Future<void>              [Backoff]     │
│ - _performPullSync(): Future<void>                [Pull]        │
│ - _finalizeSyncLog(id, status, ...)               [Logging]     │
├─────────────────────────────────────────────────────────────────┤
│ + isSyncing: bool                                               │
│ + stateStream: Stream<SyncEngineState>                          │
│ + progressStream: Stream<SyncProgress>                          │
└─────────────────────────────────────────────────────────────────┘
         │                          │                    │
         ▼                          ▼                    ▼
    ┌─────────────┐         ┌──────────────┐    ┌─────────────────┐
    │Connectivity │         │Database      │    │ConflictResolver │
    │Service      │         │(Drift)       │    │Factory          │
    │             │         │              │    │                 │
    │[V1-V4]      │         │sync_queue    │    │[Last/Server/    │
    └─────────────┘         │sync_log      │    │ Client/Manual]  │
                            │id_mapping    │    └─────────────────┘
                            └──────────────┘
```

## Inheritance Hierarchy - Repository Pattern

```
┌──────────────────────────────────────────────────────────────────┐
│      OfflineFirstRepository<T, ID> (Abstract Base)              │
├──────────────────────────────────────────────────────────────────┤
│ # Utility Methods:                                               │
│ + save(T): Future<T>              [Local-first write]            │
│ + findById(ID): Future<T?>         [Local-first read]            │
│ + findAll(): Future<List<T>>       [Local first]                 │
│ + delete(ID): Future<void>         [Soft delete + queue]         │
│ + syncPendingItems(): Future<void> [Delegate to SyncEngine]      │
│ # generateChecksum(Map): String    [SHA-256]                     │
│ # generateLocalId(): String        [UUID v4]                     │
│ # createSyncItem(...): SyncItem                                  │
│ # entityToJson(T): Map             [Serialization]               │
│ # jsonToEntity(Map): T             [Deserialization]             │
└──────────────────────────────────────────────────────────────────┘
         ▲                    ▲                    ▲
         │                    │                    │
         │                    │                    │
    ┌────┴──────┐      ┌──────┴────┐      ┌───────┴──────┐
    │UsuarioRep │      │FazendasRep│      │TalhaoRep     │
    └────┬──────┘      └──────┬────┘      └───────┬──────┘
         │                    │                    │
    ┌────┴──────────┐         │         ┌──────────┴────┐
    │EventoRep      │         │         │               │
    └───────────────┘         ▼         ▼               ▼
         (Each implements specific logic for their entity type)
```

## State Flow Diagram

```
                    ┌─────────────┐
                    │  App Start  │
                    └──────┬──────┘
                           │
                           ▼
                ┌──────────────────────┐
                │ Initialize Services: │
                │ • Database (Drift)   │
                │ • ConnectivitySvc    │
                │ • SyncEngine         │
                └──────────┬───────────┘
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
        ▼                  ▼                  ▼
   ┌────────┐      ┌───────────┐      ┌────────────┐
   │ OFFLINE│      │  PENDING  │      │    IDLE    │
   │        │      │           │      │            │
   │ No net │      │ Items in  │      │ No pending │
   │ conn   │      │ sync_queue│      │ items      │
   └───┬────┘      └─────┬─────┘      └──────┬─────┘
       │                 │                    │
       │ conn restored   │ conn detected      │ user triggers
       │                 │ or auto-trigger    │ or periodic
       │                 │                    │
       └─────────────────┼────────────────────┘
                         │
                         ▼
                  ┌──────────────┐
                  │   SYNCING    │
                  │              │
                  │ • V1-V4 check│
                  │ • V5-V8 proc │
                  │ • Push/Pull  │
                  └──────┬───────┘
                         │
         ┌───────────────┼───────────────┐
         │               │               │
         ▼               ▼               ▼
    ┌────────┐    ┌───────────┐    ┌────────┐
    │  DONE  │    │ PARTIAL   │    │ ERROR  │
    │        │    │           │    │        │
    │ 100%   │    │ Some fail │    │ All fail
    │success │    │ /conflict │    │        │
    └───┬────┘    └─────┬─────┘    └──┬─────┘
        │                │             │
        └────────────────┼─────────────┘
                         │
                    ┌────▼─────┐
                    │ IDLE or  │
                    │ PENDING  │
                    └──────────┘
```

## Sequence Diagram - Sync Operation

```
App          ConnectivityService    SyncEngine        Database        Backend
│                │                     │                │              │
├──trigger sync─────────────────────────────────────────────────────────┤
│                │                     │                │              │
│                ├─V1: checkConnectivity│                │              │
│                │◄──────result────────┤                │              │
│                │                     │                │              │
│                ├─V2: GET /health     │                │              ├──200 OK
│                │ (3s timeout)        │                │              │
│                │◄──────OK─────────────────────────────────────────────┤
│                │                     │                │              │
│                ├─V3: verifyToken     │                │              │
│                │     (check exp)     │                │              │
│                │◄──────valid─────────┤                │              │
│                │                     │                │              │
│                ├─V4: qualityCheck    │                │              │
│                │ (measure latency)   │                │              │
│                │◄──────45ms──────────┤                │              │
│                │                     │                │              │
│                │                     ├─connect ready──────────────┤
│                │                     │                │              │
│                │                     ├─getPendingItems────────────┤
│                │                     │                │              │
│                │                     │◄─[5 items]─────────────────┤
│                │                     │                │              │
│   (for each item)                    │                │              │
│                │                     ├─V5: checksum──────────────┤
│                │                     ├─V6: duplicate─────────────┤
│                │                     ├─V7: version───────────────┤
│                │                     │                │              │
│                │                     ├─POST /sync/push────────────┤
│                │                     │   (all items)              │
│                │                     │                │              ├─process
│                │                     │                │              ├─detect
│                │                     │                │              │ conflicts
│                │                     │                │              ├─[result]
│                │                     │◄──responses─────────────────┤
│                │                     │                │              │
│                │                     ├─V8: processResponse◄─────────┤
│                │                     │ (handle 201/409/401/etc)   │
│                │                     │                │              │
│                │                     ├─updateSyncQueue◄─────────┤
│                │                     │ (mark SUCCESS/CONFLICT)    │
│                │                     │                │              │
│                │                     ├─GET /sync/pull────────────┤
│                │                     │ (since=lastSync)           │
│                │                     │                │              ├─query
│                │                     │                │              │ changes
│                │                     │◄──[changed items]───────────┤
│                │                     │                │              │
│                │                     ├─updateLocalCache─────────┤
│                │                     │ (merge pulled data)        │
│                │                     │                │              │
│                │                     ├─finalizeSyncLog─────────┤
│                │                     │                │              │
│◄─emit DONE──────────────────────────┤                │              │
│                │                     │                │              │
│ (update UI)    │                     │                │              │
└────────────────────────────────────────────────────────────────────────
```

## Entity Relationship Diagram (Database)

```
┌─────────────────────────────┐
│   usuarios_local            │
├─────────────────────────────┤
│ PK id (int)                 │
│    email (text, unique)     │
│    nome (text)              │
│    perfil (text)            │
│    cpf (text, unique)       │
│    createdAt (text)         │
│    updatedAt (text)         │
└──────────────┬──────────────┘
               │ 1
               │
               │ N
    ┌──────────▼──────────┐
    │ fazendas_local      │
    ├─────────────────────┤
    │ PK id (int)         │
    │    nome (text)      │
    │    cnpj (text)      │
    │    produtorId (FK)──┼──► usuários_local
    │    createdAt (text) │
    │    updatedAt (text) │
    └──────────┬──────────┘
               │ 1
               │
               │ N
    ┌──────────▼──────────┐
    │ talhoes_local       │
    ├─────────────────────┤
    │ PK id (int)         │
    │    nome (text)      │
    │    fazendasId (FK)──┼──► fazendas_local
    │    cultura (text)   │
    │    createdAt (text) │
    │    updatedAt (text) │
    └──────────┬──────────┘
               │ 1
               │
               │ N
    ┌──────────▼──────────────┐
    │ eventos_manejo_local    │
    ├─────────────────────────┤
    │ PK id (int)             │
    │    talhaoId (FK)────────┼──► talhoes_local
    │    tipoEvento (text)    │
    │    dataEvento (text)    │
    │    createdAt (text)     │
    │    updatedAt (text)     │
    └─────────────────────────┘

Controle de Sync:

┌─────────────────────────┐
│   sync_queue            │
├─────────────────────────┤
│ PK id (int, auto)       │
│    localId (text)       │◄──► uuid local or temp id
│    entityType (text)    │    (CREATE/UPDATE/DELETE)
│    operation (text)     │
│    payload (text-JSON)  │
│    status (text)        │    PENDING/SUCCESS/ERROR/CONFLICT
│    version (int)        │    OCC field
│    checksum (text)      │    SHA-256(payload)
│    originDevice (text)  │◄──► uuid do dispositivo
│    createdAt (text)     │
│    lastAttemptAt (text) │    último retry
│    retryCount (int)     │    contador de retentativas
│    errorMessage (text)  │    descrição do erro
└─────────────────────────┘

┌─────────────────────────┐
│   id_mapping            │
├─────────────────────────┤
│ PK localUuid (text)     │
│    remoteId (int)       │◄──► após CREATE bem-sucedido
│    entityType (text)    │
│    syncedAt (text)      │
└─────────────────────────┘

┌─────────────────────────┐
│   sync_log              │
├─────────────────────────┤
│ PK id (int, auto)       │
│    syncId (text)        │◄──► UUID de cada sessão de sync
│    startedAt (text)     │
│    finishedAt (text)    │
│    totalItems (int)     │
│    success (int)        │
│    conflicts (int)      │
│    errors (int)         │
│    status (text)        │    RUNNING/DONE/PARTIAL/FAILED
└─────────────────────────┘
```

## Conflict Resolution Decision Tree

```
        Conflito Detectado
               │
               ▼
        ┌─────────────┐
        │ Estratégia? │
        └────┬────────┘
             │
    ┌────────┼────────┬────────┬──────────┐
    │        │        │        │          │
    ▼        ▼        ▼        ▼          ▼
   LWW     SERVER  CLIENT    MANUAL     OTHER
    │        │        │        │          │
    └─ Comp. localTime    Always  User  Default
      Date    >remote?    Remote  Choice  to LWW
      │        │         │       │
      Yes      Yes       Yes     │
      │         │         │       │
      ▼         ▼         ▼       ▼
    LOCAL   REMOTE    LOCAL    MERGE
    Wins    Wins      Wins    Preview
    │       │         │       │
    └───────┴─────────┴───────┘
           │
           ▼
      Resolved Data
      Registered in
      sync_log & audit
```

## Retry Backoff Timeline

```
Request 1 (immediate)
│
├─ FAIL (e.g., 503 Server Error)
│
├─ Wait 30 seconds ⏱️
│
Request 2 (after 30s)
│
├─ FAIL (e.g., timeout)
│
├─ Wait 2 minutes ⏱️
│
Request 3 (after 2:30 total)
│
├─ FAIL (e.g., 502 Bad Gateway)
│
├─ Wait 10 minutes ⏱️
│
Request 4 (after 12:30 total)
│
├─ FAIL
│
├─ Move to DEAD_LETTER
├─ Notify user
└─ Manual intervention required
```
