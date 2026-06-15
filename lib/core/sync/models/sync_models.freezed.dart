// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SyncItem _$SyncItemFromJson(Map<String, dynamic> json) {
  return _SyncItem.fromJson(json);
}

/// @nodoc
mixin _$SyncItem {
  String get localId =>
      throw _privateConstructorUsedError; // UUID local ou ID temporário
  String get entityType =>
      throw _privateConstructorUsedError; // 'usuario', 'fazenda', 'talhao', 'evento'
  String get operation =>
      throw _privateConstructorUsedError; // 'CREATE', 'UPDATE', 'DELETE'
  Map<String, dynamic> get payload => throw _privateConstructorUsedError;
  int get localVersion =>
      throw _privateConstructorUsedError; // Versão local para OCC
  String get checksum =>
      throw _privateConstructorUsedError; // SHA-256 do payload
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncItemCopyWith<SyncItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncItemCopyWith<$Res> {
  factory $SyncItemCopyWith(SyncItem value, $Res Function(SyncItem) then) =
      _$SyncItemCopyWithImpl<$Res, SyncItem>;
  @useResult
  $Res call(
      {String localId,
      String entityType,
      String operation,
      Map<String, dynamic> payload,
      int localVersion,
      String checksum,
      String createdAt});
}

/// @nodoc
class _$SyncItemCopyWithImpl<$Res, $Val extends SyncItem>
    implements $SyncItemCopyWith<$Res> {
  _$SyncItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? entityType = null,
    Object? operation = null,
    Object? payload = null,
    Object? localVersion = null,
    Object? checksum = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      localId: null == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      localVersion: null == localVersion
          ? _value.localVersion
          : localVersion // ignore: cast_nullable_to_non_nullable
              as int,
      checksum: null == checksum
          ? _value.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncItemImplCopyWith<$Res>
    implements $SyncItemCopyWith<$Res> {
  factory _$$SyncItemImplCopyWith(
          _$SyncItemImpl value, $Res Function(_$SyncItemImpl) then) =
      __$$SyncItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String localId,
      String entityType,
      String operation,
      Map<String, dynamic> payload,
      int localVersion,
      String checksum,
      String createdAt});
}

