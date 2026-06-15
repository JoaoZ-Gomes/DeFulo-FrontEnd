import 'package:logger/logger.dart';

/// Enumeração das estratégias de resolução de conflito
enum ConflictResolutionStrategy {
  lastWriteWins,   // Mais recente (local vs remoto) vence
  serverWins,      // Servidor sempre prevalece
  clientWins,      // Cliente sempre prevalece
  manualMerge,     // Apresentar ao usuário para decisão
}

/// Classe abstrata para estratégias de resolução
abstract class IConflictResolver {
  /// Resolver um conflito e retornar o dado final
  /// 
  /// [localData] - Dados locais
  /// [remoteData] - Dados remotos
  /// [localVersion] - Versão local
  /// [remoteVersion] - Versão remota
  /// [localUpdatedAt] - Timestamp de atualização local
  /// [remoteUpdatedAt] - Timestamp de atualização remoto
  /// 
  /// Retorna: Map com dado resolvido e metadados da decisão
  Future<ConflictResolutionResult> resolve({
    required Map<String, dynamic> localData,
    required Map<String, dynamic> remoteData,
    required int localVersion,
    required int remoteVersion,
    required String localUpdatedAt,
    required String remoteUpdatedAt,
    required String entityType,
  });

  /// Descrição legível da estratégia
  String get strategyName;
}

/// Resultado da resolução de conflito
class ConflictResolutionResult {
  /// Dado resolvido (qual versão venceu)
  final Map<String, dynamic> resolvedData;
  
  /// ID da versão vencedora ('local' ou 'remote')
  final String winner;
  
  /// Versão final após resolução
  final int finalVersion;
  
  /// Descrição da decisão (para audit log)
  final String reason;
  
  /// Dados descartados (para possível undo)
  final Map<String, dynamic> discardedData;

  ConflictResolutionResult({
    required this.resolvedData,
    required this.winner,
    required this.finalVersion,
    required this.reason,
    required this.discardedData,
  });
}

// ============================================================================
// ESTRATÉGIA A: LAST WRITE WINS (Padrão)
// ============================================================================

class LastWriteWinsResolver implements IConflictResolver {
  final Logger _logger = Logger();

  @override
  String get strategyName => 'Last Write Wins';

  @override
  Future<ConflictResolutionResult> resolve({
    required Map<String, dynamic> localData,
    required Map<String, dynamic> remoteData,
    required int localVersion,
    required int remoteVersion,
    required String localUpdatedAt,
    required String remoteUpdatedAt,
    required String entityType,
  }) async {
    final localTime = DateTime.parse(localUpdatedAt);
    final remoteTime = DateTime.parse(remoteUpdatedAt);

    final isLocalNewer = localTime.isAfter(remoteTime);
    
    if (isLocalNewer) {
      _logger.i(
        '🔄 Conflito resolvido (Last Write Wins): LOCAL vence '
        '($localUpdatedAt > $remoteUpdatedAt)',
      );
      return ConflictResolutionResult(
        resolvedData: localData,
        winner: 'local',
        finalVersion: localVersion + 1,
        reason: 'Local data is newer ($localUpdatedAt > $remoteUpdatedAt)',
        discardedData: remoteData,
      );
    } else {
      _logger.i(
        '🔄 Conflito resolvido (Last Write Wins): REMOTO vence '
        '($remoteUpdatedAt >= $localUpdatedAt)',
      );
      return ConflictResolutionResult(
        resolvedData: remoteData,
        winner: 'remote',
        finalVersion: remoteVersion + 1,
        reason: 'Remote data is newer ($remoteUpdatedAt > $localUpdatedAt)',
        discardedData: localData,
      );
    }
  }
}

// ============================================================================
// ESTRATÉGIA B: SERVER WINS
// ============================================================================

class ServerWinsResolver implements IConflictResolver {
  final Logger _logger = Logger();

  @override
  String get strategyName => 'Server Wins';

  @override
  Future<ConflictResolutionResult> resolve({
    required Map<String, dynamic> localData,
    required Map<String, dynamic> remoteData,
    required int localVersion,
    required int remoteVersion,
    required String localUpdatedAt,
    required String remoteUpdatedAt,
    required String entityType,
  }) async {
    _logger.i('🔄 Conflito resolvido (Server Wins): REMOTO sempre vence');
    
    return ConflictResolutionResult(
      resolvedData: remoteData,
      winner: 'remote',
      finalVersion: remoteVersion + 1,
      reason: 'Server wins strategy applied',
      discardedData: localData,
    );
  }
}

