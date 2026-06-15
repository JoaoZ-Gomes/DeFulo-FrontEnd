import 'package:freezed_annotation/freezed_annotation.dart';

part 'fazenda_model.freezed.dart';
part 'fazenda_model.g.dart';

@freezed
class Fazenda with _$Fazenda {
  const factory Fazenda({
    required int id,
    required String nome,
    required String cnpj,
    required int produtorId,
    required String municipio,
    required String estado,
    required String areaTotal,
    required String createdAt,
    required String updatedAt,
  }) = _Fazenda;

  factory Fazenda.fromJson(Map<String, dynamic> json) =>
      _$FazendasFromJson(json);
}

@freezed
class FazendasCreateRequest with _$FazendasCreateRequest {
  const factory FazendasCreateRequest({
    required String nome,
    required String cnpj,
    required String municipio,
    required String estado,
    required String areaTotal,
  }) = _FazendasCreateRequest;

  factory FazendasCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$FazendasCreateRequestFromJson(json);
}

@freezed
class FazendasUpdateRequest with _$FazendasUpdateRequest {
  const factory FazendasUpdateRequest({
    String? nome,
    String? municipio,
    String? estado,
    String? areaTotal,
  }) = _FazendasUpdateRequest;

  factory FazendasUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$FazendasUpdateRequestFromJson(json);
}
