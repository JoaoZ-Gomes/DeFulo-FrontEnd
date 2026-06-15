import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_models.freezed.dart';
part 'sync_models.g.dart';

/// Item individual de sincronização a ser enviado ao servidor
@freezed
class SyncItem with _$SyncItem {
  const factory SyncItem({
    required String localId,           // UUID local ou ID temporário
    required String entityType,        // 'usuario', 'fazenda', 'talhao', 'evento'
    required String operation,         // 'CREATE', 'UPDATE', 'DELETE'
    required Map<String, dynamic> payload,
    required int localVersion,         // Versão local para OCC
    required String checksum,          // SHA-256 do payload
    required String createdAt,         // ISO 8601
  }) = _SyncItem;

  factory SyncItem.fromJson(Map<String, dynamic> json) =>
      _$SyncItemFromJson(json);
}

/// Requisição de push enviada ao servidor
@freezed
class SyncPushRequest with _$SyncPushRequest {
  const factory SyncPushRequest({
    required String deviceId,          // UUID do dispositivo
    required List<SyncItem> items,     // Lote de operações
  }) = _SyncPushRequest;

  factory SyncPushRequest.fromJson(Map<String, dynamic> json) =>
      _$SyncPushRequestFromJson(json);
}

/// Resposta individual do servidor para cada item
@freezed
class SyncItemResponse with _$SyncItemResponse {
  const factory SyncItemResponse({
    required String localId,
    required String status,            // 'SUCCESS' | 'CONFLICT' | 'ERROR'
    int? remoteId,                     // ID real do servidor (para CREATE)
    String? errorMessage,
    Map<String, dynamic>? remoteData,  // Para resolver conflitos
    int? remoteVersion,                // Versão remota (para OCC)
  }) = _SyncItemResponse;

  factory SyncItemResponse.fromJson(Map<String, dynamic> json) =>
      _$SyncItemResponseFromJson(json);
}

/// Resposta completa do servidor para push
@freezed
class SyncPushResponse with _$SyncPushResponse {
  const factory SyncPushResponse({
    required String syncId,            // UUID da sessão de sync
    required List<SyncItemResponse> items,
    required int totalProcessed,
    required int successCount,
    required int conflictCount,
    required int errorCount,
  }) = _SyncPushResponse;

  factory SyncPushResponse.fromJson(Map<String, dynamic> json) =>
      _$SyncPushResponseFromJson(json);
}

/// Requisição de pull (fetch de dados modificados)
@freezed
class SyncPullRequest with _$SyncPullRequest {
  const factory SyncPullRequest({
    required DateTime since,           // Buscar registros modificados após este timestamp
    String? entityType,                // Opcional: filtrar por tipo de entidade
  }) = _SyncPullRequest;

  factory SyncPullRequest.fromJson(Map<String, dynamic> json) =>
      _$SyncPullRequestFromJson(json);
}

/// Item de resposta do pull
@freezed
class SyncPullItem with _$SyncPullItem {
  const factory SyncPullItem({
    required int remoteId,
    required String entityType,
    required String operation,         // 'CREATE' | 'UPDATE' | 'DELETE'
    Map<String, dynamic>? data,
    required String updatedAt,
    required int version,
  }) = _SyncPullItem;

  factory SyncPullItem.fromJson(Map<String, dynamic> json) =>
      _$SyncPullItemFromJson(json);
}

/// Resposta completa do pull
@freezed
class SyncPullResponse with _$SyncPullResponse {
  const factory SyncPullResponse({
    required List<SyncPullItem> items,
    required String serverTimestamp,   // Timestamp do servidor para usar como next "since"
  }) = _SyncPullResponse;

  factory SyncPullResponse.fromJson(Map<String, dynamic> json) =>
      _$SyncPullResponseFromJson(json);
}

/// Status de sincronização de um dispositivo
@freezed
class SyncStatus with _$SyncStatus {
  const factory SyncStatus({
    required String deviceId,
    required String lastSyncId,
    required String lastSyncStatus,    // 'RUNNING' | 'DONE' | 'PARTIAL' | 'FAILED'
    required String lastSyncTimestamp,
    required int pendingItemsCount,
  }) = _SyncStatus;

  factory SyncStatus.fromJson(Map<String, dynamic> json) =>
      _$SyncStatusFromJson(json);
}

/// Log de sincronização
@freezed
class SyncLogEntry with _$SyncLogEntry {
  const factory SyncLogEntry({
    required String syncId,
    required String startedAt,
    String? finishedAt,
    required int totalItems,
    required int successCount,
    required int conflictCount,
    required int errorCount,
    required String status,
  }) = _SyncLogEntry;

  factory SyncLogEntry.fromJson(Map<String, dynamic> json) =>
      _$SyncLogEntryFromJson(json);
}
