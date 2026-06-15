import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Modelo simplificado de Usuário (para preview)
class Usuario {
  final String id;
  final String nome;
  final String email;

  Usuario({required this.id, required this.nome, required this.email});
}

class AuthStateNotifier extends StateNotifier<AsyncValue<Usuario?>> {
  AuthStateNotifier() : super(const AsyncValue.data(null));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    // Simula um delay de rede
    await Future.delayed(const Duration(seconds: 1));
    // Aceita qualquer credencial para preview
    state = AsyncValue.data(Usuario(id: '1', nome: 'Produtor', email: email));
  }

  void logout() {
    state = const AsyncValue.data(null);
  }
}

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AsyncValue<Usuario?>>((ref) {
  return AuthStateNotifier();
});

/// Serviço de autenticação mock para manter compatibilidade
class AuthService {
  final AuthStateNotifier notifier;
  AuthService(this.notifier);

  Future<void> login(String email, String password) => notifier.login(email, password);
  void logout() => notifier.logout();
}

final authServiceProvider = Provider((ref) {
  return AuthService(ref.watch(authStateProvider.notifier));
});
