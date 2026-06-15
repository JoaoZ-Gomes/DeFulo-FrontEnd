import 'dart:async';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';
import '../connectivity/connectivity_service.dart';
import '../database/database.dart';
import '../models/sync_models.dart';
import '../conflict/conflict_resolver.dart';

/// Motor principal de sincronização offline-first
/// 
/// Orquestra:
/// 1. Verificações de conectividade (4 camadas)
/// 2. Processamento de fila de sync com validações (V1-V8)
/// 3. Resolução de conflitos
/// 4. Pull remoto de dados atualizados
/// 5. Retry automático com backoff exponencial
class SyncEngine {
  final DeFuloDatabase _db;
  final Dio _dio;
  final ConnectivityService _connectivityService;
  final String _baseUrl;
  final Logger _logger = Logger();

  // Configuração de retry
  static const List<Duration> _retryBackoff = [
    Duration(seconds: 30),
    Duration(minutes: 2),
    Duration(minutes: 10),
  ];

  // Estados do sync
  bool _isSyncing = false;
  late StreamController<SyncEngineState> _stateController;
  late StreamController<SyncProgress> _progressController;

  SyncEngine({
    required DeFuloDatabase db,
    required Dio dio,
    required ConnectivityService connectivityService,
    required String baseUrl,
  })  : _db = db,
        _dio = dio,
        _connectivityService = connectivityService,
        _baseUrl = baseUrl {
    _stateController = StreamController<SyncEngineState>.broadcast();
    _progressController = StreamController<SyncProgress>.broadcast();
  }

  bool get isSyncing => _isSyncing;
  Stream<SyncEngineState> get stateStream => _stateController.stream;
  Stream<SyncProgress> get progressStream => _progressController.stream;

