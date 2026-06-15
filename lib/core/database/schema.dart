import 'package:drift/drift.dart';

// ============================================================================
// ENTIDADES LOCAIS (Espelho do Backend)
// ============================================================================

class UsuariosLocal extends Table {
  IntColumn get id => integer().primaryKey()();
  TextColumn get email => text().unique()();
  TextColumn get nome => text()();
  TextColumn get perfil => text()(); // 'PRODUTOR', 'AGRÔNOMO', 'GESTOR', 'RTV', 'ENGENHEIRO'
  TextColumn get cpf => text().unique()();
  TextColumn get telefone => text().nullable()();
  TextColumn get creatdAt => text()();
  TextColumn get updatedAt => text()();
}

class FazendasLocal extends Table {
  IntColumn get id => integer().primaryKey()();
  TextColumn get nome => text()();
  TextColumn get cnpj => text().unique()();
  IntColumn get produtorId => integer().customConstraint('REFERENCES usuarios_local(id)')();
  TextColumn get municipio => text()();
  TextColumn get estado => text()();
  TextColumn get areaTotal => text()(); // em hectares
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();
}

class TalhoesLocal extends Table {
  IntColumn get id => integer().primaryKey()();
  TextColumn get nome => text()();
  IntColumn get fazendasId => integer().customConstraint('REFERENCES fazendas_local(id)')();
  TextColumn get area => text()(); // em hectares
  TextColumn get cultura => text()();
  TextColumn get dataPlantio => text().nullable()();
  TextColumn get status => text()(); // 'ATIVA', 'PLANEJADA', 'FINALIZADA'
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();
}

class EventosManejosLocal extends Table {
  IntColumn get id => integer().primaryKey()();
  IntColumn get talhaoId => integer().customConstraint('REFERENCES talhoes_local(id)')();
  TextColumn get tipoEvento => text()(); // 'ADUBAÇÃO', 'IRRIGAÇÃO', 'PULVERIZAÇÃO', etc
  TextColumn get descricao => text().nullable()();
  TextColumn get dataEvento => text()();
  TextColumn get dataRegistro => text()();
  TextColumn get responsavel => text()();
  TextColumn get notas => text().nullable()();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();
}

// ============================================================================
// TABELAS DE CONTROLE DE SINCRONIZAÇÃO
// ============================================================================

class SyncQueue extends Table {
  IntColumn get id => integer().primaryKey().autoIncrement()();
  TextColumn get entityType => text()(); // 'usuario', 'fazenda', 'talhao', 'evento'
  TextColumn get entityIdLocal => text()(); // UUID ou ID local temporário
  IntColumn get entityIdRemote => integer().nullable()(); // ID real do servidor
  TextColumn get operation => text()(); // 'CREATE', 'UPDATE', 'DELETE'
  TextColumn get payload => text()(); // JSON serializado
  TextColumn get status => text().withDefault(const Constant('PENDING'))(); // PENDING | IN_PROGRESS | SUCCESS | CONFLICT | ERROR
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  IntColumn get maxRetries => integer().withDefault(const Constant(3))();
  TextColumn get createdAt => text()();
  TextColumn get lastAttemptAt => text().nullable()();
  TextColumn get errorMessage => text().nullable()();
  TextColumn get checksum => text()(); // SHA-256 do payload
  IntColumn get version => integer().withDefault(const Constant(1))();
  TextColumn get originDevice => text()(); // UUID do dispositivo
  
  @override
  String get tableName => 'sync_queue';
}

class SyncLog extends Table {
  IntColumn get id => integer().primaryKey().autoIncrement()();
  TextColumn get syncId => text()(); // UUID da sessão
  TextColumn get startedAt => text()();
  TextColumn get finishedAt => text().nullable()();
  IntColumn get totalItems => integer().withDefault(const Constant(0))();
  IntColumn get success => integer().withDefault(const Constant(0))();
  IntColumn get conflicts => integer().withDefault(const Constant(0))();
  IntColumn get errors => integer().withDefault(const Constant(0))();
  TextColumn get status => text()(); // RUNNING | DONE | PARTIAL | FAILED
  
  @override
  String get tableName => 'sync_log';
}

class IdMapping extends Table {
  TextColumn get localUuid => text().primaryKey()();
  IntColumn get remoteId => integer()();
  TextColumn get entityType => text()(); // usuario | fazenda | talhao | evento
  TextColumn get syncedAt => text()();
  
  @override
  String get tableName => 'id_mapping';
}

class SyncMetadata extends Table {
  TextColumn get key => text().primaryKey()();
  TextColumn get value => text()();
  TextColumn get updatedAt => text()();
  
  @override
  String get tableName => 'sync_metadata';
}
