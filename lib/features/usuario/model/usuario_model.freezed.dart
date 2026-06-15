// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usuario_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Usuario _$UsuarioFromJson(Map<String, dynamic> json) {
  return _Usuario.fromJson(json);
}

/// @nodoc
mixin _$Usuario {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String get perfil => throw _privateConstructorUsedError;
  String get cpf => throw _privateConstructorUsedError;
  String? get telefone => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsuarioCopyWith<Usuario> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioCopyWith<$Res> {
  factory $UsuarioCopyWith(Usuario value, $Res Function(Usuario) then) =
      _$UsuarioCopyWithImpl<$Res, Usuario>;
  @useResult
  $Res call(
      {int id,
      String email,
      String nome,
      String perfil,
      String cpf,
      String? telefone,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$UsuarioCopyWithImpl<$Res, $Val extends Usuario>
    implements $UsuarioCopyWith<$Res> {
  _$UsuarioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? nome = null,
    Object? perfil = null,
    Object? cpf = null,
    Object? telefone = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      perfil: null == perfil
          ? _value.perfil
          : perfil // ignore: cast_nullable_to_non_nullable
              as String,
      cpf: null == cpf
          ? _value.cpf
          : cpf // ignore: cast_nullable_to_non_nullable
              as String,
      telefone: freezed == telefone
          ? _value.telefone
          : telefone // ignore: cast_nullable_to_non_nullable
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
abstract class _$$UsuarioImplCopyWith<$Res> implements $UsuarioCopyWith<$Res> {
  factory _$$UsuarioImplCopyWith(
          _$UsuarioImpl value, $Res Function(_$UsuarioImpl) then) =
      __$$UsuarioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      String nome,
      String perfil,
      String cpf,
      String? telefone,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$UsuarioImplCopyWithImpl<$Res>
    extends _$UsuarioCopyWithImpl<$Res, _$UsuarioImpl>
    implements _$$UsuarioImplCopyWith<$Res> {
  __$$UsuarioImplCopyWithImpl(
      _$UsuarioImpl _value, $Res Function(_$UsuarioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? nome = null,
    Object? perfil = null,
    Object? cpf = null,
    Object? telefone = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UsuarioImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      perfil: null == perfil
          ? _value.perfil
          : perfil // ignore: cast_nullable_to_non_nullable
              as String,
      cpf: null == cpf
          ? _value.cpf
          : cpf // ignore: cast_nullable_to_non_nullable
              as String,
      telefone: freezed == telefone
          ? _value.telefone
          : telefone // ignore: cast_nullable_to_non_nullable
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
class _$UsuarioImpl implements _Usuario {
  const _$UsuarioImpl(
      {required this.id,
      required this.email,
      required this.nome,
      required this.perfil,
      required this.cpf,
      this.telefone,
      required this.createdAt,
      required this.updatedAt});

  factory _$UsuarioImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsuarioImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String nome;
  @override
  final String perfil;
  @override
  final String cpf;
  @override
  final String? telefone;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'Usuario(id: $id, email: $email, nome: $nome, perfil: $perfil, cpf: $cpf, telefone: $telefone, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsuarioImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.perfil, perfil) || other.perfil == perfil) &&
            (identical(other.cpf, cpf) || other.cpf == cpf) &&
            (identical(other.telefone, telefone) ||
                other.telefone == telefone) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, nome, perfil, cpf,
      telefone, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsuarioImplCopyWith<_$UsuarioImpl> get copyWith =>
      __$$UsuarioImplCopyWithImpl<_$UsuarioImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsuarioImplToJson(
      this,
    );
  }
}

abstract class _Usuario implements Usuario {
  const factory _Usuario(
      {required final int id,
      required final String email,
      required final String nome,
      required final String perfil,
      required final String cpf,
      final String? telefone,
      required final String createdAt,
      required final String updatedAt}) = _$UsuarioImpl;

  factory _Usuario.fromJson(Map<String, dynamic> json) = _$UsuarioImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get nome;
  @override
  String get perfil;
  @override
  String get cpf;
  @override
  String? get telefone;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$UsuarioImplCopyWith<_$UsuarioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UsuarioCreateRequest _$UsuarioCreateRequestFromJson(Map<String, dynamic> json) {
  return _UsuarioCreateRequest.fromJson(json);
}

/// @nodoc
mixin _$UsuarioCreateRequest {
  String get email => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String get perfil => throw _privateConstructorUsedError;
  String get cpf => throw _privateConstructorUsedError;
  String? get telefone => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsuarioCreateRequestCopyWith<UsuarioCreateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioCreateRequestCopyWith<$Res> {
  factory $UsuarioCreateRequestCopyWith(UsuarioCreateRequest value,
          $Res Function(UsuarioCreateRequest) then) =
      _$UsuarioCreateRequestCopyWithImpl<$Res, UsuarioCreateRequest>;
  @useResult
  $Res call(
      {String email,
      String nome,
      String perfil,
      String cpf,
      String? telefone,
      String password});
}

/// @nodoc
class _$UsuarioCreateRequestCopyWithImpl<$Res,
        $Val extends UsuarioCreateRequest>
    implements $UsuarioCreateRequestCopyWith<$Res> {
  _$UsuarioCreateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? nome = null,
    Object? perfil = null,
    Object? cpf = null,
    Object? telefone = freezed,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      perfil: null == perfil
          ? _value.perfil
          : perfil // ignore: cast_nullable_to_non_nullable
              as String,
      cpf: null == cpf
          ? _value.cpf
          : cpf // ignore: cast_nullable_to_non_nullable
              as String,
      telefone: freezed == telefone
          ? _value.telefone
          : telefone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsuarioCreateRequestImplCopyWith<$Res>
    implements $UsuarioCreateRequestCopyWith<$Res> {
  factory _$$UsuarioCreateRequestImplCopyWith(_$UsuarioCreateRequestImpl value,
          $Res Function(_$UsuarioCreateRequestImpl) then) =
      __$$UsuarioCreateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String nome,
      String perfil,
      String cpf,
      String? telefone,
      String password});
}

/// @nodoc
class __$$UsuarioCreateRequestImplCopyWithImpl<$Res>
    extends _$UsuarioCreateRequestCopyWithImpl<$Res, _$UsuarioCreateRequestImpl>
    implements _$$UsuarioCreateRequestImplCopyWith<$Res> {
  __$$UsuarioCreateRequestImplCopyWithImpl(_$UsuarioCreateRequestImpl _value,
      $Res Function(_$UsuarioCreateRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? nome = null,
    Object? perfil = null,
    Object? cpf = null,
    Object? telefone = freezed,
    Object? password = null,
  }) {
    return _then(_$UsuarioCreateRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      perfil: null == perfil
          ? _value.perfil
          : perfil // ignore: cast_nullable_to_non_nullable
              as String,
      cpf: null == cpf
          ? _value.cpf
          : cpf // ignore: cast_nullable_to_non_nullable
              as String,
      telefone: freezed == telefone
          ? _value.telefone
          : telefone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsuarioCreateRequestImpl implements _UsuarioCreateRequest {
  const _$UsuarioCreateRequestImpl(
      {required this.email,
      required this.nome,
      required this.perfil,
      required this.cpf,
      this.telefone,
      required this.password});

  factory _$UsuarioCreateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsuarioCreateRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String nome;
  @override
  final String perfil;
  @override
  final String cpf;
  @override
  final String? telefone;
  @override
  final String password;

  @override
  String toString() {
    return 'UsuarioCreateRequest(email: $email, nome: $nome, perfil: $perfil, cpf: $cpf, telefone: $telefone, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsuarioCreateRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.perfil, perfil) || other.perfil == perfil) &&
            (identical(other.cpf, cpf) || other.cpf == cpf) &&
            (identical(other.telefone, telefone) ||
                other.telefone == telefone) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, nome, perfil, cpf, telefone, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsuarioCreateRequestImplCopyWith<_$UsuarioCreateRequestImpl>
      get copyWith =>
          __$$UsuarioCreateRequestImplCopyWithImpl<_$UsuarioCreateRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsuarioCreateRequestImplToJson(
      this,
    );
  }
}

abstract class _UsuarioCreateRequest implements UsuarioCreateRequest {
  const factory _UsuarioCreateRequest(
      {required final String email,
      required final String nome,
      required final String perfil,
      required final String cpf,
      final String? telefone,
      required final String password}) = _$UsuarioCreateRequestImpl;

  factory _UsuarioCreateRequest.fromJson(Map<String, dynamic> json) =
      _$UsuarioCreateRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get nome;
  @override
  String get perfil;
  @override
  String get cpf;
  @override
  String? get telefone;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$UsuarioCreateRequestImplCopyWith<_$UsuarioCreateRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UsuarioUpdateRequest _$UsuarioUpdateRequestFromJson(Map<String, dynamic> json) {
  return _UsuarioUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$UsuarioUpdateRequest {
  String? get nome => throw _privateConstructorUsedError;
  String? get telefone => throw _privateConstructorUsedError;
  String? get perfil => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsuarioUpdateRequestCopyWith<UsuarioUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioUpdateRequestCopyWith<$Res> {
  factory $UsuarioUpdateRequestCopyWith(UsuarioUpdateRequest value,
          $Res Function(UsuarioUpdateRequest) then) =
      _$UsuarioUpdateRequestCopyWithImpl<$Res, UsuarioUpdateRequest>;
  @useResult
  $Res call({String? nome, String? telefone, String? perfil});
}

/// @nodoc
class _$UsuarioUpdateRequestCopyWithImpl<$Res,
        $Val extends UsuarioUpdateRequest>
    implements $UsuarioUpdateRequestCopyWith<$Res> {
  _$UsuarioUpdateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = freezed,
    Object? telefone = freezed,
    Object? perfil = freezed,
  }) {
    return _then(_value.copyWith(
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      telefone: freezed == telefone
          ? _value.telefone
          : telefone // ignore: cast_nullable_to_non_nullable
              as String?,
      perfil: freezed == perfil
          ? _value.perfil
          : perfil // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsuarioUpdateRequestImplCopyWith<$Res>
    implements $UsuarioUpdateRequestCopyWith<$Res> {
  factory _$$UsuarioUpdateRequestImplCopyWith(_$UsuarioUpdateRequestImpl value,
          $Res Function(_$UsuarioUpdateRequestImpl) then) =
      __$$UsuarioUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? nome, String? telefone, String? perfil});
}

/// @nodoc
class __$$UsuarioUpdateRequestImplCopyWithImpl<$Res>
    extends _$UsuarioUpdateRequestCopyWithImpl<$Res, _$UsuarioUpdateRequestImpl>
    implements _$$UsuarioUpdateRequestImplCopyWith<$Res> {
  __$$UsuarioUpdateRequestImplCopyWithImpl(_$UsuarioUpdateRequestImpl _value,
      $Res Function(_$UsuarioUpdateRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = freezed,
    Object? telefone = freezed,
    Object? perfil = freezed,
  }) {
    return _then(_$UsuarioUpdateRequestImpl(
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      telefone: freezed == telefone
          ? _value.telefone
          : telefone // ignore: cast_nullable_to_non_nullable
              as String?,
      perfil: freezed == perfil
          ? _value.perfil
          : perfil // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsuarioUpdateRequestImpl implements _UsuarioUpdateRequest {
  const _$UsuarioUpdateRequestImpl({this.nome, this.telefone, this.perfil});

  factory _$UsuarioUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsuarioUpdateRequestImplFromJson(json);

  @override
  final String? nome;
  @override
  final String? telefone;
  @override
  final String? perfil;

  @override
  String toString() {
    return 'UsuarioUpdateRequest(nome: $nome, telefone: $telefone, perfil: $perfil)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsuarioUpdateRequestImpl &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.telefone, telefone) ||
                other.telefone == telefone) &&
            (identical(other.perfil, perfil) || other.perfil == perfil));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nome, telefone, perfil);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsuarioUpdateRequestImplCopyWith<_$UsuarioUpdateRequestImpl>
      get copyWith =>
          __$$UsuarioUpdateRequestImplCopyWithImpl<_$UsuarioUpdateRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsuarioUpdateRequestImplToJson(
      this,
    );
  }
}

abstract class _UsuarioUpdateRequest implements UsuarioUpdateRequest {
  const factory _UsuarioUpdateRequest(
      {final String? nome,
      final String? telefone,
      final String? perfil}) = _$UsuarioUpdateRequestImpl;

  factory _UsuarioUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$UsuarioUpdateRequestImpl.fromJson;

  @override
  String? get nome;
  @override
  String? get telefone;
  @override
  String? get perfil;
  @override
  @JsonKey(ignore: true)
  _$$UsuarioUpdateRequestImplCopyWith<_$UsuarioUpdateRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
