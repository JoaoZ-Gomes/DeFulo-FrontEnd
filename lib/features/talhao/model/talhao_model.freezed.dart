// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'talhao_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Talhao _$TalhaoFromJson(Map<String, dynamic> json) {
  return _Talhao.fromJson(json);
}

/// @nodoc
mixin _$Talhao {
  int get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  int get fazendasId => throw _privateConstructorUsedError;
  String get area => throw _privateConstructorUsedError;
  String get cultura => throw _privateConstructorUsedError;
  String? get dataPlantio => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TalhaoCopyWith<Talhao> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TalhaoCopyWith<$Res> {
  factory $TalhaoCopyWith(Talhao value, $Res Function(Talhao) then) =
      _$TalhaoCopyWithImpl<$Res, Talhao>;
  @useResult
  $Res call(
      {int id,
      String nome,
      int fazendasId,
      String area,
      String cultura,
      String? dataPlantio,
      String status,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$TalhaoCopyWithImpl<$Res, $Val extends Talhao>
    implements $TalhaoCopyWith<$Res> {
  _$TalhaoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? fazendasId = null,
    Object? area = null,
    Object? cultura = null,
    Object? dataPlantio = freezed,
    Object? status = null,
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
      fazendasId: null == fazendasId
          ? _value.fazendasId
          : fazendasId // ignore: cast_nullable_to_non_nullable
              as int,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      cultura: null == cultura
          ? _value.cultura
          : cultura // ignore: cast_nullable_to_non_nullable
              as String,
      dataPlantio: freezed == dataPlantio
          ? _value.dataPlantio
          : dataPlantio // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
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
abstract class _$$TalhaoImplCopyWith<$Res> implements $TalhaoCopyWith<$Res> {
  factory _$$TalhaoImplCopyWith(
          _$TalhaoImpl value, $Res Function(_$TalhaoImpl) then) =
      __$$TalhaoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String nome,
      int fazendasId,
      String area,
      String cultura,
      String? dataPlantio,
      String status,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$TalhaoImplCopyWithImpl<$Res>
    extends _$TalhaoCopyWithImpl<$Res, _$TalhaoImpl>
    implements _$$TalhaoImplCopyWith<$Res> {
  __$$TalhaoImplCopyWithImpl(
      _$TalhaoImpl _value, $Res Function(_$TalhaoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? fazendasId = null,
    Object? area = null,
    Object? cultura = null,
    Object? dataPlantio = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$TalhaoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      fazendasId: null == fazendasId
          ? _value.fazendasId
          : fazendasId // ignore: cast_nullable_to_non_nullable
              as int,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      cultura: null == cultura
          ? _value.cultura
          : cultura // ignore: cast_nullable_to_non_nullable
              as String,
      dataPlantio: freezed == dataPlantio
          ? _value.dataPlantio
          : dataPlantio // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
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
class _$TalhaoImpl implements _Talhao {
  const _$TalhaoImpl(
      {required this.id,
      required this.nome,
      required this.fazendasId,
      required this.area,
      required this.cultura,
      this.dataPlantio,
      required this.status,
      required this.createdAt,
      required this.updatedAt});

  factory _$TalhaoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TalhaoImplFromJson(json);

  @override
  final int id;
  @override
  final String nome;
  @override
  final int fazendasId;
  @override
  final String area;
  @override
  final String cultura;
  @override
  final String? dataPlantio;
  @override
  final String status;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'Talhao(id: $id, nome: $nome, fazendasId: $fazendasId, area: $area, cultura: $cultura, dataPlantio: $dataPlantio, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TalhaoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.fazendasId, fazendasId) ||
                other.fazendasId == fazendasId) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.cultura, cultura) || other.cultura == cultura) &&
            (identical(other.dataPlantio, dataPlantio) ||
                other.dataPlantio == dataPlantio) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nome, fazendasId, area,
      cultura, dataPlantio, status, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TalhaoImplCopyWith<_$TalhaoImpl> get copyWith =>
      __$$TalhaoImplCopyWithImpl<_$TalhaoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TalhaoImplToJson(
      this,
    );
  }
}

abstract class _Talhao implements Talhao {
  const factory _Talhao(
      {required final int id,
      required final String nome,
      required final int fazendasId,
      required final String area,
      required final String cultura,
      final String? dataPlantio,
      required final String status,
      required final String createdAt,
      required final String updatedAt}) = _$TalhaoImpl;

  factory _Talhao.fromJson(Map<String, dynamic> json) = _$TalhaoImpl.fromJson;

  @override
  int get id;
  @override
  String get nome;
  @override
  int get fazendasId;
  @override
  String get area;
  @override
  String get cultura;
  @override
  String? get dataPlantio;
  @override
  String get status;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$TalhaoImplCopyWith<_$TalhaoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TalhaoCreateRequest _$TalhaoCreateRequestFromJson(Map<String, dynamic> json) {
  return _TalhaoCreateRequest.fromJson(json);
}

/// @nodoc
mixin _$TalhaoCreateRequest {
  String get nome => throw _privateConstructorUsedError;
  int get fazendasId => throw _privateConstructorUsedError;
  String get area => throw _privateConstructorUsedError;
  String get cultura => throw _privateConstructorUsedError;
  String? get dataPlantio => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TalhaoCreateRequestCopyWith<TalhaoCreateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TalhaoCreateRequestCopyWith<$Res> {
  factory $TalhaoCreateRequestCopyWith(
          TalhaoCreateRequest value, $Res Function(TalhaoCreateRequest) then) =
      _$TalhaoCreateRequestCopyWithImpl<$Res, TalhaoCreateRequest>;
  @useResult
  $Res call(
      {String nome,
      int fazendasId,
      String area,
      String cultura,
      String? dataPlantio,
      String status});
}

/// @nodoc
class _$TalhaoCreateRequestCopyWithImpl<$Res, $Val extends TalhaoCreateRequest>
    implements $TalhaoCreateRequestCopyWith<$Res> {
  _$TalhaoCreateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? fazendasId = null,
    Object? area = null,
    Object? cultura = null,
    Object? dataPlantio = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      fazendasId: null == fazendasId
          ? _value.fazendasId
          : fazendasId // ignore: cast_nullable_to_non_nullable
              as int,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      cultura: null == cultura
          ? _value.cultura
          : cultura // ignore: cast_nullable_to_non_nullable
              as String,
      dataPlantio: freezed == dataPlantio
          ? _value.dataPlantio
          : dataPlantio // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TalhaoCreateRequestImplCopyWith<$Res>
    implements $TalhaoCreateRequestCopyWith<$Res> {
  factory _$$TalhaoCreateRequestImplCopyWith(_$TalhaoCreateRequestImpl value,
          $Res Function(_$TalhaoCreateRequestImpl) then) =
      __$$TalhaoCreateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nome,
      int fazendasId,
      String area,
      String cultura,
      String? dataPlantio,
      String status});
}

/// @nodoc
class __$$TalhaoCreateRequestImplCopyWithImpl<$Res>
    extends _$TalhaoCreateRequestCopyWithImpl<$Res, _$TalhaoCreateRequestImpl>
    implements _$$TalhaoCreateRequestImplCopyWith<$Res> {
  __$$TalhaoCreateRequestImplCopyWithImpl(_$TalhaoCreateRequestImpl _value,
      $Res Function(_$TalhaoCreateRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? fazendasId = null,
    Object? area = null,
    Object? cultura = null,
    Object? dataPlantio = freezed,
    Object? status = null,
  }) {
    return _then(_$TalhaoCreateRequestImpl(
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      fazendasId: null == fazendasId
          ? _value.fazendasId
          : fazendasId // ignore: cast_nullable_to_non_nullable
              as int,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      cultura: null == cultura
          ? _value.cultura
          : cultura // ignore: cast_nullable_to_non_nullable
              as String,
      dataPlantio: freezed == dataPlantio
          ? _value.dataPlantio
          : dataPlantio // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TalhaoCreateRequestImpl implements _TalhaoCreateRequest {
  const _$TalhaoCreateRequestImpl(
      {required this.nome,
      required this.fazendasId,
      required this.area,
      required this.cultura,
      this.dataPlantio,
      required this.status});

  factory _$TalhaoCreateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TalhaoCreateRequestImplFromJson(json);

  @override
  final String nome;
  @override
  final int fazendasId;
  @override
  final String area;
  @override
  final String cultura;
  @override
  final String? dataPlantio;
  @override
  final String status;

  @override
  String toString() {
    return 'TalhaoCreateRequest(nome: $nome, fazendasId: $fazendasId, area: $area, cultura: $cultura, dataPlantio: $dataPlantio, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TalhaoCreateRequestImpl &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.fazendasId, fazendasId) ||
                other.fazendasId == fazendasId) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.cultura, cultura) || other.cultura == cultura) &&
            (identical(other.dataPlantio, dataPlantio) ||
                other.dataPlantio == dataPlantio) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, nome, fazendasId, area, cultura, dataPlantio, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TalhaoCreateRequestImplCopyWith<_$TalhaoCreateRequestImpl> get copyWith =>
      __$$TalhaoCreateRequestImplCopyWithImpl<_$TalhaoCreateRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TalhaoCreateRequestImplToJson(
      this,
    );
  }
}

abstract class _TalhaoCreateRequest implements TalhaoCreateRequest {
  const factory _TalhaoCreateRequest(
      {required final String nome,
      required final int fazendasId,
      required final String area,
      required final String cultura,
      final String? dataPlantio,
      required final String status}) = _$TalhaoCreateRequestImpl;

  factory _TalhaoCreateRequest.fromJson(Map<String, dynamic> json) =
      _$TalhaoCreateRequestImpl.fromJson;

  @override
  String get nome;
  @override
  int get fazendasId;
  @override
  String get area;
  @override
  String get cultura;
  @override
  String? get dataPlantio;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$TalhaoCreateRequestImplCopyWith<_$TalhaoCreateRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TalhaoUpdateRequest _$TalhaoUpdateRequestFromJson(Map<String, dynamic> json) {
  return _TalhaoUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$TalhaoUpdateRequest {
  String? get nome => throw _privateConstructorUsedError;
  String? get area => throw _privateConstructorUsedError;
  String? get cultura => throw _privateConstructorUsedError;
  String? get dataPlantio => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TalhaoUpdateRequestCopyWith<TalhaoUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TalhaoUpdateRequestCopyWith<$Res> {
  factory $TalhaoUpdateRequestCopyWith(
          TalhaoUpdateRequest value, $Res Function(TalhaoUpdateRequest) then) =
      _$TalhaoUpdateRequestCopyWithImpl<$Res, TalhaoUpdateRequest>;
  @useResult
  $Res call(
      {String? nome,
      String? area,
      String? cultura,
      String? dataPlantio,
      String? status});
}

/// @nodoc
class _$TalhaoUpdateRequestCopyWithImpl<$Res, $Val extends TalhaoUpdateRequest>
    implements $TalhaoUpdateRequestCopyWith<$Res> {
  _$TalhaoUpdateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = freezed,
    Object? area = freezed,
    Object? cultura = freezed,
    Object? dataPlantio = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      cultura: freezed == cultura
          ? _value.cultura
          : cultura // ignore: cast_nullable_to_non_nullable
              as String?,
      dataPlantio: freezed == dataPlantio
          ? _value.dataPlantio
          : dataPlantio // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TalhaoUpdateRequestImplCopyWith<$Res>
    implements $TalhaoUpdateRequestCopyWith<$Res> {
  factory _$$TalhaoUpdateRequestImplCopyWith(_$TalhaoUpdateRequestImpl value,
          $Res Function(_$TalhaoUpdateRequestImpl) then) =
      __$$TalhaoUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? nome,
      String? area,
      String? cultura,
      String? dataPlantio,
      String? status});
}

/// @nodoc
class __$$TalhaoUpdateRequestImplCopyWithImpl<$Res>
    extends _$TalhaoUpdateRequestCopyWithImpl<$Res, _$TalhaoUpdateRequestImpl>
    implements _$$TalhaoUpdateRequestImplCopyWith<$Res> {
  __$$TalhaoUpdateRequestImplCopyWithImpl(_$TalhaoUpdateRequestImpl _value,
      $Res Function(_$TalhaoUpdateRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = freezed,
    Object? area = freezed,
    Object? cultura = freezed,
    Object? dataPlantio = freezed,
    Object? status = freezed,
  }) {
    return _then(_$TalhaoUpdateRequestImpl(
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      cultura: freezed == cultura
          ? _value.cultura
          : cultura // ignore: cast_nullable_to_non_nullable
              as String?,
      dataPlantio: freezed == dataPlantio
          ? _value.dataPlantio
          : dataPlantio // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TalhaoUpdateRequestImpl implements _TalhaoUpdateRequest {
  const _$TalhaoUpdateRequestImpl(
      {this.nome, this.area, this.cultura, this.dataPlantio, this.status});

  factory _$TalhaoUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TalhaoUpdateRequestImplFromJson(json);

  @override
  final String? nome;
  @override
  final String? area;
  @override
  final String? cultura;
  @override
  final String? dataPlantio;
  @override
  final String? status;

  @override
  String toString() {
    return 'TalhaoUpdateRequest(nome: $nome, area: $area, cultura: $cultura, dataPlantio: $dataPlantio, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TalhaoUpdateRequestImpl &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.cultura, cultura) || other.cultura == cultura) &&
            (identical(other.dataPlantio, dataPlantio) ||
                other.dataPlantio == dataPlantio) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nome, area, cultura, dataPlantio, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TalhaoUpdateRequestImplCopyWith<_$TalhaoUpdateRequestImpl> get copyWith =>
      __$$TalhaoUpdateRequestImplCopyWithImpl<_$TalhaoUpdateRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TalhaoUpdateRequestImplToJson(
      this,
    );
  }
}

abstract class _TalhaoUpdateRequest implements TalhaoUpdateRequest {
  const factory _TalhaoUpdateRequest(
      {final String? nome,
      final String? area,
      final String? cultura,
      final String? dataPlantio,
      final String? status}) = _$TalhaoUpdateRequestImpl;

  factory _TalhaoUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$TalhaoUpdateRequestImpl.fromJson;

  @override
  String? get nome;
  @override
  String? get area;
  @override
  String? get cultura;
  @override
  String? get dataPlantio;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$TalhaoUpdateRequestImplCopyWith<_$TalhaoUpdateRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