// ============================================================================
// ESTRATÉGIA C: CLIENT WINS
// ============================================================================

class ClientWinsResolver implements IConflictResolver {
  final Logger _logger = Logger();

  @override
  String get strategyName => 'Client Wins';

  @override
  Future<ConflictResolutionResult> resolve({
    required Map<String, dynamic> localData,
    required Map<String, dynamic> remoteData,
    required int localVersion,
    required int remoteVersion,
    required String localUpdatedAt,
    required String remoteUpdatedAt,
    required String entityType,
  }) async {
    _logger.w(
      '⚠️ Conflito resolvido (Client Wins): LOCAL sempre vence '
      '(usar com cautela!)',
    );
    
    return ConflictResolutionResult(
      resolvedData: localData,
      winner: 'local',
      finalVersion: localVersion + 1,
      reason: 'Client wins strategy applied (use with caution)',
      discardedData: remoteData,
    );
  }
}

// ============================================================================
// ESTRATÉGIA D: MANUAL MERGE
// ============================================================================

class ManualMergeResolver implements IConflictResolver {
  final Logger _logger = Logger();

  @override
  String get strategyName => 'Manual Merge';

  @override
  Future<ConflictResolutionResult> resolve({
    required Map<String, dynamic> localData,
    required Map<String, dynamic> remoteData,
    required int localVersion,
    required int remoteVersion,
    required String localUpdatedAt,
    required String remoteUpdatedAt,
    required String entityType,
  }) async {
    _logger.i('⏳ Conflito detectado - Aguardando decisão manual do usuário');
    
    // Em produção, isso seria apresentado na UI
    // Por enquanto, usar Last Write Wins como fallback
    final resolver = LastWriteWinsResolver();
    return resolver.resolve(
      localData: localData,
      remoteData: remoteData,
      localVersion: localVersion,
      remoteVersion: remoteVersion,
      localUpdatedAt: localUpdatedAt,
      remoteUpdatedAt: remoteUpdatedAt,
      entityType: entityType,
    );
  }

  /// Comparar dois mapas e retornar campos que diferem
  Map<String, ConflictingField> findConflictingFields(
    Map<String, dynamic> localData,
    Map<String, dynamic> remoteData,
  ) {
    final conflicts = <String, ConflictingField>{};

    final allKeys = {...localData.keys, ...remoteData.keys};
    
    for (final key in allKeys) {
      final localValue = localData[key];
      final remoteValue = remoteData[key];

      if (localValue != remoteValue) {
        conflicts[key] = ConflictingField(
          fieldName: key,
          localValue: localValue,
          remoteValue: remoteValue,
        );
      }
    }

    return conflicts;
  }
}

/// Representa um campo com conflito
class ConflictingField {
  final String fieldName;
  final dynamic localValue;
  final dynamic remoteValue;

  ConflictingField({
    required this.fieldName,
    required this.localValue,
    required this.remoteValue,
  });
}

// ============================================================================
// GERENCIADOR DE ESTRATÉGIAS
// ============================================================================

class ConflictResolverFactory {
  static const Map<String, ConflictResolutionStrategy> _defaultStrategies = {
    'usuario': ConflictResolutionStrategy.serverWins,
    'fazenda': ConflictResolutionStrategy.serverWins,
    'talhao': ConflictResolutionStrategy.lastWriteWins,
    'evento': ConflictResolutionStrategy.lastWriteWins,
  };

  /// Obter resolver padrão para tipo de entidade
  static IConflictResolver getDefaultResolver(String entityType) {
    final strategy = _defaultStrategies[entityType] ??
        ConflictResolutionStrategy.lastWriteWins;
    return _createResolver(strategy);
  }

  /// Criar resolver baseado na estratégia
  static IConflictResolver _createResolver(ConflictResolutionStrategy strategy) {
    return switch (strategy) {
      ConflictResolutionStrategy.lastWriteWins => LastWriteWinsResolver(),
      ConflictResolutionStrategy.serverWins => ServerWinsResolver(),
      ConflictResolutionStrategy.clientWins => ClientWinsResolver(),
      ConflictResolutionStrategy.manualMerge => ManualMergeResolver(),
    };
  }

  /// Obter resolver customizado
  static IConflictResolver getResolver(ConflictResolutionStrategy strategy) {
    return _createResolver(strategy);
  }
}
