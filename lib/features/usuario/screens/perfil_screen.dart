import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/common_widgets.dart';

/// Tela de Perfil do Usuário
class PerfilScreen extends StatelessWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {
              // TODO: Abrir tela de editar perfil
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header com informações do usuário
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.primaryGreen,
                    AppTheme.primaryGreen.withOpacity(0.8),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 60,
                        color: AppTheme.primaryGreen,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'João Silva Santos',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Produtor Rural',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Informações pessoais
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informações Pessoais',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 12),
                  DeFuloCard(
                    child: Column(
                      children: [
                        InfoTile(
                          label: 'Email',
                          value: 'joao.silva@email.com',
                          icon: Icons.email_outlined,
                          iconColor: AppTheme.primaryGreen,
                        ),
                        const SizedBox(height: 16),
                        InfoTile(
                          label: 'CPF',
                          value: '123.456.789-10',
                          icon: Icons.badge_outlined,
                          iconColor: AppTheme.primaryGreen,
                        ),
                        const SizedBox(height: 16),
                        InfoTile(
                          label: 'Telefone',
                          value: '(16) 98765-4321',
                          icon: Icons.phone_outlined,
                          iconColor: AppTheme.primaryGreen,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Estatísticas
                  const Text(
                    'Estatísticas',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: DeFuloCard(
                          child: Column(
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
                              const SizedBox(height: 12),
                              const Text(
                                '3',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Fazendas',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.textLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DeFuloCard(
                          child: Column(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: AppTheme.accentAmber.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.agriculture,
                                  color: AppTheme.accentAmber,
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                '12',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Talhões',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.textLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Configurações
                  const Text(
                    'Configurações',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildMenuOption(
                    icon: Icons.language,
                    title: 'Idioma',
                    subtitle: 'Português (Brasil)',
                  ),
                  const SizedBox(height: 8),
                  _buildMenuOption(
                    icon: Icons.dark_mode_outlined,
                    title: 'Tema',
                    subtitle: 'Claro',
                  ),
                  const SizedBox(height: 8),
                  _buildMenuOption(
                    icon: Icons.notifications_outlined,
                    title: 'Notificações',
                    subtitle: 'Ativadas',
                  ),
                  const SizedBox(height: 8),
                  _buildMenuOption(
                    icon: Icons.lock_outlined,
                    title: 'Segurança',
                    subtitle: 'Gerenciar senha',
                  ),
                  const SizedBox(height: 24),

                  // Logout
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.alertRed,
                      ),
                      onPressed: () {
                        // TODO: Implementar logout
                      },
                      child: const Text('Sair da Conta'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuOption({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return DeFuloCard(
      onTap: () {
        // TODO: Ação
      },
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primaryGreen),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textLight,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
