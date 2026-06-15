import 'dart:async';
import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';
import 'package:logger/logger.dart';
import '../models/sync_models.dart';

/// Abstract base class para o padrão OfflineFirstRepository
/// 
/// Implementa local-first write pattern:
/// - ESCRITA: sempre local primeiro, depois enfileira sync
/// - LEITURA: retorna do cache local se disponível
/// - STALE: marca dados como obsoletos após 30 min sem sync bem-sucedido
abstract class OfflineFirstRepository<T, ID> {
  final Logger _logger = Logger();
  static const _staleThresholdMinutes = 30;

  /// Salvar entidade localmente e enfileirar para sincronização
  /// 
  /// Se entidade não tem ID remoto, gera UUID local temporário
  /// 
  /// Retorna: entidade salva com ID temporário (se criação) ou ID real (se atualização)
  Future<T> save(T entity);

  /// Buscar entidade por ID (local first)
  /// 
  /// 1. Busca no cache local
  /// 2. Se não existir ou marcado como stale: busca no remoto
  /// 3. Atualiza cache com versão remota mais recente
  Future<T?> findById(ID id);

  /// Listar todas as entidades (local first)
  /// 
  /// 1. Retorna do cache local
  /// 2. Se todos marcados como stale: faz refresh do remoto
  Future<List<T>> findAll();

  /// Deletar entidade (soft delete local + enfileira)
  /// 
  /// Não deleta imediatamente do cache; marca como deletado
  /// e enfileira operação DELETE para sincronizar
  Future<void> delete(ID id);

  /// Processar fila de sincronização pendente
  /// 
  /// Orquestra todo o fluxo:
  /// 1. Verificar conectividade
  /// 2. Processar itens com checksums e conflitos
  /// 3. Fazer push ao servidor
  /// 4. Fazer pull de dados atualizados
  /// 5. Atualizar cache local e marcar como sincronizado
  Future<void> syncPendingItems();

  /// Gerar checksum SHA-256 para detectar alterações locais
  String generateChecksum(Map<String, dynamic> data) {
    final json = _serializeToJson(data);
    return sha256.convert(json.codeUnits).toString();
  }

  /// Gerar UUID v4 local para IDs temporários
  String generateLocalId() {
    return const Uuid().v4();
  }

  /// Criar SyncItem a partir de uma entidade
  SyncItem createSyncItem({
    required String localId,
    required String entityType,
    required String operation,
    required Map<String, dynamic> payload,
    required int version,
  }) {
    final checksum = generateChecksum(payload);
    return SyncItem(
      localId: localId,
      entityType: entityType,
      operation: operation,
      payload: payload,
      localVersion: version,
      checksum: checksum,
      createdAt: DateTime.now().toUtc().toIso8601String(),
    );
  }

  /// Converter entidade para JSON
  Map<String, dynamic> entityToJson(T entity);

  /// Converter JSON para entidade
  T jsonToEntity(Map<String, dynamic> json);

  /// Verificar se entidade está marcada como stale
  bool isStale(DateTime lastSyncTime) {
    final now = DateTime.now().toUtc();
    final diff = now.difference(lastSyncTime);
    return diff.inMinutes > _staleThresholdMinutes;
  }

  /// Serializar dados para string JSON de forma determinística
  String _serializeToJson(Map<String, dynamic> data) {
    // Ordenar chaves para garantir checksum consistente
    final sortedKeys = (data.keys.toList()..sort());
    final buffer = StringBuffer('{');
    
    for (int i = 0; i < sortedKeys.length; i++) {
      final key = sortedKeys[i];
      buffer.write('"$key":${_encodeValue(data[key])}');
      if (i < sortedKeys.length - 1) buffer.write(',');
    }
    
    buffer.write('}');
    return buffer.toString();
  }

  /// Codificar valor para JSON de forma determinística
  String _encodeValue(dynamic value) {
    if (value == null) return 'null';
    if (value is String) return '"${value.replaceAll('"', '\\"')}"';
    if (value is num || value is bool) return value.toString();
    if (value is List) {
      final items = (value as List).map(_encodeValue).join(',');
      return '[$items]';
    }
    if (value is Map) {
      final map = value.cast<String, dynamic>();
      return _serializeToJson(map);
    }
    return '"$value"';
  }

  /// Log de operação
  void logOperation(String message) {
    _logger.i('📦 $message');
  }

  /// Log de erro
  void logError(String message, Object? error) {
    _logger.e('❌ $message', error: error);
  }

  /// Log de sucesso
  void logSuccess(String message) {
    _logger.i('✅ $message');
  }

  /// Log de aviso
  void logWarning(String message) {
    _logger.w('⚠️ $message');
  }
}
