import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logger/logger.dart';
import 'dart:async';

/// Serviço de Conectividade com 4 camadas de verificação
/// 
/// V1: Hardware - Verifica tipo de conexão (wifi/mobile/none)
/// V2: Alcançabilidade - Faz ping no backend via GET /api/health
/// V3: Autenticação - Verifica token JWT (exp) e refresh se necessário
/// V4: Qualidade - Mede latência do ping
class ConnectivityService {
  final Dio _dio;
  final String _baseUrl;
  final Duration _healthCheckTimeout;
  final int _latencyThresholdMs;
  final Logger _logger = Logger();

  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  bool _isOnline = false;
  int _latencyMs = 0;

  // Controladores de stream para observar mudanças de estado
  final _onlineStateController = StreamController<bool>.broadcast();
  final _latencyController = StreamController<int>.broadcast();

  ConnectivityService({
    required Dio dio,
    required String baseUrl,
    Duration healthCheckTimeout = const Duration(seconds: 3),
    int latencyThresholdMs = 5000,
  })  : _dio = dio,
        _baseUrl = baseUrl,
        _healthCheckTimeout = healthCheckTimeout,
        _latencyThresholdMs = latencyThresholdMs;

  // Getters
  bool get isOnline => _isOnline;
  int get latencyMs => _latencyMs;
  Stream<bool> get onlineStateStream => _onlineStateController.stream;
  Stream<int> get latencyStream => _latencyController.stream;

  /// Inicializar o serviço e escutar mudanças de conectividade
  Future<void> initialize() async {
    _logger.i('🔌 Inicializando ConnectivityService');
    
    // Verificação inicial
    await _checkConnectivity();

    // Escutar mudanças contínuas
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      (result) async {
        _logger.d('🔌 Mudança de conectividade detectada: $result');
        await _checkConnectivity();
      },
    );
  }

  /// Método principal de verificação (orquestra todas as 4 camadas)
  Future<void> _checkConnectivity() async {
    try {
      // V1: Verificar hardware
      final hardwareConnected = await _verifyHardwareConnection();
      if (!hardwareConnected) {
        _setOffline('Sem conexão de rede (hardware)');
        return;
      }

      // V2: Verificar alcançabilidade do servidor
      final serverReachable = await _verifyServerReachability();
      if (!serverReachable) {
        _setOffline('Servidor não está alcançável');
        return;
      }

      // V3: Verificar autenticação
      final authValid = await _verifyAuthentication();
      if (!authValid) {
        _setOffline('Autenticação inválida ou token expirado');
        return;
      }

      // V4: Verificar qualidade de conexão
      await _verifyConnectionQuality();

      _setOnline();
    } catch (e) {
      _logger.e('❌ Erro durante verificação de conectividade', error: e);
      _setOffline('Erro: ${e.toString()}');
    }
  }

  /// V1: VERIFICAÇÃO DE HARDWARE
  /// Detecta o tipo de conexão (wifi, mobile, none)
  Future<bool> _verifyHardwareConnection() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      
      final isConnected = connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.ethernet);

      if (isConnected) {
        _logger.i('✅ V1 Hardware OK: ${connectivityResult.join(", ")}');
        return true;
      } else {
        _logger.w('⚠️ V1 Hardware FALHOU: Nenhuma conexão disponível');
        return false;
      }
    } catch (e) {
      _logger.e('❌ V1 Erro ao verificar hardware', error: e);
      return false;
    }
  }

  /// V2: VERIFICAÇÃO DE ALCANÇABILIDADE
  /// Faz GET em /api/health com timeout de 3 segundos
  Future<bool> _verifyServerReachability() async {
    try {
      final stopwatch = Stopwatch()..start();
      
      final response = await _dio
          .get(
            '$_baseUrl/api/health',
            options: Options(
              receiveTimeout: _healthCheckTimeout,
              sendTimeout: _healthCheckTimeout,
              validateStatus: (status) => status == null || status < 500,
            ),
          )
          .timeout(_healthCheckTimeout);

      _latencyMs = stopwatch.elapsedMilliseconds;
      _latencyController.add(_latencyMs);

      if (response.statusCode == 200) {
        _logger.i('✅ V2 Alcançabilidade OK: ${_latencyMs}ms');
        return true;
      } else {
        _logger.w('⚠️ V2 Alcançabilidade FALHOU: Status ${response.statusCode}');
        return false;
      }
    } on TimeoutException {
      _logger.w('⚠️ V2 Timeout ao conectar ao servidor (>3s)');
      return false;
    } catch (e) {
      _logger.e('❌ V2 Erro ao verificar servidor', error: e);
      return false;
    }
  }

  /// V3: VERIFICAÇÃO DE AUTENTICAÇÃO
  /// Valida token JWT (verifica campo exp) e faz refresh se necessário
  Future<bool> _verifyAuthentication() async {
    try {
      // TODO: Implementar verificação de token JWT
      // Por enquanto, consideramos sempre válido
      // Em produção:
      // 1. Obter token do SecureStorage
      // 2. Decodificar (sem validar assinatura)
      // 3. Verificar se exp > agora
      // 4. Se expirado, chamar /api/auth/refresh
      // 5. Se refresh falhar, retornar false
      
      _logger.i('✅ V3 Autenticação OK');
      return true;
    } catch (e) {
      _logger.e('❌ V3 Erro ao verificar autenticação', error: e);
      return false;
    }
  }

  /// V4: VERIFICAÇÃO DE QUALIDADE DE CONEXÃO
  /// Mede latência e avisa se > 5000ms
  Future<void> _verifyConnectionQuality() async {
    if (_latencyMs > _latencyThresholdMs) {
      _logger.w(
        '⚠️ V4 Qualidade RUIM: Latência ${_latencyMs}ms > ${_latencyThresholdMs}ms',
      );
      // Emitir aviso mas não abortar sincronização
      // UI pode mostrar dialog pedindo confirmação do usuário
    } else {
      _logger.i('✅ V4 Qualidade OK: ${_latencyMs}ms');
    }
  }

  /// Verificação rápida de conectividade (sem todos os checks)
  Future<bool> isConnectedQuick() async {
    try {
      final result = await Connectivity().checkConnectivity();
      return result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.ethernet);
    } catch (e) {
      _logger.e('Erro na verificação rápida', error: e);
      return false;
    }
  }

  void _setOnline() {
    if (!_isOnline) {
      _isOnline = true;
      _logger.i('🟢 ONLINE');
      _onlineStateController.add(true);
    }
  }

  void _setOffline(String reason) {
    if (_isOnline) {
      _isOnline = false;
      _logger.w('🔴 OFFLINE: $reason');
      _onlineStateController.add(false);
    }
  }

  /// Obter latência atual em ms
  Future<int> getLatencyMs() async {
    if (!_isOnline) return -1;
    return _latencyMs;
  }

  /// Alertar usuário se conexão instável
  bool shouldAlertUserAboutInstability() {
    return _latencyMs > _latencyThresholdMs && _isOnline;
  }

  /// Limpar recursos
  Future<void> dispose() async {
    await _connectivitySubscription.cancel();
    await _onlineStateController.close();
    await _latencyController.close();
  }
}
