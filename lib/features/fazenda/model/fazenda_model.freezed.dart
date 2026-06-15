// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fazenda_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Fazenda _$FazendaFromJson(Map<String, dynamic> json) {
  return _Fazenda.fromJson(json);
}

/// @nodoc
mixin _$Fazenda {
  int get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String get cnpj => throw _privateConstructorUsedError;
  int get produtorId => throw _privateConstructorUsedError;
  String get municipio => throw _privateConstructorUsedError;
  String get estado => throw _privateConstructorUsedError;
  String get areaTotal => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FazendaCopyWith<Fazenda> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FazendaCopyWith<$Res> {
  factory $FazendaCopyWith(Fazenda value, $Res Function(Fazenda) then) =
      _$FazendaCopyWithImpl<$Res, Fazenda>;
  @useResult
  $Res call(
      {int id,
      String nome,
      String cnpj,
      int produtorId,
      String municipio,
      String estado,
      String areaTotal,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$FazendaCopyWithImpl<$Res, $Val extends Fazenda>
    implements $FazendaCopyWith<$Res> {
  _$FazendaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? cnpj = null,
    Object? produtorId = null,
    Object? municipio = null,
    Object? estado = null,
    Object? areaTotal = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      cnpj: null == cnpj
          ? _value.cnpj
          : cnpj // ignore: cast_nullable_to_non_nullable
              as String,
      produtorId: null == produtorId
          ? _value.produtorId
          : produtorId // ignore: cast_nullable_to_non_nullable
              as int,
      municipio: null == municipio
          ? _value.municipio
          : municipio // ignore: cast_nullable_to_non_nullable
              as String,
      estado: null == estado
          ? _value.estado
          : estado // ignore: cast_nullable_to_non_nullable
              as String,
      areaTotal: null == areaTotal
          ? _value.areaTotal
          : areaTotal // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$FazendaImplCopyWith<$Res> implements $FazendaCopyWith<$Res> {
  factory _$$FazendaImplCopyWith(
          _$FazendaImpl value, $Res Function(_$FazendaImpl) then) =
      __$$FazendaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String nome,
      String cnpj,
      int produtorId,
      String municipio,
      String estado,
      String areaTotal,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$FazendaImplCopyWithImpl<$Res>
    extends _$FazendaCopyWithImpl<$Res, _$FazendaImpl>
    implements _$$FazendaImplCopyWith<$Res> {
  __$$FazendaImplCopyWithImpl(
      _$FazendaImpl _value, $Res Function(_$FazendaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? cnpj = null,
    Object? produtorId = null,
    Object? municipio = null,
    Object? estado = null,
    Object? areaTotal = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$FazendaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      cnpj: null == cnpj
          ? _value.cnpj
          : cnpj // ignore: cast_nullable_to_non_nullable
              as String,
      produtorId: null == produtorId
          ? _value.produtorId
          : produtorId // ignore: cast_nullable_to_non_nullable
              as int,
      municipio: null == municipio
          ? _value.municipio
          : municipio // ignore: cast_nullable_to_non_nullable
              as String,
      estado: null == estado
          ? _value.estado
          : estado // ignore: cast_nullable_to_non_nullable
              as String,
      areaTotal: null == areaTotal
          ? _value.areaTotal
          : areaTotal // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$FazendaImpl implements _Fazenda {
  const _$FazendaImpl(
      {required this.id,
      required this.nome,
      required this.cnpj,
      required this.produtorId,
      required this.municipio,
      required this.estado,
      required this.areaTotal,
      required this.createdAt,
      required this.updatedAt});

  factory _$FazendaImpl.fromJson(Map<String, dynamic> json) =>
      _$$FazendaImplFromJson(json);

  @override
  final int id;
  @override
  final String nome;
  @override
  final String cnpj;
  @override
  final int produtorId;
  @override
  final String municipio;
  @override
  final String estado;
  @override
  final String areaTotal;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'Fazenda(id: $id, nome: $nome, cnpj: $cnpj, produtorId: $produtorId, municipio: $municipio, estado: $estado, areaTotal: $areaTotal, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FazendaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.cnpj, cnpj) || other.cnpj == cnpj) &&
            (identical(other.produtorId, produtorId) ||
                other.produtorId == produtorId) &&
            (identical(other.municipio, municipio) ||
                other.municipio == municipio) &&
            (identical(other.estado, estado) || other.estado == estado) &&
            (identical(other.areaTotal, areaTotal) ||
                other.areaTotal == areaTotal) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nome, cnpj, produtorId,
      municipio, estado, areaTotal, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FazendaImplCopyWith<_$FazendaImpl> get copyWith =>
      __$$FazendaImplCopyWithImpl<_$FazendaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FazendaImplToJson(
      this,
    );
  }
}

abstract class _Fazenda implements Fazenda {
  const factory _Fazenda(
      {required final int id,
      required final String nome,
      required final String cnpj,
      required final int produtorId,
      required final String municipio,
      required final String estado,
      required final String areaTotal,
      required final String createdAt,
      required final String updatedAt}) = _$FazendaImpl;

  factory _Fazenda.fromJson(Map<String, dynamic> json) = _$FazendaImpl.fromJson;

  @override
  int get id;
  @override
  String get nome;
  @override
  String get cnpj;
  @override
  int get produtorId;
  @override
  String get municipio;
  @override
  String get estado;
  @override
  String get areaTotal;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$FazendaImplCopyWith<_$FazendaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FazendasCreateRequest _$FazendasCreateRequestFromJson(
    Map<String, dynamic> json) {
  return _FazendasCreateRequest.fromJson(json);
}

/// @nodoc
mixin _$FazendasCreateRequest {
  String get nome => throw _privateConstructorUsedError;
  String get cnpj => throw _privateConstructorUsedError;
  String get municipio => throw _privateConstructorUsedError;
  String get estado => throw _privateConstructorUsedError;
  String get areaTotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FazendasCreateRequestCopyWith<FazendasCreateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FazendasCreateRequestCopyWith<$Res> {
  factory $FazendasCreateRequestCopyWith(FazendasCreateRequest value,
          $Res Function(FazendasCreateRequest) then) =
      _$FazendasCreateRequestCopyWithImpl<$Res, FazendasCreateRequest>;
  @useResult
  $Res call(
      {String nome,
      String cnpj,
      String municipio,
      String estado,
      String areaTotal});
}

/// @nodoc
class _$FazendasCreateRequestCopyWithImpl<$Res,
        $Val extends FazendasCreateRequest>
    implements $FazendasCreateRequestCopyWith<$Res> {
  _$FazendasCreateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? cnpj = null,
    Object? municipio = null,
    Object? estado = null,
    Object? areaTotal = null,
  }) {
    return _then(_value.copyWith(
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      cnpj: null == cnpj
          ? _value.cnpj
          : cnpj // ignore: cast_nullable_to_non_nullable
              as String,
      municipio: null == municipio
          ? _value.municipio
          : municipio // ignore: cast_nullable_to_non_nullable
              as String,
      estado: null == estado
          ? _value.estado
          : estado // ignore: cast_nullable_to_non_nullable
              as String,
      areaTotal: null == areaTotal
          ? _value.areaTotal
          : areaTotal // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FazendasCreateRequestImplCopyWith<$Res>
    implements $FazendasCreateRequestCopyWith<$Res> {
  factory _$$FazendasCreateRequestImplCopyWith(
          _$FazendasCreateRequestImpl value,
          $Res Function(_$FazendasCreateRequestImpl) then) =
      __$$FazendasCreateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nome,
      String cnpj,
      String municipio,
      String estado,
      String areaTotal});
}

/// @nodoc
class __$$FazendasCreateRequestImplCopyWithImpl<$Res>
    extends _$FazendasCreateRequestCopyWithImpl<$Res,
        _$FazendasCreateRequestImpl>
    implements _$$FazendasCreateRequestImplCopyWith<$Res> {
  __$$FazendasCreateRequestImplCopyWithImpl(_$FazendasCreateRequestImpl _value,
      $Res Function(_$FazendasCreateRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? cnpj = null,
    Object? municipio = null,
    Object? estado = null,
    Object? areaTotal = null,
  }) {
    return _then(_$FazendasCreateRequestImpl(
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      cnpj: null == cnpj
          ? _value.cnpj
          : cnpj // ignore: cast_nullable_to_non_nullable
              as String,
      municipio: null == municipio
          ? _value.municipio
          : municipio // ignore: cast_nullable_to_non_nullable
              as String,
      estado: null == estado
          ? _value.estado
          : estado // ignore: cast_nullable_to_non_nullable
              as String,
      areaTotal: null == areaTotal
          ? _value.areaTotal
          : areaTotal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FazendasCreateRequestImpl implements _FazendasCreateRequest {
  const _$FazendasCreateRequestImpl(
      {required this.nome,
      required this.cnpj,
      required this.municipio,
      required this.estado,
      required this.areaTotal});

  factory _$FazendasCreateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FazendasCreateRequestImplFromJson(json);

  @override
  final String nome;
  @override
  final String cnpj;
  @override
  final String municipio;
  @override
  final String estado;
  @override
  final String areaTotal;

  @override
  String toString() {
    return 'FazendasCreateRequest(nome: $nome, cnpj: $cnpj, municipio: $municipio, estado: $estado, areaTotal: $areaTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FazendasCreateRequestImpl &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.cnpj, cnpj) || other.cnpj == cnpj) &&
            (identical(other.municipio, municipio) ||
                other.municipio == municipio) &&
            (identical(other.estado, estado) || other.estado == estado) &&
            (identical(other.areaTotal, areaTotal) ||
                other.areaTotal == areaTotal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nome, cnpj, municipio, estado, areaTotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FazendasCreateRequestImplCopyWith<_$FazendasCreateRequestImpl>
      get copyWith => __$$FazendasCreateRequestImplCopyWithImpl<
          _$FazendasCreateRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FazendasCreateRequestImplToJson(
      this,
    );
  }
}

abstract class _FazendasCreateRequest implements FazendasCreateRequest {
  const factory _FazendasCreateRequest(
      {required final String nome,
      required final String cnpj,
      required final String municipio,
      required final String estado,
      required final String areaTotal}) = _$FazendasCreateRequestImpl;

  factory _FazendasCreateRequest.fromJson(Map<String, dynamic> json) =
      _$FazendasCreateRequestImpl.fromJson;

  @override
  String get nome;
  @override
  String get cnpj;
  @override
  String get municipio;
  @override
  String get estado;
  @override
  String get areaTotal;
  @override
  @JsonKey(ignore: true)
  _$$FazendasCreateRequestImplCopyWith<_$FazendasCreateRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FazendasUpdateRequest _$FazendasUpdateRequestFromJson(
    Map<String, dynamic> json) {
  return _FazendasUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$FazendasUpdateRequest {
  String? get nome => throw _privateConstructorUsedError;
  String? get municipio => throw _privateConstructorUsedError;
  String? get estado => throw _privateConstructorUsedError;
  String? get areaTotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FazendasUpdateRequestCopyWith<FazendasUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FazendasUpdateRequestCopyWith<$Res> {
  factory $FazendasUpdateRequestCopyWith(FazendasUpdateRequest value,
          $Res Function(FazendasUpdateRequest) then) =
      _$FazendasUpdateRequestCopyWithImpl<$Res, FazendasUpdateRequest>;
  @useResult
  $Res call(
      {String? nome, String? municipio, String? estado, String? areaTotal});
}

/// @nodoc
class _$FazendasUpdateRequestCopyWithImpl<$Res,
        $Val extends FazendasUpdateRequest>
    implements $FazendasUpdateRequestCopyWith<$Res> {
  _$FazendasUpdateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = freezed,
    Object? municipio = freezed,
    Object? estado = freezed,
    Object? areaTotal = freezed,
  }) {
    return _then(_value.copyWith(
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      municipio: freezed == municipio
          ? _value.municipio
          : municipio // ignore: cast_nullable_to_non_nullable
              as String?,
      estado: freezed == estado
          ? _value.estado
          : estado // ignore: cast_nullable_to_non_nullable
              as String?,
      areaTotal: freezed == areaTotal
          ? _value.areaTotal
          : areaTotal // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FazendasUpdateRequestImplCopyWith<$Res>
    implements $FazendasUpdateRequestCopyWith<$Res> {
  factory _$$FazendasUpdateRequestImplCopyWith(
          _$FazendasUpdateRequestImpl value,
          $Res Function(_$FazendasUpdateRequestImpl) then) =
      __$$FazendasUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? nome, String? municipio, String? estado, String? areaTotal});
}

/// @nodoc
class __$$FazendasUpdateRequestImplCopyWithImpl<$Res>
    extends _$FazendasUpdateRequestCopyWithImpl<$Res,
        _$FazendasUpdateRequestImpl>
    implements _$$FazendasUpdateRequestImplCopyWith<$Res> {
  __$$FazendasUpdateRequestImplCopyWithImpl(_$FazendasUpdateRequestImpl _value,
      $Res Function(_$FazendasUpdateRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = freezed,
    Object? municipio = freezed,
    Object? estado = freezed,
    Object? areaTotal = freezed,
  }) {
    return _then(_$FazendasUpdateRequestImpl(
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      municipio: freezed == municipio
          ? _value.municipio
          : municipio // ignore: cast_nullable_to_non_nullable
              as String?,
      estado: freezed == estado
          ? _value.estado
          : estado // ignore: cast_nullable_to_non_nullable
              as String?,
      areaTotal: freezed == areaTotal
          ? _value.areaTotal
          : areaTotal // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FazendasUpdateRequestImpl implements _FazendasUpdateRequest {
  const _$FazendasUpdateRequestImpl(
      {this.nome, this.municipio, this.estado, this.areaTotal});

  factory _$FazendasUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FazendasUpdateRequestImplFromJson(json);

  @override
  final String? nome;
  @override
  final String? municipio;
  @override
  final String? estado;
  @override
  final String? areaTotal;

  @override
  String toString() {
    return 'FazendasUpdateRequest(nome: $nome, municipio: $municipio, estado: $estado, areaTotal: $areaTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FazendasUpdateRequestImpl &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.municipio, municipio) ||
                other.municipio == municipio) &&
            (identical(other.estado, estado) || other.estado == estado) &&
            (identical(other.areaTotal, areaTotal) ||
                other.areaTotal == areaTotal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nome, municipio, estado, areaTotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FazendasUpdateRequestImplCopyWith<_$FazendasUpdateRequestImpl>
      get copyWith => __$$FazendasUpdateRequestImplCopyWithImpl<
          _$FazendasUpdateRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FazendasUpdateRequestImplToJson(
      this,
    );
  }
}

abstract class _FazendasUpdateRequest implements FazendasUpdateRequest {
  const factory _FazendasUpdateRequest(
      {final String? nome,
      final String? municipio,
      final String? estado,
      final String? areaTotal}) = _$FazendasUpdateRequestImpl;

  factory _FazendasUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$FazendasUpdateRequestImpl.fromJson;

  @override
  String? get nome;
  @override
  String? get municipio;
  @override
  String? get estado;
  @override
  String? get areaTotal;
  @override
  @JsonKey(ignore: true)
  _$$FazendasUpdateRequestImplCopyWith<_$FazendasUpdateRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
