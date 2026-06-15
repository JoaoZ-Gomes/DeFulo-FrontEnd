// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evento_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventoManejo _$EventoManejoFromJson(Map<String, dynamic> json) {
  return _EventoManejo.fromJson(json);
}

/// @nodoc
mixin _$EventoManejo {
  int get id => throw _privateConstructorUsedError;
  int get talhaoId => throw _privateConstructorUsedError;
  String get tipoEvento => throw _privateConstructorUsedError;
  String? get descricao => throw _privateConstructorUsedError;
  String get dataEvento => throw _privateConstructorUsedError;
  String get dataRegistro => throw _privateConstructorUsedError;
  String get responsavel => throw _privateConstructorUsedError;
  String? get notas => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventoManejoCopyWith<EventoManejo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventoManejoCopyWith<$Res> {
  factory $EventoManejoCopyWith(
          EventoManejo value, $Res Function(EventoManejo) then) =
      _$EventoManejoCopyWithImpl<$Res, EventoManejo>;
  @useResult
  $Res call(
      {int id,
      int talhaoId,
      String tipoEvento,
      String? descricao,
      String dataEvento,
      String dataRegistro,
      String responsavel,
      String? notas,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$EventoManejoCopyWithImpl<$Res, $Val extends EventoManejo>
    implements $EventoManejoCopyWith<$Res> {
  _$EventoManejoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? talhaoId = null,
    Object? tipoEvento = null,
    Object? descricao = freezed,
    Object? dataEvento = null,
    Object? dataRegistro = null,
    Object? responsavel = null,
    Object? notas = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      talhaoId: null == talhaoId
          ? _value.talhaoId
          : talhaoId // ignore: cast_nullable_to_non_nullable
              as int,
      tipoEvento: null == tipoEvento
          ? _value.tipoEvento
          : tipoEvento // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      dataEvento: null == dataEvento
          ? _value.dataEvento
          : dataEvento // ignore: cast_nullable_to_non_nullable
              as String,
      dataRegistro: null == dataRegistro
          ? _value.dataRegistro
          : dataRegistro // ignore: cast_nullable_to_non_nullable
              as String,
      responsavel: null == responsavel
          ? _value.responsavel
          : responsavel // ignore: cast_nullable_to_non_nullable
              as String,
      notas: freezed == notas
          ? _value.notas
          : notas // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventoManejoImplCopyWith<$Res>
    implements $EventoManejoCopyWith<$Res> {
  factory _$$EventoManejoImplCopyWith(
          _$EventoManejoImpl value, $Res Function(_$EventoManejoImpl) then) =
      __$$EventoManejoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int talhaoId,
      String tipoEvento,
      String? descricao,
      String dataEvento,
      String dataRegistro,
      String responsavel,
      String? notas,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$EventoManejoImplCopyWithImpl<$Res>
    extends _$EventoManejoCopyWithImpl<$Res, _$EventoManejoImpl>
    implements _$$EventoManejoImplCopyWith<$Res> {
  __$$EventoManejoImplCopyWithImpl(
      _$EventoManejoImpl _value, $Res Function(_$EventoManejoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? talhaoId = null,
    Object? tipoEvento = null,
    Object? descricao = freezed,
    Object? dataEvento = null,
    Object? dataRegistro = null,
    Object? responsavel = null,
    Object? notas = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$EventoManejoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      talhaoId: null == talhaoId
          ? _value.talhaoId
          : talhaoId // ignore: cast_nullable_to_non_nullable
              as int,
      tipoEvento: null == tipoEvento
          ? _value.tipoEvento
          : tipoEvento // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      dataEvento: null == dataEvento
          ? _value.dataEvento
          : dataEvento // ignore: cast_nullable_to_non_nullable
              as String,
      dataRegistro: null == dataRegistro
          ? _value.dataRegistro
          : dataRegistro // ignore: cast_nullable_to_non_nullable
              as String,
      responsavel: null == responsavel
          ? _value.responsavel
          : responsavel // ignore: cast_nullable_to_non_nullable
              as String,
      notas: freezed == notas
          ? _value.notas
          : notas // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventoManejoImpl implements _EventoManejo {
  const _$EventoManejoImpl(
      {required this.id,
      required this.talhaoId,
      required this.tipoEvento,
      this.descricao,
      required this.dataEvento,
      required this.dataRegistro,
      required this.responsavel,
      this.notas,
      required this.createdAt,
      required this.updatedAt});

  factory _$EventoManejoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventoManejoImplFromJson(json);

  @override
  final int id;
  @override
  final int talhaoId;
  @override
  final String tipoEvento;
  @override
  final String? descricao;
  @override
  final String dataEvento;
  @override
  final String dataRegistro;
  @override
  final String responsavel;
  @override
  final String? notas;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'EventoManejo(id: $id, talhaoId: $talhaoId, tipoEvento: $tipoEvento, descricao: $descricao, dataEvento: $dataEvento, dataRegistro: $dataRegistro, responsavel: $responsavel, notas: $notas, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventoManejoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.talhaoId, talhaoId) ||
                other.talhaoId == talhaoId) &&
            (identical(other.tipoEvento, tipoEvento) ||
                other.tipoEvento == tipoEvento) &&
            (identical(other.descricao, descricao) ||
                other.descricao == descricao) &&
            (identical(other.dataEvento, dataEvento) ||
                other.dataEvento == dataEvento) &&
            (identical(other.dataRegistro, dataRegistro) ||
                other.dataRegistro == dataRegistro) &&
            (identical(other.responsavel, responsavel) ||
                other.responsavel == responsavel) &&
            (identical(other.notas, notas) || other.notas == notas) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      talhaoId,
      tipoEvento,
      descricao,
      dataEvento,
      dataRegistro,
      responsavel,
      notas,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventoManejoImplCopyWith<_$EventoManejoImpl> get copyWith =>
      __$$EventoManejoImplCopyWithImpl<_$EventoManejoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventoManejoImplToJson(
      this,
    );
  }
}

abstract class _EventoManejo implements EventoManejo {
  const factory _EventoManejo(
      {required final int id,
      required final int talhaoId,
      required final String tipoEvento,
      final String? descricao,
      required final String dataEvento,
      required final String dataRegistro,
      required final String responsavel,
      final String? notas,
      required final String createdAt,
      required final String updatedAt}) = _$EventoManejoImpl;

  factory _EventoManejo.fromJson(Map<String, dynamic> json) =
      _$EventoManejoImpl.fromJson;

  @override
  int get id;
  @override
  int get talhaoId;
  @override
  String get tipoEvento;
  @override
  String? get descricao;
  @override
  String get dataEvento;
  @override
  String get dataRegistro;
  @override
  String get responsavel;
  @override
  String? get notas;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$EventoManejoImplCopyWith<_$EventoManejoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventoManejoCreateRequest _$EventoManejoCreateRequestFromJson(
    Map<String, dynamic> json) {
  return _EventoManejoCreateRequest.fromJson(json);
}

/// @nodoc
mixin _$EventoManejoCreateRequest {
  int get talhaoId => throw _privateConstructorUsedError;
  String get tipoEvento => throw _privateConstructorUsedError;
  String? get descricao => throw _privateConstructorUsedError;
  String get dataEvento => throw _privateConstructorUsedError;
  String? get notas => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventoManejoCreateRequestCopyWith<EventoManejoCreateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventoManejoCreateRequestCopyWith<$Res> {
  factory $EventoManejoCreateRequestCopyWith(EventoManejoCreateRequest value,
          $Res Function(EventoManejoCreateRequest) then) =
      _$EventoManejoCreateRequestCopyWithImpl<$Res, EventoManejoCreateRequest>;
  @useResult
  $Res call(
      {int talhaoId,
      String tipoEvento,
      String? descricao,
      String dataEvento,
      String? notas});
}

/// @nodoc
class _$EventoManejoCreateRequestCopyWithImpl<$Res,
        $Val extends EventoManejoCreateRequest>
    implements $EventoManejoCreateRequestCopyWith<$Res> {
  _$EventoManejoCreateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? talhaoId = null,
    Object? tipoEvento = null,
    Object? descricao = freezed,
    Object? dataEvento = null,
    Object? notas = freezed,
  }) {
    return _then(_value.copyWith(
      talhaoId: null == talhaoId
          ? _value.talhaoId
          : talhaoId // ignore: cast_nullable_to_non_nullable
              as int,
      tipoEvento: null == tipoEvento
          ? _value.tipoEvento
          : tipoEvento // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      dataEvento: null == dataEvento
          ? _value.dataEvento
          : dataEvento // ignore: cast_nullable_to_non_nullable
              as String,
      notas: freezed == notas
          ? _value.notas
          : notas // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventoManejoCreateRequestImplCopyWith<$Res>
    implements $EventoManejoCreateRequestCopyWith<$Res> {
  factory _$$EventoManejoCreateRequestImplCopyWith(
          _$EventoManejoCreateRequestImpl value,
          $Res Function(_$EventoManejoCreateRequestImpl) then) =
      __$$EventoManejoCreateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int talhaoId,
      String tipoEvento,
      String? descricao,
      String dataEvento,
      String? notas});
}

/// @nodoc
class __$$EventoManejoCreateRequestImplCopyWithImpl<$Res>
    extends _$EventoManejoCreateRequestCopyWithImpl<$Res,
        _$EventoManejoCreateRequestImpl>
    implements _$$EventoManejoCreateRequestImplCopyWith<$Res> {
  __$$EventoManejoCreateRequestImplCopyWithImpl(
      _$EventoManejoCreateRequestImpl _value,
      $Res Function(_$EventoManejoCreateRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? talhaoId = null,
    Object? tipoEvento = null,
    Object? descricao = freezed,
    Object? dataEvento = null,
    Object? notas = freezed,
  }) {
    return _then(_$EventoManejoCreateRequestImpl(
      talhaoId: null == talhaoId
          ? _value.talhaoId
          : talhaoId // ignore: cast_nullable_to_non_nullable
              as int,
      tipoEvento: null == tipoEvento
          ? _value.tipoEvento
          : tipoEvento // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      dataEvento: null == dataEvento
          ? _value.dataEvento
          : dataEvento // ignore: cast_nullable_to_non_nullable
              as String,
      notas: freezed == notas
          ? _value.notas
          : notas // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventoManejoCreateRequestImpl implements _EventoManejoCreateRequest {
  const _$EventoManejoCreateRequestImpl(
      {required this.talhaoId,
      required this.tipoEvento,
      this.descricao,
      required this.dataEvento,
      this.notas});

  factory _$EventoManejoCreateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventoManejoCreateRequestImplFromJson(json);

  @override
  final int talhaoId;
  @override
  final String tipoEvento;
  @override
  final String? descricao;
  @override
  final String dataEvento;
  @override
  final String? notas;

  @override
  String toString() {
    return 'EventoManejoCreateRequest(talhaoId: $talhaoId, tipoEvento: $tipoEvento, descricao: $descricao, dataEvento: $dataEvento, notas: $notas)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventoManejoCreateRequestImpl &&
            (identical(other.talhaoId, talhaoId) ||
                other.talhaoId == talhaoId) &&
            (identical(other.tipoEvento, tipoEvento) ||
                other.tipoEvento == tipoEvento) &&
            (identical(other.descricao, descricao) ||
                other.descricao == descricao) &&
            (identical(other.dataEvento, dataEvento) ||
                other.dataEvento == dataEvento) &&
            (identical(other.notas, notas) || other.notas == notas));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, talhaoId, tipoEvento, descricao, dataEvento, notas);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventoManejoCreateRequestImplCopyWith<_$EventoManejoCreateRequestImpl>
      get copyWith => __$$EventoManejoCreateRequestImplCopyWithImpl<
          _$EventoManejoCreateRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventoManejoCreateRequestImplToJson(
      this,
    );
  }
}

abstract class _EventoManejoCreateRequest implements EventoManejoCreateRequest {
  const factory _EventoManejoCreateRequest(
      {required final int talhaoId,
      required final String tipoEvento,
      final String? descricao,
      required final String dataEvento,
      final String? notas}) = _$EventoManejoCreateRequestImpl;

  factory _EventoManejoCreateRequest.fromJson(Map<String, dynamic> json) =
      _$EventoManejoCreateRequestImpl.fromJson;

  @override
  int get talhaoId;
  @override
  String get tipoEvento;
  @override
  String? get descricao;
  @override
  String get dataEvento;
  @override
  String? get notas;
  @override
  @JsonKey(ignore: true)
  _$$EventoManejoCreateRequestImplCopyWith<_$EventoManejoCreateRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EventoManejoUpdateRequest _$EventoManejoUpdateRequestFromJson(
    Map<String, dynamic> json) {
  return _EventoManejoUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$EventoManejoUpdateRequest {
  String? get tipoEvento => throw _privateConstructorUsedError;
  String? get descricao => throw _privateConstructorUsedError;
  String? get dataEvento => throw _privateConstructorUsedError;
  String? get notas => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventoManejoUpdateRequestCopyWith<EventoManejoUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventoManejoUpdateRequestCopyWith<$Res> {
  factory $EventoManejoUpdateRequestCopyWith(EventoManejoUpdateRequest value,
          $Res Function(EventoManejoUpdateRequest) then) =
      _$EventoManejoUpdateRequestCopyWithImpl<$Res, EventoManejoUpdateRequest>;
  @useResult
  $Res call(
      {String? tipoEvento,
      String? descricao,
      String? dataEvento,
      String? notas});
}

/// @nodoc
class _$EventoManejoUpdateRequestCopyWithImpl<$Res,
        $Val extends EventoManejoUpdateRequest>
    implements $EventoManejoUpdateRequestCopyWith<$Res> {
  _$EventoManejoUpdateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tipoEvento = freezed,
    Object? descricao = freezed,
    Object? dataEvento = freezed,
    Object? notas = freezed,
  }) {
    return _then(_value.copyWith(
      tipoEvento: freezed == tipoEvento
          ? _value.tipoEvento
          : tipoEvento // ignore: cast_nullable_to_non_nullable
              as String?,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      dataEvento: freezed == dataEvento
          ? _value.dataEvento
          : dataEvento // ignore: cast_nullable_to_non_nullable
              as String?,
      notas: freezed == notas
          ? _value.notas
          : notas // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventoManejoUpdateRequestImplCopyWith<$Res>
    implements $EventoManejoUpdateRequestCopyWith<$Res> {
  factory _$$EventoManejoUpdateRequestImplCopyWith(
          _$EventoManejoUpdateRequestImpl value,
          $Res Function(_$EventoManejoUpdateRequestImpl) then) =
      __$$EventoManejoUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? tipoEvento,
      String? descricao,
      String? dataEvento,
      String? notas});
}

/// @nodoc
class __$$EventoManejoUpdateRequestImplCopyWithImpl<$Res>
    extends _$EventoManejoUpdateRequestCopyWithImpl<$Res,
        _$EventoManejoUpdateRequestImpl>
    implements _$$EventoManejoUpdateRequestImplCopyWith<$Res> {
  __$$EventoManejoUpdateRequestImplCopyWithImpl(
      _$EventoManejoUpdateRequestImpl _value,
      $Res Function(_$EventoManejoUpdateRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tipoEvento = freezed,
    Object? descricao = freezed,
    Object? dataEvento = freezed,
    Object? notas = freezed,
  }) {
    return _then(_$EventoManejoUpdateRequestImpl(
      tipoEvento: freezed == tipoEvento
          ? _value.tipoEvento
          : tipoEvento // ignore: cast_nullable_to_non_nullable
              as String?,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      dataEvento: freezed == dataEvento
          ? _value.dataEvento
          : dataEvento // ignore: cast_nullable_to_non_nullable
              as String?,
      notas: freezed == notas
          ? _value.notas
          : notas // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventoManejoUpdateRequestImpl implements _EventoManejoUpdateRequest {
  const _$EventoManejoUpdateRequestImpl(
      {this.tipoEvento, this.descricao, this.dataEvento, this.notas});

  factory _$EventoManejoUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventoManejoUpdateRequestImplFromJson(json);

  @override
  final String? tipoEvento;
  @override
  final String? descricao;
  @override
  final String? dataEvento;
  @override
  final String? notas;

  @override
  String toString() {
    return 'EventoManejoUpdateRequest(tipoEvento: $tipoEvento, descricao: $descricao, dataEvento: $dataEvento, notas: $notas)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventoManejoUpdateRequestImpl &&
            (identical(other.tipoEvento, tipoEvento) ||
                other.tipoEvento == tipoEvento) &&
            (identical(other.descricao, descricao) ||
                other.descricao == descricao) &&
            (identical(other.dataEvento, dataEvento) ||
                other.dataEvento == dataEvento) &&
            (identical(other.notas, notas) || other.notas == notas));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, tipoEvento, descricao, dataEvento, notas);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventoManejoUpdateRequestImplCopyWith<_$EventoManejoUpdateRequestImpl>
      get copyWith => __$$EventoManejoUpdateRequestImplCopyWithImpl<
          _$EventoManejoUpdateRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventoManejoUpdateRequestImplToJson(
      this,
    );
  }
}

abstract class _EventoManejoUpdateRequest implements EventoManejoUpdateRequest {
  const factory _EventoManejoUpdateRequest(
      {final String? tipoEvento,
      final String? descricao,
      final String? dataEvento,
      final String? notas}) = _$EventoManejoUpdateRequestImpl;

  factory _EventoManejoUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$EventoManejoUpdateRequestImpl.fromJson;

  @override
  String? get tipoEvento;
  @override
  String? get descricao;
  @override
  String? get dataEvento;
  @override
  String? get notas;
  @override
  @JsonKey(ignore: true)
  _$$EventoManejoUpdateRequestImplCopyWith<_$EventoManejoUpdateRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
