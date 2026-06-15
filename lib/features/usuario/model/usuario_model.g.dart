// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsuarioImpl _$$UsuarioImplFromJson(Map<String, dynamic> json) =>
    _$UsuarioImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      nome: json['nome'] as String,
      perfil: json['perfil'] as String,
      cpf: json['cpf'] as String,
      telefone: json['telefone'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$UsuarioImplToJson(_$UsuarioImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'nome': instance.nome,
      'perfil': instance.perfil,
      'cpf': instance.cpf,
      'telefone': instance.telefone,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$UsuarioCreateRequestImpl _$$UsuarioCreateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UsuarioCreateRequestImpl(
      email: json['email'] as String,
      nome: json['nome'] as String,
      perfil: json['perfil'] as String,
      cpf: json['cpf'] as String,
      telefone: json['telefone'] as String?,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$UsuarioCreateRequestImplToJson(
        _$UsuarioCreateRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'nome': instance.nome,
      'perfil': instance.perfil,
      'cpf': instance.cpf,
      'telefone': instance.telefone,
      'password': instance.password,
    };

_$UsuarioUpdateRequestImpl _$$UsuarioUpdateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UsuarioUpdateRequestImpl(
      nome: json['nome'] as String?,
      telefone: json['telefone'] as String?,
      perfil: json['perfil'] as String?,
    );

Map<String, dynamic> _$$UsuarioUpdateRequestImplToJson(
        _$UsuarioUpdateRequestImpl instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'telefone': instance.telefone,
      'perfil': instance.perfil,
    };
