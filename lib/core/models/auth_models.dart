import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Modelos de usuário
class Usuario {
  final int id;
  final String email;
  final String nome;
  final String perfil; // 'PRODUTOR', 'AGRÔNOMO', 'GESTOR', 'RTV', 'ENGENHEIRO'
  final String cpf;
  final String? telefone;
  final String createdAt;
  final String updatedAt;

  Usuario({
    required this.id,
    required this.email,
    required this.nome,
    required this.perfil,
    required this.cpf,
    this.telefone,
    required this.createdAt,
    required this.updatedAt,
  });

  Usuario copyWith({
    int? id,
    String? email,
    String? nome,
    String? perfil,
    String? cpf,
    String? telefone,
    String? createdAt,
    String? updatedAt,
  }) {
    return Usuario(
      id: id ?? this.id,
      email: email ?? this.email,
      nome: nome ?? this.nome,
      perfil: perfil ?? this.perfil,
      cpf: cpf ?? this.cpf,
      telefone: telefone ?? this.telefone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

/// Modelo de credenciais para login
class LoginCredentials {
  final String email;
  final String password;

  LoginCredentials({
    required this.email,
    required this.password,
  });
}

/// Resposta de autenticação
class AuthResponse {
  final Usuario usuario;
  final String token;
  final DateTime expiresAt;

  AuthResponse({
    required this.usuario,
    required this.token,
    required this.expiresAt,
  });
}

/// Estado de autenticação (usando Riverpod)
final authStateProvider = StreamProvider<Usuario?>((ref) async* {
  // TODO: Integrar com backend
  // Por enquanto, simular estado não autenticado
  yield null;
});

/// Provider para dados do usuário autenticado
final currentUserProvider = FutureProvider<Usuario?>((ref) async {
  // TODO: Obter usuário do SecureStorage
  return null;
});

/// Provider para token JWT
final jwtTokenProvider = FutureProvider<String?>((ref) async {
  // TODO: Obter token do SecureStorage
  return null;
});
