/// Modelo local de Evento de Manejo
class EventoLocal {
  final String? id; // Pode ser null inicialmente (offline)
  final String? talhaoId;
  final String tipo; // 'PULVERIZACAO', 'ADUBACAO', 'IRRIGACAO', etc.
  final DateTime dataEvento;
  final String? descricao;
  final Map<String, dynamic>? dados; // JSON com dados específicos do evento
  final String? status; // 'PENDENTE', 'EXECUTADO', 'CANCELADO'
  final String? responsavel;
  final String? fotoUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  EventoLocal({
    this.id,
    this.talhaoId,
    required this.tipo,
    required this.dataEvento,
    this.descricao,
    this.dados,
    this.status,
    this.responsavel,
    this.fotoUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'talhaoId': talhaoId,
    'tipo': tipo,
    'dataEvento': dataEvento.toIso8601String(),
    'descricao': descricao,
    'dados': dados,
    'status': status,
    'responsavel': responsavel,
    'fotoUrl': fotoUrl,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory EventoLocal.fromMap(Map<String, dynamic> map) => EventoLocal(
    id: map['id'] as String?,
    talhaoId: map['talhaoId'] as String?,
    tipo: map['tipo'] as String,
    dataEvento: DateTime.parse(map['dataEvento'] as String),
    descricao: map['descricao'] as String?,
    dados: map['dados'] as Map<String, dynamic>?,
    status: map['status'] as String?,
    responsavel: map['responsavel'] as String?,
    fotoUrl: map['fotoUrl'] as String?,
    createdAt: DateTime.parse(map['createdAt'] as String),
    updatedAt: DateTime.parse(map['updatedAt'] as String),
  );
}


