/// Modelo local de Talhão
class TalhaoLocal {
  final String? id; // Pode ser null inicialmente (offline)
  final String fazendaId; // ID da fazenda local ou remoto
  final String nome;
  final double? area;
  final String? culturaAtual;
  final String? status; // 'ATIVO', 'INATIVO', 'PREPARACAO'
  final double? umidadeSolo;
  final double? temperatura;
  final DateTime? dataUltimoEvento;
  final DateTime createdAt;
  final DateTime updatedAt;

  TalhaoLocal({
    this.id,
    required this.fazendaId,
    required this.nome,
    this.area,
    this.culturaAtual,
    this.status,
    this.umidadeSolo,
    this.temperatura,
    this.dataUltimoEvento,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'fazendaId': fazendaId,
    'nome': nome,
    'area': area,
    'culturaAtual': culturaAtual,
    'status': status,
    'umidadeSolo': umidadeSolo,
    'temperatura': temperatura,
    'dataUltimoEvento': dataUltimoEvento?.toIso8601String(),
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory TalhaoLocal.fromMap(Map<String, dynamic> map) => TalhaoLocal(
    id: map['id'] as String?,
    fazendaId: map['fazendaId'] as String,
    nome: map['nome'] as String,
    area: map['area'] as double?,
    culturaAtual: map['culturaAtual'] as String?,
    status: map['status'] as String?,
    umidadeSolo: map['umidadeSolo'] as double?,
    temperatura: map['temperatura'] as double?,
    dataUltimoEvento: map['dataUltimoEvento'] != null
      ? DateTime.parse(map['dataUltimoEvento'] as String)
      : null,
    createdAt: DateTime.parse(map['createdAt'] as String),
    updatedAt: DateTime.parse(map['updatedAt'] as String),
  );
}


