/// Modelo local de Fazenda
class FazendaLocal {
  final String? id; // Pode ser null inicialmente (offline)
  final String nome;
  final String? localizacao;
  final double? latitude;
  final double? longitude;
  final double? areaTotal;
  final String? produtor;
  final DateTime createdAt;
  final DateTime updatedAt;

  FazendaLocal({
    this.id,
    required this.nome,
    this.localizacao,
    this.latitude,
    this.longitude,
    this.areaTotal,
    this.produtor,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'nome': nome,
    'localizacao': localizacao,
    'latitude': latitude,
    'longitude': longitude,
    'areaTotal': areaTotal,
    'produtor': produtor,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory FazendaLocal.fromMap(Map<String, dynamic> map) => FazendaLocal(
    id: map['id'] as String?,
    nome: map['nome'] as String,
    localizacao: map['localizacao'] as String?,
    latitude: map['latitude'] as double?,
    longitude: map['longitude'] as double?,
    areaTotal: map['areaTotal'] as double?,
    produtor: map['produtor'] as String?,
    createdAt: DateTime.parse(map['createdAt'] as String),
    updatedAt: DateTime.parse(map['updatedAt'] as String),
  );
}


