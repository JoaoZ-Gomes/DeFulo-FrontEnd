import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import '../engine/sync_engine.dart';

/// Estados possíveis do sync na UI
enum SyncState {
  idle,           // Nenhuma operação pendente
  offline,        // Sem conectividade
  pending,        // Há itens na fila, aguardando conexão
  syncing,        // Sincronização em progresso
  partial,        // Sincronizou com erros em alguns itens
  conflict,       // Conflito detectado aguardando resolução
  error,          // Falha crítica
  done,           // Último sync concluído com sucesso
}

/// Dados sobre o estado de sincronização
class SyncUIState {
  final SyncState state;
  final int pendingItemsCount;
  final DateTime? lastSyncTime;
  final String? lastSyncMessage;
  final double syncProgress;
  final String? currentSyncingItem;
  final List<String> errorMessages;

  SyncUIState({
    this.state = SyncState.idle,
    this.pendingItemsCount = 0,
    this.lastSyncTime,
    this.lastSyncMessage,
    this.syncProgress = 0.0,
    this.currentSyncingItem,
    this.errorMessages = const [],
  });

  /// Criar novo state com alterações
  SyncUIState copyWith({
    SyncState? state,
    int? pendingItemsCount,
    DateTime? lastSyncTime,
    String? lastSyncMessage,
    double? syncProgress,
    String? currentSyncingItem,
    List<String>? errorMessages,
  }) {
    return SyncUIState(
      state: state ?? this.state,
      pendingItemsCount: pendingItemsCount ?? this.pendingItemsCount,
      lastSyncTime: lastSyncTime ?? this.lastSyncTime,
      lastSyncMessage: lastSyncMessage ?? this.lastSyncMessage,
      syncProgress: syncProgress ?? this.syncProgress,
      currentSyncingItem: currentSyncingItem ?? this.currentSyncingItem,
      errorMessages: errorMessages ?? this.errorMessages,
    );
  }

  /// Descrição legível do estado
  String get stateDescription {
    return switch (state) {
      SyncState.idle => '✅ Tudo sincronizado',
      SyncState.offline => '🔴 Sem conexão',
      SyncState.pending => '⏳ $pendingItemsCount alterações aguardando sincronização',
      SyncState.syncing => '🔄 Sincronizando... ${(syncProgress * 100).toStringAsFixed(0)}%',
      SyncState.partial => '⚠️ Sincronização parcial (${errorMessages.length} erros)',
      SyncState.conflict => '⚠️ Conflito detectado',
      SyncState.error => '❌ Erro na sincronização',
      SyncState.done => '✅ Sincronizado com sucesso',
    };
  }

  /// Ícone para a AppBar
  String get stateIcon {
    return switch (state) {
      SyncState.idle => '✓',
      SyncState.offline => '✗',
      SyncState.pending => '⏳',
      SyncState.syncing => '🔄',
      SyncState.partial => '⚠',
      SyncState.conflict => '⚔',
      SyncState.error => '❌',
      SyncState.done => '✓',
    };
  }

  /// Cor para indicador visual
  String get stateColor {
    return switch (state) {
      SyncState.idle => '#4CAF50',    // Verde
      SyncState.offline => '#F44336',  // Vermelho
      SyncState.pending => '#FFC107',  // Âmbar
      SyncState.syncing => '#2196F3',  // Azul
      SyncState.partial => '#FF9800',  // Laranja
      SyncState.conflict => '#FF5722', // Vermelho profundo
      SyncState.error => '#F44336',    // Vermelho
      SyncState.done => '#4CAF50',     // Verde
    };
  }
}

/// Provider para gerenciar o estado de sincronização (Riverpod)
final syncStateProvider =
    StateNotifierProvider<SyncStateNotifier, SyncUIState>((ref) {
  // TODO: Inicializar com dependências do backend
  throw UnimplementedError('SyncStateNotifier precisa ser inicializado');
});

/// Notificador de estado de sincronização
class SyncStateNotifier extends StateNotifier<SyncUIState> {
  final SyncEngine _syncEngine;
  final Logger _logger = Logger();

  SyncStateNotifier({
    required SyncEngine syncEngine,
  })  : _syncEngine = syncEngine,
        super(const SyncUIState()) {
    _initializeListeners();
  }

  /// Inicializar listeners do SyncEngine
  void _initializeListeners() {
    // Escutar mudanças de estado do engine
    _syncEngine.stateStream.listen((engineState) {
      final newState = _mapEngineStateToUIState(engineState);
      state = state.copyWith(state: newState);
    });

    // Escutar progresso
    _syncEngine.progressStream.listen((progress) {
      state = state.copyWith(
        syncProgress: progress.percentage / 100.0,
        currentSyncingItem: progress.currentItemId,
      );
    });
  }

  /// Mapear estado do engine para UI
  SyncState _mapEngineStateToUIState(SyncEngineState engineState) {
    return switch (engineState) {
      SyncEngineState.idle => SyncState.idle,
      SyncEngineState.offline => SyncState.offline,
      SyncEngineState.syncing => SyncState.syncing,
      SyncEngineState.unstableConnection => SyncState.syncing,
      SyncEngineState.partial => SyncState.partial,
      SyncEngineState.conflict => SyncState.conflict,
      SyncEngineState.error => SyncState.error,
      SyncEngineState.done => SyncState.done,
    };
  }

  /// Iniciar sincronização manual
  Future<void> startSync() async {
    _logger.i('🔄 Iniciando sincronização manual');
    state = state.copyWith(
      state: SyncState.syncing,
      syncProgress: 0.0,
      errorMessages: [],
    );
    
    await _syncEngine.startSync();
    
    // Atualizar último tempo de sync
    state = state.copyWith(
      lastSyncTime: DateTime.now(),
      lastSyncMessage: state.stateDescription,
    );
  }

  /// Atualizar contagem de itens pendentes
  Future<void> updatePendingCount(int count) async {
    if (count > 0) {
      state = state.copyWith(
        pendingItemsCount: count,
        state: SyncState.pending,
      );
    } else {
      state = state.copyWith(
        pendingItemsCount: 0,
        state: SyncState.idle,
      );
    }
  }

  /// Adicionar mensagem de erro
  void addError(String message) {
    state = state.copyWith(
      errorMessages: [...state.errorMessages, message],
    );
  }

  /// Limpar erros
  void clearErrors() {
    state = state.copyWith(errorMessages: []);
  }

  /// Resetar estado
  void reset() {
    state = const SyncUIState();
  }
}

/// Providers auxiliares derivados

/// Provider com contagem de itens pendentes
final pendingItemsCountProvider = FutureProvider<int>((ref) async {
  // TODO: Obter do banco de dados
  return 0;
});

/// Provider com timestamp do último sync
final lastSyncTimeProvider = FutureProvider<DateTime?>((ref) async {
  // TODO: Obter do banco de dados
  return null;
});

/// Provider com indicador se está online
final isOnlineProvider = StreamProvider<bool>((ref) {
  // TODO: Obter do ConnectivityService
  throw UnimplementedError('ConnectivityService não disponível');
});

/// Provider com latência atual
final latencyProvider = StreamProvider<int>((ref) {
  // TODO: Obter do ConnectivityService
  throw UnimplementedError('ConnectivityService não disponível');
});

/// Provider para disparar sync automático periodicamente
final autoSyncProvider = FutureProvider<void>((ref) async {
  // TODO: Implementar sync automático a cada 5 minutos
});
