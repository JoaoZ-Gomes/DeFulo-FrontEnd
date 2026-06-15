// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventoManejoImpl _$$EventoManejoImplFromJson(Map<String, dynamic> json) =>
    _$EventoManejoImpl(
      id: (json['id'] as num).toInt(),
      talhaoId: (json['talhaoId'] as num).toInt(),
      tipoEvento: json['tipoEvento'] as String,
      descricao: json['descricao'] as String?,
      dataEvento: json['dataEvento'] as String,
      dataRegistro: json['dataRegistro'] as String,
      responsavel: json['responsavel'] as String,
      notas: json['notas'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$EventoManejoImplToJson(_$EventoManejoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'talhaoId': instance.talhaoId,
      'tipoEvento': instance.tipoEvento,
      'descricao': instance.descricao,
      'dataEvento': instance.dataEvento,
      'dataRegistro': instance.dataRegistro,
      'responsavel': instance.responsavel,
      'notas': instance.notas,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$EventoManejoCreateRequestImpl _$$EventoManejoCreateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$EventoManejoCreateRequestImpl(
      talhaoId: (json['talhaoId'] as num).toInt(),
      tipoEvento: json['tipoEvento'] as String,
      descricao: json['descricao'] as String?,
      dataEvento: json['dataEvento'] as String,
      notas: json['notas'] as String?,
    );

Map<String, dynamic> _$$EventoManejoCreateRequestImplToJson(
        _$EventoManejoCreateRequestImpl instance) =>
    <String, dynamic>{
      'talhaoId': instance.talhaoId,
      'tipoEvento': instance.tipoEvento,
      'descricao': instance.descricao,
      'dataEvento': instance.dataEvento,
      'notas': instance.notas,
    };

_$EventoManejoUpdateRequestImpl _$$EventoManejoUpdateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$EventoManejoUpdateRequestImpl(
      tipoEvento: json['tipoEvento'] as String?,
      descricao: json['descricao'] as String?,
      dataEvento: json['dataEvento'] as String?,
      notas: json['notas'] as String?,
    );

Map<String, dynamic> _$$EventoManejoUpdateRequestImplToJson(
        _$EventoManejoUpdateRequestImpl instance) =>
    <String, dynamic>{
      'tipoEvento': instance.tipoEvento,
      'descricao': instance.descricao,
      'dataEvento': instance.dataEvento,
      'notas': instance.notas,
    };
