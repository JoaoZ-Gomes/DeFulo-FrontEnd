// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fazenda_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FazendaImpl _$$FazendaImplFromJson(Map<String, dynamic> json) =>
    _$FazendaImpl(
      id: (json['id'] as num).toInt(),
      nome: json['nome'] as String,
      cnpj: json['cnpj'] as String,
      produtorId: (json['produtorId'] as num).toInt(),
      municipio: json['municipio'] as String,
      estado: json['estado'] as String,
      areaTotal: json['areaTotal'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$FazendaImplToJson(_$FazendaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'cnpj': instance.cnpj,
      'produtorId': instance.produtorId,
      'municipio': instance.municipio,
      'estado': instance.estado,
      'areaTotal': instance.areaTotal,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$FazendasCreateRequestImpl _$$FazendasCreateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$FazendasCreateRequestImpl(
      nome: json['nome'] as String,
      cnpj: json['cnpj'] as String,
      municipio: json['municipio'] as String,
      estado: json['estado'] as String,
      areaTotal: json['areaTotal'] as String,
    );

Map<String, dynamic> _$$FazendasCreateRequestImplToJson(
        _$FazendasCreateRequestImpl instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'cnpj': instance.cnpj,
      'municipio': instance.municipio,
      'estado': instance.estado,
      'areaTotal': instance.areaTotal,
    };

_$FazendasUpdateRequestImpl _$$FazendasUpdateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$FazendasUpdateRequestImpl(
      nome: json['nome'] as String?,
      municipio: json['municipio'] as String?,
      estado: json['estado'] as String?,
      areaTotal: json['areaTotal'] as String?,
    );

Map<String, dynamic> _$$FazendasUpdateRequestImplToJson(
        _$FazendasUpdateRequestImpl instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'municipio': instance.municipio,
      'estado': instance.estado,
      'areaTotal': instance.areaTotal,
    };
