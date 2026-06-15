import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/common_widgets.dart';
import '../model/talhao_repository.dart';

/// Tela de Talhões
class TalhoesScreen extends ConsumerStatefulWidget {
  final String? fazendaId;

  const TalhoesScreen({Key? key, this.fazendaId}) : super(key: key);

  @override
  ConsumerState<TalhoesScreen> createState() => _TalhoesScreenState();
}

class _TalhoesScreenState extends ConsumerState<TalhoesScreen> {
  final List<TalhaoLocal> _mockTalhoes = [
    TalhaoLocal(
      id: '1',
      fazendaId: '1',
      nome: 'Talhão A',
      area: 50.0,
      culturaAtual: 'Milho',
      status: 'ATIVO',
      umidadeSolo: 35.0,
      temperatura: 28.5,
      dataUltimoEvento: DateTime.now().subtract(const Duration(days: 2)),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    TalhaoLocal(
      id: '2',
      fazendaId: '1',
      nome: 'Talhão B',
      area: 45.0,
      culturaAtual: 'Soja',
      status: 'ATIVO',
      umidadeSolo: 18.0,
      temperatura: 27.2,
      dataUltimoEvento: DateTime.now().subtract(const Duration(days: 5)),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    TalhaoLocal(
      id: '3',
      fazendaId: '1',
      nome: 'Talhão C',
      area: 55.0,
      culturaAtual: 'Cana',
      status: 'PREPARACAO',
      umidadeSolo: 42.0,
      temperatura: 29.1,
      dataUltimoEvento: null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Talhões'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implementar busca
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _mockTalhoes.length,
        itemBuilder: (context, index) {
          final talhao = _mockTalhoes[index];
          return _buildTalhaoCard(talhao);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Abrir dialog para criar talhão
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTalhaoCard(TalhaoLocal talhao) {
    final umidadeCritica = talhao.umidadeSolo != null && talhao.umidadeSolo! < 25;
    
    return GestureDetector(
      onTap: () {
        // TODO: Navegar para detalhes do talhão
      },
      child: DeFuloCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho com status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  talhao.nome,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
                StatusBadge(
                  label: _getStatusLabel(talhao.status),
                  backgroundColor: _getStatusColor(talhao.status).withOpacity(0.1),
                  textColor: _getStatusColor(talhao.status),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Dados principais
            Row(
              children: [
                Expanded(
                  child: InfoTile(
                    label: 'Área',
                    value: '${talhao.area?.toStringAsFixed(1) ?? '0'} ha',
                    icon: Icons.square_foot,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InfoTile(
                    label: 'Cultura',
                    value: talhao.culturaAtual ?? '-',
                    icon: Icons.agriculture,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Dados de sensor (com alerta se necessário)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: umidadeCritica
                  ? AppTheme.alertRed.withOpacity(0.05)
                  : AppTheme.backgroundWhite,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: umidadeCritica
                    ? AppTheme.alertRed.withOpacity(0.2)
                    : AppTheme.dividerGrey,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Umidade do Solo',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppTheme.textLight,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              umidadeCritica
                                ? Icons.warning_outlined
                                : Icons.water_drop_outlined,
                              color: umidadeCritica
                                ? AppTheme.alertRed
                                : AppTheme.successGreen,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${talhao.umidadeSolo?.toStringAsFixed(1) ?? '-'}%',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: umidadeCritica
                                  ? AppTheme.alertRed
                                  : AppTheme.textDark,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Temperatura',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppTheme.textLight,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.thermostat_outlined,
                              color: AppTheme.primaryGreen,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${talhao.temperatura?.toStringAsFixed(1) ?? '-'}°C',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textDark,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Ações
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Registrar evento para este talhão
                },
                child: const Text('Registrar Evento'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getStatusLabel(String? status) {
    return switch (status) {
      'ATIVO' => 'Ativo',
      'INATIVO' => 'Inativo',
      'PREPARACAO' => 'Em Preparação',
      _ => 'Desconhecido',
    };
  }

  Color _getStatusColor(String? status) {
    return switch (status) {
      'ATIVO' => AppTheme.successGreen,
      'INATIVO' => AppTheme.textLight,
      'PREPARACAO' => AppTheme.accentAmber,
      _ => AppTheme.textLight,
    };
  }
}
