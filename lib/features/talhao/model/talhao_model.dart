import 'package:freezed_annotation/freezed_annotation.dart';

part 'talhao_model.freezed.dart';
part 'talhao_model.g.dart';

@freezed
class Talhao with _$Talhao {
  const factory Talhao({
    required int id,
    required String nome,
    required int fazendasId,
    required String area,
    required String cultura,
    String? dataPlantio,
    required String status,
    required String createdAt,
    required String updatedAt,
  }) = _Talhao;

  factory Talhao.fromJson(Map<String, dynamic> json) =>
      _$TalhaoFromJson(json);
}

@freezed
class TalhaoCreateRequest with _$TalhaoCreateRequest {
  const factory TalhaoCreateRequest({
    required String nome,
    required int fazendasId,
    required String area,
    required String cultura,
    String? dataPlantio,
    required String status,
  }) = _TalhaoCreateRequest;

  factory TalhaoCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$TalhaoCreateRequestFromJson(json);
}

@freezed
class TalhaoUpdateRequest with _$TalhaoUpdateRequest {
  const factory TalhaoUpdateRequest({
    String? nome,
    String? area,
    String? cultura,
    String? dataPlantio,
    String? status,
  }) = _TalhaoUpdateRequest;

  factory TalhaoUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$TalhaoUpdateRequestFromJson(json);
}