  /// Iniciar sincronização completa
  /// 
  /// Fluxo:
  /// 1. [V1] Verificar conectividade
  /// 2. [V2] Verificar servidor
  /// 3. [V3] Verificar autenticação
  /// 4. [V4] Verificar qualidade de conexão
  /// 5. Processar fila de itens pendentes
  /// 6. Fazer push ao servidor
  /// 7. Fazer pull de atualizações
  /// 8. Atualizar cache local
  /// 9. Finalizar e notificar
  Future<void> startSync() async {
    if (_isSyncing) {
      _logger.w('⏳ Sincronização já em andamento');
      return;
    }

    _isSyncing = true;
    final syncId = const Uuid().v4();
    final startTime = DateTime.now().toUtc();

    try {
      _logger.i('🔄 INICIANDO SINCRONIZAÇÃO (ID: $syncId)');
      _emitState(SyncEngineState.syncing);

      // CRIAÇÃO DO LOG
      final syncLogId = await _db.into(_db.syncLog).insert(
        SyncLogCompanion(
          syncId: Value(syncId),
          startedAt: Value(startTime.toIso8601String()),
          status: const Value('RUNNING'),
        ),
      );

      // VERIFICAÇÕES PRÉ-SYNC
      final isConnected = await _performConnectivityChecks();
      if (!isConnected) {
        _logger.w('❌ SYNC ABORTADA: Sem conectividade');
        await _finalizeSyncLog(syncLogId, 'FAILED');
        _emitState(SyncEngineState.offline);
        return;
      }

      // ALERTAR SE CONEXÃO INSTÁVEL
      if (_connectivityService.shouldAlertUserAboutInstability()) {
        _logger.w('⚠️ Latência alta: ${_connectivityService.latencyMs}ms');
        _emitState(SyncEngineState.unstableConnection);
      }

      // BUSCAR ITENS PENDENTES
      final pendingItems = await _db.getPendingItems();
      if (pendingItems.isEmpty) {
        _logger.i('✅ Nenhum item pendente para sincronizar');
        await _finalizeSyncLog(syncLogId, 'DONE', 0, 0, 0, 0);
        _emitState(SyncEngineState.idle);
        return;
      }

      _logger.i('📋 ${pendingItems.length} itens pendentes encontrados');

      // PROCESSAR CADA ITEM
      int successCount = 0;
      int conflictCount = 0;
      int errorCount = 0;

      for (int i = 0; i < pendingItems.length; i++) {
        final item = pendingItems[i];
        _emitProgress(
          current: i + 1,
          total: pendingItems.length,
          currentItemId: item.localId,
        );

        try {
          // V5: VERIFICAR CHECKSUM
          final checksumValid = await _verifyChecksum(item);
          if (!checksumValid) {
            _logger.w(
              '⚠️ [V5] Checksum divergente para ${item.localId} '
              '- Payload foi alterado localmente',
            );
            // Atualizar payload e checksum
            await _updateItemChecksum(item.id);
          }

          // V6: VERIFICAR DUPLICATA (IDEMPOTÊNCIA)
          final isDuplicate = await _checkForDuplicate(item);
          if (isDuplicate) {
            _logger.i(
              '✅ [V6] Item ${item.localId} já sincronizado - '
              'Marcando como SUCCESS',
            );
            await _db.updateSyncQueueStatus(item.id, 'SUCCESS');
            successCount++;
            continue;
          }

          // V7: VERIFICAR CONFLITO DE VERSÃO (OCC)
          final hasConflict = await _checkVersionConflict(item);
          if (hasConflict) {
            _logger.w('⚠️ [V7] Conflito de versão detectado para ${item.localId}');
            conflictCount++;
            
            // Aplicar estratégia de resolução
            await _resolveConflict(item);
            continue;
          }

          // EXECUTAR OPERAÇÃO NO SERVIDOR
          final result = await _executeRemoteOperation(item);

          if (result.success) {
            // V8: VERIFICAÇÃO DE RESPOSTA HTTP BEM-SUCEDIDA
            _logger.i('✅ [V8] ${item.operation} ${item.entityType} '
                '${item.localId} sincronizado com sucesso');
            
            // Atualizar ID remoto se for CREATE
            if (item.operation == 'CREATE' && result.remoteId != null) {
              await _updateIdMapping(
                item.localId,
                result.remoteId!,
                item.entityType,
              );
            }

            await _db.updateSyncQueueStatus(item.id, 'SUCCESS');
            successCount++;
          } else {
            // Tratamento de erros específicos (V8)
            await _handleRemoteOperationError(item, result);
            errorCount++;
          }
        } catch (e) {
          _logger.e('❌ Erro ao sincronizar item ${item.localId}', error: e);
          await _db.updateSyncQueueStatus(
            item.id,
            'ERROR',
            errorMessage: e.toString(),
          );
          await _db.incrementRetryCount(item.id);
          errorCount++;
        }
      }

      // PULL REMOTO (após push bem-sucedido)
      _logger.i('📥 Iniciando pull de dados atualizados do servidor');
      await _performPullSync();

      // FINALIZAR LOG
      await _finalizeSyncLog(
        syncLogId,
        'DONE',
        pendingItems.length,
        successCount,
        conflictCount,
        errorCount,
      );

      // DETERMINAR ESTADO FINAL
      if (errorCount == 0 && conflictCount == 0) {
        _logger.i('✅ SINCRONIZAÇÃO CONCLUÍDA COM SUCESSO');
        _emitState(SyncEngineState.done);
      } else if (successCount > 0) {
        _logger.w('⚠️ SINCRONIZAÇÃO PARCIALMENTE CONCLUÍDA '
            '(${errorCount} erros, ${conflictCount} conflitos)');
        _emitState(SyncEngineState.partial);
      } else {
        _logger.e('❌ SINCRONIZAÇÃO FALHOU COMPLETAMENTE');
        _emitState(SyncEngineState.error);
      }
    } catch (e) {
      _logger.e('❌ Erro crítico durante sincronização', error: e);
      _emitState(SyncEngineState.error);
    } finally {
      _isSyncing = false;
    }
  }

  /// VERIFICAÇÕES PRÉ-SYNC (V1-V4)
  Future<bool> _performConnectivityChecks() async {
    _logger.i('🔌 Realizando verificações de conectividade (V1-V4)');
    return _connectivityService.isOnline;
  }

  /// V5: VERIFICAR CHECKSUM DO PAYLOAD
  Future<bool> _verifyChecksum(SyncQueueData item) async {
    final payload = _parseJsonPayload(item.payload);
    // TODO: Implementar recalculação do checksum
    return true;
  }

  /// V6: VERIFICAR DUPLICATA (IDEMPOTÊNCIA)
  Future<bool> _checkForDuplicate(SyncQueueData item) async {
    try {
      // Verificar se já existe no servidor com mesmo origin_device + entity_id_local
      final response = await _dio.get(
        '$_baseUrl/api/sync/status/${item.originDevice}',
        options: Options(receiveTimeout: const Duration(seconds: 3)),
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        // Se sync foi bem-sucedido antes, já existe no servidor
        return data['lastSyncStatus'] == 'DONE';
      }
      return false;
    } catch (e) {
      _logger.d('Não conseguiu verificar duplicata: $e');
      return false;
    }
  }