/// @nodoc
class __$$SyncItemImplCopyWithImpl<$Res>
    extends _$SyncItemCopyWithImpl<$Res, _$SyncItemImpl>
    implements _$$SyncItemImplCopyWith<$Res> {
  __$$SyncItemImplCopyWithImpl(
      _$SyncItemImpl _value, $Res Function(_$SyncItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? entityType = null,
    Object? operation = null,
    Object? payload = null,
    Object? localVersion = null,
    Object? checksum = null,
    Object? createdAt = null,
  }) {
    return _then(_$SyncItemImpl(
      localId: null == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      localVersion: null == localVersion
          ? _value.localVersion
          : localVersion // ignore: cast_nullable_to_non_nullable
              as int,
      checksum: null == checksum
          ? _value.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncItemImpl implements _SyncItem {
  const _$SyncItemImpl(
      {required this.localId,
      required this.entityType,
      required this.operation,
      required final Map<String, dynamic> payload,
      required this.localVersion,
      required this.checksum,
      required this.createdAt})
      : _payload = payload;

  factory _$SyncItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncItemImplFromJson(json);

  @override
  final String localId;
// UUID local ou ID temporário
  @override
  final String entityType;
// 'usuario', 'fazenda', 'talhao', 'evento'
  @override
  final String operation;
// 'CREATE', 'UPDATE', 'DELETE'
  final Map<String, dynamic> _payload;
// 'CREATE', 'UPDATE', 'DELETE'
  @override
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  @override
  final int localVersion;
// Versão local para OCC
  @override
  final String checksum;
// SHA-256 do payload
  @override
  final String createdAt;

  @override
  String toString() {
    return 'SyncItem(localId: $localId, entityType: $entityType, operation: $operation, payload: $payload, localVersion: $localVersion, checksum: $checksum, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncItemImpl &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            const DeepCollectionEquality().equals(other._payload, _payload) &&
            (identical(other.localVersion, localVersion) ||
                other.localVersion == localVersion) &&
            (identical(other.checksum, checksum) ||
                other.checksum == checksum) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      localId,
      entityType,
      operation,
      const DeepCollectionEquality().hash(_payload),
      localVersion,
      checksum,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncItemImplCopyWith<_$SyncItemImpl> get copyWith =>
      __$$SyncItemImplCopyWithImpl<_$SyncItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncItemImplToJson(
      this,
    );
  }
}

abstract class _SyncItem implements SyncItem {
  const factory _SyncItem(
      {required final String localId,
      required final String entityType,
      required final String operation,
      required final Map<String, dynamic> payload,
      required final int localVersion,
      required final String checksum,
      required final String createdAt}) = _$SyncItemImpl;

  factory _SyncItem.fromJson(Map<String, dynamic> json) =
      _$SyncItemImpl.fromJson;

  @override
  String get localId;
  @override // UUID local ou ID temporário
  String get entityType;
  @override // 'usuario', 'fazenda', 'talhao', 'evento'
  String get operation;
  @override // 'CREATE', 'UPDATE', 'DELETE'
  Map<String, dynamic> get payload;
  @override
  int get localVersion;
  @override // Versão local para OCC
  String get checksum;
  @override // SHA-256 do payload
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$SyncItemImplCopyWith<_$SyncItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SyncPushRequest _$SyncPushRequestFromJson(Map<String, dynamic> json) {
  return _SyncPushRequest.fromJson(json);
}

/// @nodoc
mixin _$SyncPushRequest {
  String get deviceId =>
      throw _privateConstructorUsedError; // UUID do dispositivo
  List<SyncItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncPushRequestCopyWith<SyncPushRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncPushRequestCopyWith<$Res> {
  factory $SyncPushRequestCopyWith(
          SyncPushRequest value, $Res Function(SyncPushRequest) then) =
      _$SyncPushRequestCopyWithImpl<$Res, SyncPushRequest>;
  @useResult
  $Res call({String deviceId, List<SyncItem> items});
}

/// @nodoc
class _$SyncPushRequestCopyWithImpl<$Res, $Val extends SyncPushRequest>
    implements $SyncPushRequestCopyWith<$Res> {
  _$SyncPushRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SyncItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncPushRequestImplCopyWith<$Res>
    implements $SyncPushRequestCopyWith<$Res> {
  factory _$$SyncPushRequestImplCopyWith(_$SyncPushRequestImpl value,
          $Res Function(_$SyncPushRequestImpl) then) =
      __$$SyncPushRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String deviceId, List<SyncItem> items});
}

/// @nodoc
class __$$SyncPushRequestImplCopyWithImpl<$Res>
    extends _$SyncPushRequestCopyWithImpl<$Res, _$SyncPushRequestImpl>
    implements _$$SyncPushRequestImplCopyWith<$Res> {
  __$$SyncPushRequestImplCopyWithImpl(
      _$SyncPushRequestImpl _value, $Res Function(_$SyncPushRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? items = null,
  }) {
    return _then(_$SyncPushRequestImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SyncItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncPushRequestImpl implements _SyncPushRequest {
  const _$SyncPushRequestImpl(
      {required this.deviceId, required final List<SyncItem> items})
      : _items = items;

  factory _$SyncPushRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncPushRequestImplFromJson(json);

  @override
  final String deviceId;
// UUID do dispositivo
  final List<SyncItem> _items;
// UUID do dispositivo
  @override
  List<SyncItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'SyncPushRequest(deviceId: $deviceId, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncPushRequestImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, deviceId, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncPushRequestImplCopyWith<_$SyncPushRequestImpl> get copyWith =>
      __$$SyncPushRequestImplCopyWithImpl<_$SyncPushRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncPushRequestImplToJson(
      this,
    );
  }
}

abstract class _SyncPushRequest implements SyncPushRequest {
  const factory _SyncPushRequest(
      {required final String deviceId,
      required final List<SyncItem> items}) = _$SyncPushRequestImpl;

  factory _SyncPushRequest.fromJson(Map<String, dynamic> json) =
      _$SyncPushRequestImpl.fromJson;

  @override
  String get deviceId;
  @override // UUID do dispositivo
  List<SyncItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$SyncPushRequestImplCopyWith<_$SyncPushRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SyncItemResponse _$SyncItemResponseFromJson(Map<String, dynamic> json) {
  return _SyncItemResponse.fromJson(json);
}

/// @nodoc
mixin _$SyncItemResponse {
  String get localId => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // 'SUCCESS' | 'CONFLICT' | 'ERROR'
  int? get remoteId =>
      throw _privateConstructorUsedError; // ID real do servidor (para CREATE)
  String? get errorMessage => throw _privateConstructorUsedError;
  Map<String, dynamic>? get remoteData =>
      throw _privateConstructorUsedError; // Para resolver conflitos
  int? get remoteVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncItemResponseCopyWith<SyncItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncItemResponseCopyWith<$Res> {
  factory $SyncItemResponseCopyWith(
          SyncItemResponse value, $Res Function(SyncItemResponse) then) =
      _$SyncItemResponseCopyWithImpl<$Res, SyncItemResponse>;
  @useResult
  $Res call(
      {String localId,
      String status,
      int? remoteId,
      String? errorMessage,
      Map<String, dynamic>? remoteData,
      int? remoteVersion});
}

/// @nodoc
class _$SyncItemResponseCopyWithImpl<$Res, $Val extends SyncItemResponse>
    implements $SyncItemResponseCopyWith<$Res> {
  _$SyncItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? status = null,
    Object? remoteId = freezed,
    Object? errorMessage = freezed,
    Object? remoteData = freezed,
    Object? remoteVersion = freezed,
  }) {
    return _then(_value.copyWith(
      localId: null == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      remoteId: freezed == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      remoteData: freezed == remoteData
          ? _value.remoteData
          : remoteData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      remoteVersion: freezed == remoteVersion
          ? _value.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncItemResponseImplCopyWith<$Res>
    implements $SyncItemResponseCopyWith<$Res> {
  factory _$$SyncItemResponseImplCopyWith(_$SyncItemResponseImpl value,
          $Res Function(_$SyncItemResponseImpl) then) =
      __$$SyncItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String localId,
      String status,
      int? remoteId,
      String? errorMessage,
      Map<String, dynamic>? remoteData,
      int? remoteVersion});
}

/// @nodoc
class __$$SyncItemResponseImplCopyWithImpl<$Res>
    extends _$SyncItemResponseCopyWithImpl<$Res, _$SyncItemResponseImpl>
    implements _$$SyncItemResponseImplCopyWith<$Res> {
  __$$SyncItemResponseImplCopyWithImpl(_$SyncItemResponseImpl _value,
      $Res Function(_$SyncItemResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? status = null,
    Object? remoteId = freezed,
    Object? errorMessage = freezed,
    Object? remoteData = freezed,
    Object? remoteVersion = freezed,
  }) {
    return _then(_$SyncItemResponseImpl(
      localId: null == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      remoteId: freezed == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      remoteData: freezed == remoteData
          ? _value._remoteData
          : remoteData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      remoteVersion: freezed == remoteVersion
          ? _value.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncItemResponseImpl implements _SyncItemResponse {
  const _$SyncItemResponseImpl(
      {required this.localId,
      required this.status,
      this.remoteId,
      this.errorMessage,
      final Map<String, dynamic>? remoteData,
      this.remoteVersion})
      : _remoteData = remoteData;

  factory _$SyncItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncItemResponseImplFromJson(json);

  @override
  final String localId;
  @override
  final String status;
// 'SUCCESS' | 'CONFLICT' | 'ERROR'
  @override
  final int? remoteId;
// ID real do servidor (para CREATE)
  @override
  final String? errorMessage;
  final Map<String, dynamic>? _remoteData;
  @override
  Map<String, dynamic>? get remoteData {
    final value = _remoteData;
    if (value == null) return null;
    if (_remoteData is EqualUnmodifiableMapView) return _remoteData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

// Para resolver conflitos
  @override
  final int? remoteVersion;

  @override
  String toString() {
    return 'SyncItemResponse(localId: $localId, status: $status, remoteId: $remoteId, errorMessage: $errorMessage, remoteData: $remoteData, remoteVersion: $remoteVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncItemResponseImpl &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._remoteData, _remoteData) &&
            (identical(other.remoteVersion, remoteVersion) ||
                other.remoteVersion == remoteVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      localId,
      status,
      remoteId,
      errorMessage,
      const DeepCollectionEquality().hash(_remoteData),
      remoteVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncItemResponseImplCopyWith<_$SyncItemResponseImpl> get copyWith =>
      __$$SyncItemResponseImplCopyWithImpl<_$SyncItemResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncItemResponseImplToJson(
      this,
    );
  }
}

abstract class _SyncItemResponse implements SyncItemResponse {
  const factory _SyncItemResponse(
      {required final String localId,
      required final String status,
      final int? remoteId,
      final String? errorMessage,
      final Map<String, dynamic>? remoteData,
      final int? remoteVersion}) = _$SyncItemResponseImpl;

  factory _SyncItemResponse.fromJson(Map<String, dynamic> json) =
      _$SyncItemResponseImpl.fromJson;

  @override
  String get localId;
  @override
  String get status;
  @override // 'SUCCESS' | 'CONFLICT' | 'ERROR'
  int? get remoteId;
  @override // ID real do servidor (para CREATE)
  String? get errorMessage;
  @override
  Map<String, dynamic>? get remoteData;
  @override // Para resolver conflitos
  int? get remoteVersion;
  @override
  @JsonKey(ignore: true)
  _$$SyncItemResponseImplCopyWith<_$SyncItemResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SyncPushResponse _$SyncPushResponseFromJson(Map<String, dynamic> json) {
  return _SyncPushResponse.fromJson(json);
}

/// @nodoc
mixin _$SyncPushResponse {
  String get syncId =>
      throw _privateConstructorUsedError; // UUID da sessão de sync
  List<SyncItemResponse> get items => throw _privateConstructorUsedError;
  int get totalProcessed => throw _privateConstructorUsedError;
  int get successCount => throw _privateConstructorUsedError;
  int get conflictCount => throw _privateConstructorUsedError;
  int get errorCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncPushResponseCopyWith<SyncPushResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncPushResponseCopyWith<$Res> {
  factory $SyncPushResponseCopyWith(
          SyncPushResponse value, $Res Function(SyncPushResponse) then) =
      _$SyncPushResponseCopyWithImpl<$Res, SyncPushResponse>;
  @useResult
  $Res call(
      {String syncId,
      List<SyncItemResponse> items,
      int totalProcessed,
      int successCount,
      int conflictCount,
      int errorCount});
}

/// @nodoc
class _$SyncPushResponseCopyWithImpl<$Res, $Val extends SyncPushResponse>
    implements $SyncPushResponseCopyWith<$Res> {
  _$SyncPushResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? syncId = null,
    Object? items = null,
    Object? totalProcessed = null,
    Object? successCount = null,
    Object? conflictCount = null,
    Object? errorCount = null,
  }) {
    return _then(_value.copyWith(
      syncId: null == syncId
          ? _value.syncId
          : syncId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SyncItemResponse>,
      totalProcessed: null == totalProcessed
          ? _value.totalProcessed
          : totalProcessed // ignore: cast_nullable_to_non_nullable
              as int,
      successCount: null == successCount
          ? _value.successCount
          : successCount // ignore: cast_nullable_to_non_nullable
              as int,
      conflictCount: null == conflictCount
          ? _value.conflictCount
          : conflictCount // ignore: cast_nullable_to_non_nullable
              as int,
      errorCount: null == errorCount
          ? _value.errorCount
          : errorCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncPushResponseImplCopyWith<$Res>
    implements $SyncPushResponseCopyWith<$Res> {
  factory _$$SyncPushResponseImplCopyWith(_$SyncPushResponseImpl value,
          $Res Function(_$SyncPushResponseImpl) then) =
      __$$SyncPushResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String syncId,
      List<SyncItemResponse> items,
      int totalProcessed,
      int successCount,
      int conflictCount,
      int errorCount});
}

/// @nodoc
class __$$SyncPushResponseImplCopyWithImpl<$Res>
    extends _$SyncPushResponseCopyWithImpl<$Res, _$SyncPushResponseImpl>
    implements _$$SyncPushResponseImplCopyWith<$Res> {
  __$$SyncPushResponseImplCopyWithImpl(_$SyncPushResponseImpl _value,
      $Res Function(_$SyncPushResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? syncId = null,
    Object? items = null,
    Object? totalProcessed = null,
    Object? successCount = null,
    Object? conflictCount = null,
    Object? errorCount = null,
  }) {
    return _then(_$SyncPushResponseImpl(
      syncId: null == syncId
          ? _value.syncId
          : syncId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SyncItemResponse>,
      totalProcessed: null == totalProcessed
          ? _value.totalProcessed
          : totalProcessed // ignore: cast_nullable_to_non_nullable
              as int,
      successCount: null == successCount
          ? _value.successCount
          : successCount // ignore: cast_nullable_to_non_nullable
              as int,
      conflictCount: null == conflictCount
          ? _value.conflictCount
          : conflictCount // ignore: cast_nullable_to_non_nullable
              as int,
      errorCount: null == errorCount
          ? _value.errorCount
          : errorCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncPushResponseImpl implements _SyncPushResponse {
  const _$SyncPushResponseImpl(
      {required this.syncId,
      required final List<SyncItemResponse> items,
      required this.totalProcessed,
      required this.successCount,
      required this.conflictCount,
      required this.errorCount})
      : _items = items;

  factory _$SyncPushResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncPushResponseImplFromJson(json);

  @override
  final String syncId;
// UUID da sessão de sync
  final List<SyncItemResponse> _items;
// UUID da sessão de sync
  @override
  List<SyncItemResponse> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int totalProcessed;
  @override
  final int successCount;
  @override
  final int conflictCount;
  @override
  final int errorCount;

  @override
  String toString() {
    return 'SyncPushResponse(syncId: $syncId, items: $items, totalProcessed: $totalProcessed, successCount: $successCount, conflictCount: $conflictCount, errorCount: $errorCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncPushResponseImpl &&
            (identical(other.syncId, syncId) || other.syncId == syncId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalProcessed, totalProcessed) ||
                other.totalProcessed == totalProcessed) &&
            (identical(other.successCount, successCount) ||
                other.successCount == successCount) &&
            (identical(other.conflictCount, conflictCount) ||
                other.conflictCount == conflictCount) &&
            (identical(other.errorCount, errorCount) ||
                other.errorCount == errorCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      syncId,
      const DeepCollectionEquality().hash(_items),
      totalProcessed,
      successCount,
      conflictCount,
      errorCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncPushResponseImplCopyWith<_$SyncPushResponseImpl> get copyWith =>
      __$$SyncPushResponseImplCopyWithImpl<_$SyncPushResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncPushResponseImplToJson(
      this,
    );
  }
}

abstract class _SyncPushResponse implements SyncPushResponse {
  const factory _SyncPushResponse(
      {required final String syncId,
      required final List<SyncItemResponse> items,
      required final int totalProcessed,
      required final int successCount,
      required final int conflictCount,
      required final int errorCount}) = _$SyncPushResponseImpl;

  factory _SyncPushResponse.fromJson(Map<String, dynamic> json) =
      _$SyncPushResponseImpl.fromJson;

  @override
  String get syncId;
  @override // UUID da sessão de sync
  List<SyncItemResponse> get items;
  @override
  int get totalProcessed;
  @override
  int get successCount;
  @override
  int get conflictCount;
  @override
  int get errorCount;
  @override
  @JsonKey(ignore: true)
  _$$SyncPushResponseImplCopyWith<_$SyncPushResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SyncPullRequest _$SyncPullRequestFromJson(Map<String, dynamic> json) {
  return _SyncPullRequest.fromJson(json);
}

/// @nodoc
mixin _$SyncPullRequest {
  DateTime get since =>
      throw _privateConstructorUsedError; // Buscar registros modificados após este timestamp
  String? get entityType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncPullRequestCopyWith<SyncPullRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncPullRequestCopyWith<$Res> {
  factory $SyncPullRequestCopyWith(
          SyncPullRequest value, $Res Function(SyncPullRequest) then) =
      _$SyncPullRequestCopyWithImpl<$Res, SyncPullRequest>;
  @useResult
  $Res call({DateTime since, String? entityType});
}

/// @nodoc
class _$SyncPullRequestCopyWithImpl<$Res, $Val extends SyncPullRequest>
    implements $SyncPullRequestCopyWith<$Res> {
  _$SyncPullRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? since = null,
    Object? entityType = freezed,
  }) {
    return _then(_value.copyWith(
      since: null == since
          ? _value.since
          : since // ignore: cast_nullable_to_non_nullable
              as DateTime,
      entityType: freezed == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncPullRequestImplCopyWith<$Res>
    implements $SyncPullRequestCopyWith<$Res> {
  factory _$$SyncPullRequestImplCopyWith(_$SyncPullRequestImpl value,
          $Res Function(_$SyncPullRequestImpl) then) =
      __$$SyncPullRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime since, String? entityType});
}

/// @nodoc
class __$$SyncPullRequestImplCopyWithImpl<$Res>
    extends _$SyncPullRequestCopyWithImpl<$Res, _$SyncPullRequestImpl>
    implements _$$SyncPullRequestImplCopyWith<$Res> {
  __$$SyncPullRequestImplCopyWithImpl(
      _$SyncPullRequestImpl _value, $Res Function(_$SyncPullRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? since = null,
    Object? entityType = freezed,
  }) {
    return _then(_$SyncPullRequestImpl(
      since: null == since
          ? _value.since
          : since // ignore: cast_nullable_to_non_nullable
              as DateTime,
      entityType: freezed == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncPullRequestImpl implements _SyncPullRequest {
  const _$SyncPullRequestImpl({required this.since, this.entityType});

  factory _$SyncPullRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncPullRequestImplFromJson(json);

  @override
  final DateTime since;
// Buscar registros modificados após este timestamp
  @override
  final String? entityType;

  @override
  String toString() {
    return 'SyncPullRequest(since: $since, entityType: $entityType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncPullRequestImpl &&
            (identical(other.since, since) || other.since == since) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, since, entityType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncPullRequestImplCopyWith<_$SyncPullRequestImpl> get copyWith =>
      __$$SyncPullRequestImplCopyWithImpl<_$SyncPullRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncPullRequestImplToJson(
      this,
    );
  }
}

abstract class _SyncPullRequest implements SyncPullRequest {
  const factory _SyncPullRequest(
      {required final DateTime since,
      final String? entityType}) = _$SyncPullRequestImpl;

  factory _SyncPullRequest.fromJson(Map<String, dynamic> json) =
      _$SyncPullRequestImpl.fromJson;

  @override
  DateTime get since;
  @override // Buscar registros modificados após este timestamp
  String? get entityType;
  @override
  @JsonKey(ignore: true)
  _$$SyncPullRequestImplCopyWith<_$SyncPullRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SyncPullItem _$SyncPullItemFromJson(Map<String, dynamic> json) {
  return _SyncPullItem.fromJson(json);
}

/// @nodoc
mixin _$SyncPullItem {
  int get remoteId => throw _privateConstructorUsedError;
  String get entityType => throw _privateConstructorUsedError;
  String get operation =>
      throw _privateConstructorUsedError; // 'CREATE' | 'UPDATE' | 'DELETE'
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncPullItemCopyWith<SyncPullItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncPullItemCopyWith<$Res> {
  factory $SyncPullItemCopyWith(
          SyncPullItem value, $Res Function(SyncPullItem) then) =
      _$SyncPullItemCopyWithImpl<$Res, SyncPullItem>;
  @useResult
  $Res call(
      {int remoteId,
      String entityType,
      String operation,
      Map<String, dynamic>? data,
      String updatedAt,
      int version});
}

/// @nodoc
class _$SyncPullItemCopyWithImpl<$Res, $Val extends SyncPullItem>
    implements $SyncPullItemCopyWith<$Res> {
  _$SyncPullItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteId = null,
    Object? entityType = null,
    Object? operation = null,
    Object? data = freezed,
    Object? updatedAt = null,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      remoteId: null == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as int,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncPullItemImplCopyWith<$Res>
    implements $SyncPullItemCopyWith<$Res> {
  factory _$$SyncPullItemImplCopyWith(
          _$SyncPullItemImpl value, $Res Function(_$SyncPullItemImpl) then) =
      __$$SyncPullItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int remoteId,
      String entityType,
      String operation,
      Map<String, dynamic>? data,
      String updatedAt,
      int version});
}

/// @nodoc
class __$$SyncPullItemImplCopyWithImpl<$Res>
    extends _$SyncPullItemCopyWithImpl<$Res, _$SyncPullItemImpl>
    implements _$$SyncPullItemImplCopyWith<$Res> {
  __$$SyncPullItemImplCopyWithImpl(
      _$SyncPullItemImpl _value, $Res Function(_$SyncPullItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteId = null,
    Object? entityType = null,
    Object? operation = null,
    Object? data = freezed,
    Object? updatedAt = null,
    Object? version = null,
  }) {
    return _then(_$SyncPullItemImpl(
      remoteId: null == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as int,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncPullItemImpl implements _SyncPullItem {
  const _$SyncPullItemImpl(
      {required this.remoteId,
      required this.entityType,
      required this.operation,
      final Map<String, dynamic>? data,
      required this.updatedAt,
      required this.version})
      : _data = data;

  factory _$SyncPullItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncPullItemImplFromJson(json);

  @override
  final int remoteId;
  @override
  final String entityType;
  @override
  final String operation;
// 'CREATE' | 'UPDATE' | 'DELETE'
  final Map<String, dynamic>? _data;
// 'CREATE' | 'UPDATE' | 'DELETE'
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String updatedAt;
  @override
  final int version;

  @override
  String toString() {
    return 'SyncPullItem(remoteId: $remoteId, entityType: $entityType, operation: $operation, data: $data, updatedAt: $updatedAt, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncPullItemImpl &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, remoteId, entityType, operation,
      const DeepCollectionEquality().hash(_data), updatedAt, version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncPullItemImplCopyWith<_$SyncPullItemImpl> get copyWith =>
      __$$SyncPullItemImplCopyWithImpl<_$SyncPullItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncPullItemImplToJson(
      this,
    );
  }
}

abstract class _SyncPullItem implements SyncPullItem {
  const factory _SyncPullItem(
      {required final int remoteId,
      required final String entityType,
      required final String operation,
      final Map<String, dynamic>? data,
      required final String updatedAt,
      required final int version}) = _$SyncPullItemImpl;

  factory _SyncPullItem.fromJson(Map<String, dynamic> json) =
      _$SyncPullItemImpl.fromJson;

  @override
  int get remoteId;
  @override
  String get entityType;
  @override
  String get operation;
  @override // 'CREATE' | 'UPDATE' | 'DELETE'
  Map<String, dynamic>? get data;
  @override
  String get updatedAt;
  @override
  int get version;
  @override
  @JsonKey(ignore: true)
  _$$SyncPullItemImplCopyWith<_$SyncPullItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SyncPullResponse _$SyncPullResponseFromJson(Map<String, dynamic> json) {
  return _SyncPullResponse.fromJson(json);
}

/// @nodoc
mixin _$SyncPullResponse {
  List<SyncPullItem> get items => throw _privateConstructorUsedError;
  String get serverTimestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncPullResponseCopyWith<SyncPullResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncPullResponseCopyWith<$Res> {
  factory $SyncPullResponseCopyWith(
          SyncPullResponse value, $Res Function(SyncPullResponse) then) =
      _$SyncPullResponseCopyWithImpl<$Res, SyncPullResponse>;
  @useResult
  $Res call({List<SyncPullItem> items, String serverTimestamp});
}

/// @nodoc
class _$SyncPullResponseCopyWithImpl<$Res, $Val extends SyncPullResponse>
    implements $SyncPullResponseCopyWith<$Res> {
  _$SyncPullResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? serverTimestamp = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SyncPullItem>,
      serverTimestamp: null == serverTimestamp
          ? _value.serverTimestamp
          : serverTimestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncPullResponseImplCopyWith<$Res>
    implements $SyncPullResponseCopyWith<$Res> {
  factory _$$SyncPullResponseImplCopyWith(_$SyncPullResponseImpl value,
          $Res Function(_$SyncPullResponseImpl) then) =
      __$$SyncPullResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SyncPullItem> items, String serverTimestamp});
}

/// @nodoc
class __$$SyncPullResponseImplCopyWithImpl<$Res>
    extends _$SyncPullResponseCopyWithImpl<$Res, _$SyncPullResponseImpl>
    implements _$$SyncPullResponseImplCopyWith<$Res> {
  __$$SyncPullResponseImplCopyWithImpl(_$SyncPullResponseImpl _value,
      $Res Function(_$SyncPullResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? serverTimestamp = null,
  }) {
    return _then(_$SyncPullResponseImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SyncPullItem>,
      serverTimestamp: null == serverTimestamp
          ? _value.serverTimestamp
          : serverTimestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncPullResponseImpl implements _SyncPullResponse {
  const _$SyncPullResponseImpl(
      {required final List<SyncPullItem> items, required this.serverTimestamp})
      : _items = items;

  factory _$SyncPullResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncPullResponseImplFromJson(json);

  final List<SyncPullItem> _items;
  @override
  List<SyncPullItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String serverTimestamp;

  @override
  String toString() {
    return 'SyncPullResponse(items: $items, serverTimestamp: $serverTimestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncPullResponseImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.serverTimestamp, serverTimestamp) ||
                other.serverTimestamp == serverTimestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), serverTimestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncPullResponseImplCopyWith<_$SyncPullResponseImpl> get copyWith =>
      __$$SyncPullResponseImplCopyWithImpl<_$SyncPullResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncPullResponseImplToJson(
      this,
    );
  }
}

abstract class _SyncPullResponse implements SyncPullResponse {
  const factory _SyncPullResponse(
      {required final List<SyncPullItem> items,
      required final String serverTimestamp}) = _$SyncPullResponseImpl;

  factory _SyncPullResponse.fromJson(Map<String, dynamic> json) =
      _$SyncPullResponseImpl.fromJson;

  @override
  List<SyncPullItem> get items;
  @override
  String get serverTimestamp;
  @override
  @JsonKey(ignore: true)
  _$$SyncPullResponseImplCopyWith<_$SyncPullResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SyncStatus _$SyncStatusFromJson(Map<String, dynamic> json) {
  return _SyncStatus.fromJson(json);
}

/// @nodoc
mixin _$SyncStatus {
  String get deviceId => throw _privateConstructorUsedError;
  String get lastSyncId => throw _privateConstructorUsedError;
  String get lastSyncStatus =>
      throw _privateConstructorUsedError; // 'RUNNING' | 'DONE' | 'PARTIAL' | 'FAILED'
  String get lastSyncTimestamp => throw _privateConstructorUsedError;
  int get pendingItemsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncStatusCopyWith<SyncStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncStatusCopyWith<$Res> {
  factory $SyncStatusCopyWith(
          SyncStatus value, $Res Function(SyncStatus) then) =
      _$SyncStatusCopyWithImpl<$Res, SyncStatus>;
  @useResult
  $Res call(
      {String deviceId,
      String lastSyncId,
      String lastSyncStatus,
      String lastSyncTimestamp,
      int pendingItemsCount});
}

/// @nodoc
class _$SyncStatusCopyWithImpl<$Res, $Val extends SyncStatus>
    implements $SyncStatusCopyWith<$Res> {
  _$SyncStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? lastSyncId = null,
    Object? lastSyncStatus = null,
    Object? lastSyncTimestamp = null,
    Object? pendingItemsCount = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      lastSyncId: null == lastSyncId
          ? _value.lastSyncId
          : lastSyncId // ignore: cast_nullable_to_non_nullable
              as String,
      lastSyncStatus: null == lastSyncStatus
          ? _value.lastSyncStatus
          : lastSyncStatus // ignore: cast_nullable_to_non_nullable
              as String,
      lastSyncTimestamp: null == lastSyncTimestamp
          ? _value.lastSyncTimestamp
          : lastSyncTimestamp // ignore: cast_nullable_to_non_nullable
              as String,
      pendingItemsCount: null == pendingItemsCount
          ? _value.pendingItemsCount
          : pendingItemsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncStatusImplCopyWith<$Res>
    implements $SyncStatusCopyWith<$Res> {
  factory _$$SyncStatusImplCopyWith(
          _$SyncStatusImpl value, $Res Function(_$SyncStatusImpl) then) =
      __$$SyncStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deviceId,
      String lastSyncId,
      String lastSyncStatus,
      String lastSyncTimestamp,
      int pendingItemsCount});
}

/// @nodoc
class __$$SyncStatusImplCopyWithImpl<$Res>
    extends _$SyncStatusCopyWithImpl<$Res, _$SyncStatusImpl>
    implements _$$SyncStatusImplCopyWith<$Res> {
  __$$SyncStatusImplCopyWithImpl(
      _$SyncStatusImpl _value, $Res Function(_$SyncStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? lastSyncId = null,
    Object? lastSyncStatus = null,
    Object? lastSyncTimestamp = null,
    Object? pendingItemsCount = null,
  }) {
    return _then(_$SyncStatusImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      lastSyncId: null == lastSyncId
          ? _value.lastSyncId
          : lastSyncId // ignore: cast_nullable_to_non_nullable
              as String,
      lastSyncStatus: null == lastSyncStatus
          ? _value.lastSyncStatus
          : lastSyncStatus // ignore: cast_nullable_to_non_nullable
              as String,
      lastSyncTimestamp: null == lastSyncTimestamp
          ? _value.lastSyncTimestamp
          : lastSyncTimestamp // ignore: cast_nullable_to_non_nullable
              as String,
      pendingItemsCount: null == pendingItemsCount
          ? _value.pendingItemsCount
          : pendingItemsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncStatusImpl implements _SyncStatus {
  const _$SyncStatusImpl(
      {required this.deviceId,
      required this.lastSyncId,
      required this.lastSyncStatus,
      required this.lastSyncTimestamp,
      required this.pendingItemsCount});

  factory _$SyncStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncStatusImplFromJson(json);

  @override
  final String deviceId;
  @override
  final String lastSyncId;
  @override
  final String lastSyncStatus;
// 'RUNNING' | 'DONE' | 'PARTIAL' | 'FAILED'
  @override
  final String lastSyncTimestamp;
  @override
  final int pendingItemsCount;

  @override
  String toString() {
    return 'SyncStatus(deviceId: $deviceId, lastSyncId: $lastSyncId, lastSyncStatus: $lastSyncStatus, lastSyncTimestamp: $lastSyncTimestamp, pendingItemsCount: $pendingItemsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncStatusImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.lastSyncId, lastSyncId) ||
                other.lastSyncId == lastSyncId) &&
            (identical(other.lastSyncStatus, lastSyncStatus) ||
                other.lastSyncStatus == lastSyncStatus) &&
            (identical(other.lastSyncTimestamp, lastSyncTimestamp) ||
                other.lastSyncTimestamp == lastSyncTimestamp) &&
            (identical(other.pendingItemsCount, pendingItemsCount) ||
                other.pendingItemsCount == pendingItemsCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, lastSyncId,
      lastSyncStatus, lastSyncTimestamp, pendingItemsCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncStatusImplCopyWith<_$SyncStatusImpl> get copyWith =>
      __$$SyncStatusImplCopyWithImpl<_$SyncStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncStatusImplToJson(
      this,
    );
  }
}

abstract class _SyncStatus implements SyncStatus {
  const factory _SyncStatus(
      {required final String deviceId,
      required final String lastSyncId,
      required final String lastSyncStatus,
      required final String lastSyncTimestamp,
      required final int pendingItemsCount}) = _$SyncStatusImpl;

  factory _SyncStatus.fromJson(Map<String, dynamic> json) =
      _$SyncStatusImpl.fromJson;

  @override
  String get deviceId;
  @override
  String get lastSyncId;
  @override
  String get lastSyncStatus;
  @override // 'RUNNING' | 'DONE' | 'PARTIAL' | 'FAILED'
  String get lastSyncTimestamp;
  @override
  int get pendingItemsCount;
  @override
  @JsonKey(ignore: true)
  _$$SyncStatusImplCopyWith<_$SyncStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SyncLogEntry _$SyncLogEntryFromJson(Map<String, dynamic> json) {
  return _SyncLogEntry.fromJson(json);
}

/// @nodoc
mixin _$SyncLogEntry {
  String get syncId => throw _privateConstructorUsedError;
  String get startedAt => throw _privateConstructorUsedError;
  String? get finishedAt => throw _privateConstructorUsedError;
  int get totalItems => throw _privateConstructorUsedError;
  int get successCount => throw _privateConstructorUsedError;
  int get conflictCount => throw _privateConstructorUsedError;
  int get errorCount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncLogEntryCopyWith<SyncLogEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncLogEntryCopyWith<$Res> {
  factory $SyncLogEntryCopyWith(
          SyncLogEntry value, $Res Function(SyncLogEntry) then) =
      _$SyncLogEntryCopyWithImpl<$Res, SyncLogEntry>;
  @useResult
  $Res call(
      {String syncId,
      String startedAt,
      String? finishedAt,
      int totalItems,
      int successCount,
      int conflictCount,
      int errorCount,
      String status});
}

/// @nodoc
class _$SyncLogEntryCopyWithImpl<$Res, $Val extends SyncLogEntry>
    implements $SyncLogEntryCopyWith<$Res> {
  _$SyncLogEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? syncId = null,
    Object? startedAt = null,
    Object? finishedAt = freezed,
    Object? totalItems = null,
    Object? successCount = null,
    Object? conflictCount = null,
    Object? errorCount = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      syncId: null == syncId
          ? _value.syncId
          : syncId // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      successCount: null == successCount
          ? _value.successCount
          : successCount // ignore: cast_nullable_to_non_nullable
              as int,
      conflictCount: null == conflictCount
          ? _value.conflictCount
          : conflictCount // ignore: cast_nullable_to_non_nullable
              as int,
      errorCount: null == errorCount
          ? _value.errorCount
          : errorCount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncLogEntryImplCopyWith<$Res>
    implements $SyncLogEntryCopyWith<$Res> {
  factory _$$SyncLogEntryImplCopyWith(
          _$SyncLogEntryImpl value, $Res Function(_$SyncLogEntryImpl) then) =
      __$$SyncLogEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String syncId,
      String startedAt,
      String? finishedAt,
      int totalItems,
      int successCount,
      int conflictCount,
      int errorCount,
      String status});
}

/// @nodoc
class __$$SyncLogEntryImplCopyWithImpl<$Res>
    extends _$SyncLogEntryCopyWithImpl<$Res, _$SyncLogEntryImpl>
    implements _$$SyncLogEntryImplCopyWith<$Res> {
  __$$SyncLogEntryImplCopyWithImpl(
      _$SyncLogEntryImpl _value, $Res Function(_$SyncLogEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? syncId = null,
    Object? startedAt = null,
    Object? finishedAt = freezed,
    Object? totalItems = null,
    Object? successCount = null,
    Object? conflictCount = null,
    Object? errorCount = null,
    Object? status = null,
  }) {
    return _then(_$SyncLogEntryImpl(
      syncId: null == syncId
          ? _value.syncId
          : syncId // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      successCount: null == successCount
          ? _value.successCount
          : successCount // ignore: cast_nullable_to_non_nullable
              as int,
      conflictCount: null == conflictCount
          ? _value.conflictCount
          : conflictCount // ignore: cast_nullable_to_non_nullable
              as int,
      errorCount: null == errorCount
          ? _value.errorCount
          : errorCount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncLogEntryImpl implements _SyncLogEntry {
  const _$SyncLogEntryImpl(
      {required this.syncId,
      required this.startedAt,
      this.finishedAt,
      required this.totalItems,
      required this.successCount,
      required this.conflictCount,
      required this.errorCount,
      required this.status});

  factory _$SyncLogEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncLogEntryImplFromJson(json);

  @override
  final String syncId;
  @override
  final String startedAt;
  @override
  final String? finishedAt;
  @override
  final int totalItems;
  @override
  final int successCount;
  @override
  final int conflictCount;
  @override
  final int errorCount;
  @override
  final String status;

  @override
  String toString() {
    return 'SyncLogEntry(syncId: $syncId, startedAt: $startedAt, finishedAt: $finishedAt, totalItems: $totalItems, successCount: $successCount, conflictCount: $conflictCount, errorCount: $errorCount, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncLogEntryImpl &&
            (identical(other.syncId, syncId) || other.syncId == syncId) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.successCount, successCount) ||
                other.successCount == successCount) &&
            (identical(other.conflictCount, conflictCount) ||
                other.conflictCount == conflictCount) &&
            (identical(other.errorCount, errorCount) ||
                other.errorCount == errorCount) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, syncId, startedAt, finishedAt,
      totalItems, successCount, conflictCount, errorCount, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncLogEntryImplCopyWith<_$SyncLogEntryImpl> get copyWith =>
      __$$SyncLogEntryImplCopyWithImpl<_$SyncLogEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncLogEntryImplToJson(
      this,
    );
  }
}

abstract class _SyncLogEntry implements SyncLogEntry {
  const factory _SyncLogEntry(
      {required final String syncId,
      required final String startedAt,
      final String? finishedAt,
      required final int totalItems,
      required final int successCount,
      required final int conflictCount,
      required final int errorCount,
      required final String status}) = _$SyncLogEntryImpl;

  factory _SyncLogEntry.fromJson(Map<String, dynamic> json) =
      _$SyncLogEntryImpl.fromJson;

  @override
  String get syncId;
  @override
  String get startedAt;
  @override
  String? get finishedAt;
  @override
  int get totalItems;
  @override
  int get successCount;
  @override
  int get conflictCount;
  @override
  int get errorCount;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$SyncLogEntryImplCopyWith<_$SyncLogEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
