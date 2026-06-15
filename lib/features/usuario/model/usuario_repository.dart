import '../../core/database/database.dart';
import '../../core/repository/offline_first_repository.dart';

/// Modelo local de Usuário
class UsuarioLocal {
  final int id;
  final String email;
  final String nome;
  final String perfil;
  final String cpf;
  final String? telefone;
  final DateTime createdAt;
  final DateTime updatedAt;

  UsuarioLocal({
    required this.id,
    required this.email,
    required this.nome,
    required this.perfil,
    required this.cpf,
    this.telefone,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'email': email,
    'nome': nome,
    'perfil': perfil,
    'cpf': cpf,
    'telefone': telefone,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory UsuarioLocal.fromMap(Map<String, dynamic> map) => UsuarioLocal(
    id: map['id'] as int,
    email: map['email'] as String,
    nome: map['nome'] as String,
    perfil: map['perfil'] as String,
    cpf: map['cpf'] as String,
    telefone: map['telefone'] as String?,
    createdAt: DateTime.parse(map['createdAt'] as String),
    updatedAt: DateTime.parse(map['updatedAt'] as String),
  );
}

/// Repositório offline-first para Usuários
class UsuarioRepository extends OfflineFirstRepository<UsuarioLocal> {
  final DeFuloDatabase db;

  UsuarioRepository(this.db);

  @override
  String get entityName => 'usuario';

  @override
  Future<UsuarioLocal?> save(UsuarioLocal entity) async {
    return super.save(entity);
  }

  // Custom methods would go here

  /// Encontrar usuário por email
  Future<UsuarioLocal?> findByEmail(String email) async {
    // TODO: Implementar query no SQLite
    return null;
  }

  /// Encontrar usuários por perfil
  Future<List<UsuarioLocal>> findByPerfil(String perfil) async {
    // TODO: Implementar query no SQLite
    return [];
  }
}
