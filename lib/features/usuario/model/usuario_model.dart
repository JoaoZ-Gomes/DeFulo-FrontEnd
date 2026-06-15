import 'package:freezed_annotation/freezed_annotation.dart';

part 'usuario_model.freezed.dart';
part 'usuario_model.g.dart';

@freezed
class Usuario with _$Usuario {
  const factory Usuario({
    required int id,
    required String email,
    required String nome,
    required String perfil,
    required String cpf,
    String? telefone,
    required String createdAt,
    required String updatedAt,
  }) = _Usuario;

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);
}

@freezed
class UsuarioCreateRequest with _$UsuarioCreateRequest {
  const factory UsuarioCreateRequest({
    required String email,
    required String nome,
    required String perfil,
    required String cpf,
    String? telefone,
    required String password,
  }) = _UsuarioCreateRequest;

  factory UsuarioCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$UsuarioCreateRequestFromJson(json);
}

@freezed
class UsuarioUpdateRequest with _$UsuarioUpdateRequest {
  const factory UsuarioUpdateRequest({
    String? nome,
    String? telefone,
    String? perfil,
  }) = _UsuarioUpdateRequest;

  factory UsuarioUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$UsuarioUpdateRequestFromJson(json);
}