  /// V7: VERIFICAR CONFLITO DE VERSÃO (OCC)
  Future<bool> _checkVersionConflict(SyncQueueData item) async {
    if (item.operation == 'CREATE') return false; // CREATE não tem versão conflitante

    try {
      // Buscar versão remota do recurso
      // Assumindo endpoint GET /api/{entityType}/{id}
      // response deveria ter campo 'version'
      // if (remoteVersion > localVersion) → conflito
      return false; // TODO: Implementar após ter endpoints backend
    } catch (e) {
      return false;
    }
  }

  /// RESOLVER CONFLITO USANDO ESTRATÉGIA CONFIGURADA
  Future<void> _resolveConflict(SyncQueueData item) async {
    final resolver = ConflictResolverFactory.getDefaultResolver(item.entityType);
    
    // TODO: Buscar dados remotos e aplicar resolver
    // await resolver.resolve(...)
    _logger.w('⏳ Conflito aguardando resolução manual');
    await _db.updateSyncQueueStatus(item.id, 'CONFLICT');
  }

  /// EXECUTAR OPERAÇÃO NO SERVIDOR
  Future<RemoteOperationResult> _executeRemoteOperation(
    SyncQueueData item,
  ) async {
    final payload = _parseJsonPayload(item.payload);
    final endpoint = _getEndpointForOperation(item.entityType, item.operation);

    try {
      Response response;

      switch (item.operation) {
        case 'CREATE':
          response = await _dio.post(
            endpoint,
            data: payload,
            options: Options(receiveTimeout: const Duration(seconds: 10)),
          );
          if (response.statusCode == 201) {
            final responseData = response.data as Map<String, dynamic>;
            return RemoteOperationResult(
              success: true,
              remoteId: responseData['id'] as int?,
            );
          }
          break;

        case 'UPDATE':
          final remoteId = item.entityIdRemote;
          response = await _dio.put(
            '$endpoint/$remoteId',
            data: payload,
            options: Options(receiveTimeout: const Duration(seconds: 10)),
          );
          if (response.statusCode == 200) {
            return RemoteOperationResult(success: true);
          }
          break;

        case 'DELETE':
          final remoteId = item.entityIdRemote;
          response = await _dio.delete(
            '$endpoint/$remoteId',
            options: Options(receiveTimeout: const Duration(seconds: 10)),
          );
          if (response.statusCode == 204) {
            return RemoteOperationResult(success: true);
          }
          break;
      }

      return RemoteOperationResult(
        success: false,
        statusCode: response.statusCode,
        errorMessage: 'Erro ${response.statusCode}',
      );
    } on DioException catch (e) {
      return RemoteOperationResult(
        success: false,
        statusCode: e.response?.statusCode,
        errorMessage: e.message,
        isNetworkError: e.type == DioExceptionType.connectionTimeout,
      );
    } catch (e) {
      return RemoteOperationResult(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// V8: TRATAMENTO DE ERROS HTTP
  Future<void> _handleRemoteOperationError(
    SyncQueueData item,
    RemoteOperationResult result,
  ) async {
    final statusCode = result.statusCode;

    switch (statusCode) {
      case 401:
        _logger.w('❌ [V8] 401 Unauthorized - Token expirado');
        // TODO: Tentar refresh de token e retentar
        break;

      case 404:
        _logger.i('✅ [V8] 404 Not Found - Recurso deletado no servidor');
        await _db.updateSyncQueueStatus(item.id, 'SUCCESS');
        break;

      case 409:
        _logger.w('❌ [V8] 409 Conflict - Conflito detectado');
        await _db.updateSyncQueueStatus(item.id, 'CONFLICT');
        break;

      case 422:
        _logger.e('❌ [V8] 422 Unprocessable - Dados inválidos');
        await _db.updateSyncQueueStatus(
          item.id,
          'ERROR',
          errorMessage: 'Dados inválidos',
        );
        break;

      case null:
      case 500:
      case 502:
      case 503:
        _logger.w('❌ [V8] Erro de servidor ${statusCode ?? "N/A"} - Agendando retry');
        await _scheduleRetry(item);
        break;

      default:
        if (result.isNetworkError) {
          _logger.w('❌ [V8] Erro de rede - Agendando retry');
          await _scheduleRetry(item);
        } else {
          _logger.e('❌ [V8] Erro desconhecido: ${result.errorMessage}');
        }
    }
  }

  /// AGENDAR RETRY COM BACKOFF EXPONENCIAL
  Future<void> _scheduleRetry(SyncQueueData item) async {
    if (item.retryCount < item.maxRetries) {
      final backoffIndex = item.retryCount.clamp(0, _retryBackoff.length - 1);
      final backoffDuration = _retryBackoff[backoffIndex];
      
      _logger.i(
        '⏱️ Agendando retry ${item.retryCount + 1}/${item.maxRetries} '
        'em ${backoffDuration.inSeconds}s',
      );

      // TODO: Usar flutter_workmanager para agendar retry em background
      await Future.delayed(backoffDuration);
      await _db.incrementRetryCount(item.id);
    } else {
      _logger.e('❌ Máximo de retries atingido para item ${item.localId}');
      await _db.updateSyncQueueStatus(
        item.id,
        'ERROR',
        errorMessage: 'Máximo de retries atingido',
      );
    }
  }

  /// PULL REMOTO: BUSCAR DADOS ATUALIZADOS DO SERVIDOR
  Future<void> _performPullSync() async {
    try {
      final lastSyncTime = await _db.getLastSyncTimestamp();

      final response = await _dio.get(
        '$_baseUrl/api/sync/pull',
        queryParameters: {'since': lastSyncTime.toIso8601String()},
        options: Options(receiveTimeout: const Duration(seconds: 15)),
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final serverTimestamp = data['serverTimestamp'] as String?;

        // TODO: Processar items do pull e atualizar cache local

        if (serverTimestamp != null) {
          await _db.setLastSyncTimestamp(DateTime.parse(serverTimestamp));
        }

        _logger.i('✅ Pull remoto concluído');
      }
    } catch (e) {
      _logger.w('⚠️ Erro ao fazer pull remoto: $e');
      // Não falha a sincronização por erro no pull
    }
  }

  /// ATUALIZAR MAPPING DE ID LOCAL → REMOTO
  Future<void> _updateIdMapping(
    String localId,
    int remoteId,
    String entityType,
  ) async {
    await into(_db.idMapping).insert(
      IdMappingCompanion(
        localUuid: Value(localId),
        remoteId: Value(remoteId),
        entityType: Value(entityType),
        syncedAt: Value(DateTime.now().toUtc().toIso8601String()),
      ),
    );
    _logger.i('📍 Mapeamento criado: $localId → $remoteId');
  }

  /// FINALIZAR LOG DE SINCRONIZAÇÃO
  Future<void> _finalizeSyncLog(
    int syncLogId,
    String status, [
    int total = 0,
    int success = 0,
    int conflicts = 0,
    int errors = 0,
  ]) async {
    await (update(_db.syncLog)..where((tbl) => tbl.id.equals(syncLogId))).write(
      SyncLogCompanion(
        finishedAt: Value(DateTime.now().toUtc().toIso8601String()),
        status: Value(status),
        totalItems: Value(total),
        success: Value(success),
        conflicts: Value(conflicts),
        errors: Value(errors),
      ),
    );
  }

  /// Utilitários
  Map<String, dynamic> _parseJsonPayload(String payload) {
    try {
      return jsonDecode(payload) as Map<String, dynamic>;
    } catch (e) {
      return {};
    }
  }

  String _getEndpointForOperation(String entityType, String operation) {
    // TODO: Implementar mapeamento correto de endpoints
    return '$_baseUrl/api/$entityType';
  }

  Future<void> _updateItemChecksum(int itemId) {
    // TODO: Implementar atualização de checksum
    return Future.value();
  }

  void _emitState(SyncEngineState state) {
    _stateController.add(state);
  }

  void _emitProgress({
    required int current,
    required int total,
    required String currentItemId,
  }) {
    _progressController.add(
      SyncProgress(
        current: current,
        total: total,
        currentItemId: currentItemId,
      ),
    );
  }

  Future<void> dispose() async {
    await _stateController.close();
    await _progressController.close();
  }
}

// ============================================================================
// MODELOS AUXILIARES
// ============================================================================

enum SyncEngineState {
  idle,
  offline,
  syncing,
  unstableConnection,
  partial,
  conflict,
  error,
  done,
}

class SyncProgress {
  final int current;
  final int total;
  final String currentItemId;

  SyncProgress({
    required this.current,
    required this.total,
    required this.currentItemId,
  });

  double get percentage => (current / total) * 100;
}

class RemoteOperationResult {
  final bool success;
  final int? statusCode;
  final int? remoteId;
  final String? errorMessage;
  final bool isNetworkError;

  RemoteOperationResult({
    required this.success,
    this.statusCode,
    this.remoteId,
    this.errorMessage,
    this.isNetworkError = false,
  });
}
