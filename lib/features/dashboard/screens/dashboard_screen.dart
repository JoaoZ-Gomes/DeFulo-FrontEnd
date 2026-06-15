import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:defulo/core/theme/app_theme.dart';

/// Dashboard principal
class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeFulo'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Navegar para notificações
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_outlined),
            onPressed: () {
              // TODO: Navegar para perfil
            },
          ),
        ],
      ),
      body: _buildHomeTab(),
    );
  }

  Widget _buildHomeTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting
            const Text(
              'Olá, Produtor!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Hoje é ${DateTime.now().day} de ${_getMonthName(DateTime.now().month)}',
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.textLight,
              ),
            ),
            const SizedBox(height: 24),

            // Status de Sincronização
            _buildSyncStatusCard(),
            const SizedBox(height: 16),

            // Quick Stats
            _buildQuickStats(),
            const SizedBox(height: 24),

            // Fazendas Recentes
            const Text(
              'Suas Fazendas',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 12),
            _buildFazendasList(),
            const SizedBox(height: 24),

            // Eventos Recentes
            const Text(
              'Eventos Recentes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 12),
            _buildEventosList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSyncStatusCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.successGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.cloud_done,
                color: AppTheme.successGreen,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sincronização',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Última sincronização há 2 minutos',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.textLight,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.check_circle,
              color: AppTheme.successGreen,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickStats() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            title: 'Fazendas',
            value: '3',
            icon: Icons.location_city,
            color: AppTheme.primaryGreen,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            title: 'Talhões',
            value: '12',
            icon: Icons.agriculture,
            color: AppTheme.accentAmber,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            title: 'Eventos',
            value: '45',
            icon: Icons.event,
            color: AppTheme.successGreen,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: AppTheme.textLight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFazendasList() {
    return Column(
      children: [
        _buildFazendasListItem(
          nome: 'Fazenda São Paulo',
          local: 'Ribeirão Preto, SP',
          area: '150 ha',
          talhoes: 8,
        ),
        const SizedBox(height: 8),
        _buildFazendasListItem(
          nome: 'Fazenda do Vale',
          local: 'Araraquara, SP',
          area: '200 ha',
          talhoes: 12,
        ),
        const SizedBox(height: 8),
        _buildFazendasListItem(
          nome: 'Hacienda Nueva',
          local: 'Barretos, SP',
          area: '120 ha',
          talhoes: 6,
        ),
      ],
    );
  }

  Widget _buildFazendasListItem({
    required String nome,
    required String local,
    required String area,
    required int talhoes,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.primaryGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.location_city,
                color: AppTheme.primaryGreen,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 12,
                        color: AppTheme.textLight,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        local,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textLight,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        area,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textDark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '$talhoes talhões',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }

  Widget _buildEventosList() {
    return Column(
      children: [
        _buildEventosListItem(
          tipo: 'Pulverização',
          talhao: 'Talhão A',
          data: '29/05/2026',
          status: 'Sincronizado',
        ),
        const SizedBox(height: 8),
        _buildEventosListItem(
          tipo: 'Adubação',
          talhao: 'Talhão C',
          data: '28/05/2026',
          status: 'Pendente',
        ),
      ],
    );
  }

  Widget _buildEventosListItem({
    required String tipo,
    required String talhao,
    required String data,
    required String status,
  }) {
    final isSync = status == 'Sincronizado';
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.accentAmber.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.event,
                color: AppTheme.accentAmber,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tipo,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        talhao,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textLight,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        data,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isSync
                  ? AppTheme.successGreen.withOpacity(0.1)
                  : AppTheme.accentAmber.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: isSync
                    ? AppTheme.successGreen
                    : AppTheme.accentAmber,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho',
      'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro'
    ];
    return months[month - 1];
  }
}
