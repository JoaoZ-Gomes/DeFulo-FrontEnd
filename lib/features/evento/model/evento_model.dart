import 'package:freezed_annotation/freezed_annotation.dart';

part 'evento_model.freezed.dart';
part 'evento_model.g.dart';

@freezed
class EventoManejo with _$EventoManejo {
  const factory EventoManejo({
    required int id,
    required int talhaoId,
    required String tipoEvento,
    String? descricao,
    required String dataEvento,
    required String dataRegistro,
    required String responsavel,
    String? notas,
    required String createdAt,
    required String updatedAt,
  }) = _EventoManejo;

  factory EventoManejo.fromJson(Map<String, dynamic> json) =>
      _$EventoManejoFromJson(json);
}

@freezed
class EventoManejoCreateRequest with _$EventoManejoCreateRequest {
  const factory EventoManejoCreateRequest({
    required int talhaoId,
    required String tipoEvento,
    String? descricao,
    required String dataEvento,
    String? notas,
  }) = _EventoManejoCreateRequest;

  factory EventoManejoCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$EventoManejoCreateRequestFromJson(json);
}

@freezed
class EventoManejoUpdateRequest with _$EventoManejoUpdateRequest {
  const factory EventoManejoUpdateRequest({
    String? tipoEvento,
    String? descricao,
    String? dataEvento,
    String? notas,
  }) = _EventoManejoUpdateRequest;

  factory EventoManejoUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$EventoManejoUpdateRequestFromJson(json);
}
