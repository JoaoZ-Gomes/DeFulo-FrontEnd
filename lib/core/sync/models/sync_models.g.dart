// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyncItemImpl _$$SyncItemImplFromJson(Map<String, dynamic> json) =>
    _$SyncItemImpl(
      localId: json['localId'] as String,
      entityType: json['entityType'] as String,
      operation: json['operation'] as String,
      payload: json['payload'] as Map<String, dynamic>,
      localVersion: (json['localVersion'] as num).toInt(),
      checksum: json['checksum'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$SyncItemImplToJson(_$SyncItemImpl instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'entityType': instance.entityType,
      'operation': instance.operation,
      'payload': instance.payload,
      'localVersion': instance.localVersion,
      'checksum': instance.checksum,
      'createdAt': instance.createdAt,
    };

_$SyncPushRequestImpl _$$SyncPushRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncPushRequestImpl(
      deviceId: json['deviceId'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => SyncItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SyncPushRequestImplToJson(
        _$SyncPushRequestImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'items': instance.items,
    };

_$SyncItemResponseImpl _$$SyncItemResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncItemResponseImpl(
      localId: json['localId'] as String,
      status: json['status'] as String,
      remoteId: (json['remoteId'] as num?)?.toInt(),
      errorMessage: json['errorMessage'] as String?,
      remoteData: json['remoteData'] as Map<String, dynamic>?,
      remoteVersion: (json['remoteVersion'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SyncItemResponseImplToJson(
        _$SyncItemResponseImpl instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'status': instance.status,
      'remoteId': instance.remoteId,
      'errorMessage': instance.errorMessage,
      'remoteData': instance.remoteData,
      'remoteVersion': instance.remoteVersion,
    };

_$SyncPushResponseImpl _$$SyncPushResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncPushResponseImpl(
      syncId: json['syncId'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => SyncItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalProcessed: (json['totalProcessed'] as num).toInt(),
      successCount: (json['successCount'] as num).toInt(),
      conflictCount: (json['conflictCount'] as num).toInt(),
      errorCount: (json['errorCount'] as num).toInt(),
    );

Map<String, dynamic> _$$SyncPushResponseImplToJson(
        _$SyncPushResponseImpl instance) =>
    <String, dynamic>{
      'syncId': instance.syncId,
      'items': instance.items,
      'totalProcessed': instance.totalProcessed,
      'successCount': instance.successCount,
      'conflictCount': instance.conflictCount,
      'errorCount': instance.errorCount,
    };

_$SyncPullRequestImpl _$$SyncPullRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncPullRequestImpl(
      since: DateTime.parse(json['since'] as String),
      entityType: json['entityType'] as String?,
    );

Map<String, dynamic> _$$SyncPullRequestImplToJson(
        _$SyncPullRequestImpl instance) =>
    <String, dynamic>{
      'since': instance.since.toIso8601String(),
      'entityType': instance.entityType,
    };

_$SyncPullItemImpl _$$SyncPullItemImplFromJson(Map<String, dynamic> json) =>
    _$SyncPullItemImpl(
      remoteId: (json['remoteId'] as num).toInt(),
      entityType: json['entityType'] as String,
      operation: json['operation'] as String,
      data: json['data'] as Map<String, dynamic>?,
      updatedAt: json['updatedAt'] as String,
      version: (json['version'] as num).toInt(),
    );

Map<String, dynamic> _$$SyncPullItemImplToJson(_$SyncPullItemImpl instance) =>
    <String, dynamic>{
      'remoteId': instance.remoteId,
      'entityType': instance.entityType,
      'operation': instance.operation,
      'data': instance.data,
      'updatedAt': instance.updatedAt,
      'version': instance.version,
    };

_$SyncPullResponseImpl _$$SyncPullResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncPullResponseImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => SyncPullItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      serverTimestamp: json['serverTimestamp'] as String,
    );

Map<String, dynamic> _$$SyncPullResponseImplToJson(
        _$SyncPullResponseImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'serverTimestamp': instance.serverTimestamp,
    };

_$SyncStatusImpl _$$SyncStatusImplFromJson(Map<String, dynamic> json) =>
    _$SyncStatusImpl(
      deviceId: json['deviceId'] as String,
      lastSyncId: json['lastSyncId'] as String,
      lastSyncStatus: json['lastSyncStatus'] as String,
      lastSyncTimestamp: json['lastSyncTimestamp'] as String,
      pendingItemsCount: (json['pendingItemsCount'] as num).toInt(),
    );

Map<String, dynamic> _$$SyncStatusImplToJson(_$SyncStatusImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'lastSyncId': instance.lastSyncId,
      'lastSyncStatus': instance.lastSyncStatus,
      'lastSyncTimestamp': instance.lastSyncTimestamp,
      'pendingItemsCount': instance.pendingItemsCount,
    };

_$SyncLogEntryImpl _$$SyncLogEntryImplFromJson(Map<String, dynamic> json) =>
    _$SyncLogEntryImpl(
      syncId: json['syncId'] as String,
      startedAt: json['startedAt'] as String,
      finishedAt: json['finishedAt'] as String?,
      totalItems: (json['totalItems'] as num).toInt(),
      successCount: (json['successCount'] as num).toInt(),
      conflictCount: (json['conflictCount'] as num).toInt(),
      errorCount: (json['errorCount'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$SyncLogEntryImplToJson(_$SyncLogEntryImpl instance) =>
    <String, dynamic>{
      'syncId': instance.syncId,
      'startedAt': instance.startedAt,
      'finishedAt': instance.finishedAt,
      'totalItems': instance.totalItems,
      'successCount': instance.successCount,
      'conflictCount': instance.conflictCount,
      'errorCount': instance.errorCount,
      'status': instance.status,
    };
