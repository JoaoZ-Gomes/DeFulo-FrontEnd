// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talhao_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TalhaoImpl _$$TalhaoImplFromJson(Map<String, dynamic> json) => _$TalhaoImpl(
      id: (json['id'] as num).toInt(),
      nome: json['nome'] as String,
      fazendasId: (json['fazendasId'] as num).toInt(),
      area: json['area'] as String,
      cultura: json['cultura'] as String,
      dataPlantio: json['dataPlantio'] as String?,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$TalhaoImplToJson(_$TalhaoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'fazendasId': instance.fazendasId,
      'area': instance.area,
      'cultura': instance.cultura,
      'dataPlantio': instance.dataPlantio,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$TalhaoCreateRequestImpl _$$TalhaoCreateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$TalhaoCreateRequestImpl(
      nome: json['nome'] as String,
      fazendasId: (json['fazendasId'] as num).toInt(),
      area: json['area'] as String,
      cultura: json['cultura'] as String,
      dataPlantio: json['dataPlantio'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$TalhaoCreateRequestImplToJson(
        _$TalhaoCreateRequestImpl instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'fazendasId': instance.fazendasId,
      'area': instance.area,
      'cultura': instance.cultura,
      'dataPlantio': instance.dataPlantio,
      'status': instance.status,
    };

_$TalhaoUpdateRequestImpl _$$TalhaoUpdateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$TalhaoUpdateRequestImpl(
      nome: json['nome'] as String?,
      area: json['area'] as String?,
      cultura: json['cultura'] as String?,
      dataPlantio: json['dataPlantio'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$TalhaoUpdateRequestImplToJson(
        _$TalhaoUpdateRequestImpl instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'area': instance.area,
      'cultura': instance.cultura,
      'dataPlantio': instance.dataPlantio,
      'status': instance.status,
    };
