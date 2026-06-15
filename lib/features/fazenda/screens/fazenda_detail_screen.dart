import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/common_widgets.dart';
import '../model/fazenda_repository.dart';

class FazendaDetailScreen extends ConsumerWidget {
  final FazendaLocal fazenda;

  const FazendaDetailScreen({Key? key, required this.fazenda}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fazenda.nome),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.primaryGreen),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DeFuloCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Produtor', style: TextStyle(color: AppTheme.textLight, fontSize: 12)),
                          Text(fazenda.produtor ?? 'Não informado', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Área Total', style: TextStyle(color: AppTheme.textLight, fontSize: 12)),
                          Text('${fazenda.areaTotal ?? 0} ha', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (fazenda.localizacao != null)
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 16, color: AppTheme.primaryGreen),
                        const SizedBox(width: 4),
                        Text(fazenda.localizacao!),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Talhões da Fazenda',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textDark),
            ),
            const SizedBox(height: 12),
            EmptyState(
              icon: Icons.grid_on_outlined,
              title: 'Nenhum talhão cadastrado',
              message: 'Cadastre os talhões para iniciar o monitoramento',
              actionLabel: 'Novo Talhão',
              onAction: () {
                // Navegar para Novo Talhao
              },
            ),
          ],
        ),
      ),
    );
  }
}
