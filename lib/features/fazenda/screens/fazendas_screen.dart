import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/common_widgets.dart';
import '../model/fazenda_repository.dart';

/// Tela de Fazendas
class FazendasScreen extends ConsumerStatefulWidget {
  const FazendasScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<FazendasScreen> createState() => _FazendasScreenState();
}

class _FazendasScreenState extends ConsumerState<FazendasScreen> {
  final List<FazendaLocal> _mockFazendas = [
    FazendaLocal(
      id: '1',
      nome: 'Fazenda São Paulo',
      localizacao: 'Ribeirão Preto, SP',
      latitude: -21.1753,
      longitude: -47.8101,
      areaTotal: 150.0,
      produtor: 'João Silva',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    FazendaLocal(
      id: '2',
      nome: 'Fazenda do Vale',
      localizacao: 'Araraquara, SP',
      latitude: -22.0149,
      longitude: -48.1758,
      areaTotal: 200.0,
      produtor: 'Maria Santos',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    FazendaLocal(
      id: '3',
      nome: 'Hacienda Nueva',
      localizacao: 'Barretos, SP',
      latitude: -20.5548,
      longitude: -48.5686,
      areaTotal: 120.0,
      produtor: 'Carlos Oliveira',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fazendas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implementar busca
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Implementar filtros
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _mockFazendas.length,
        itemBuilder: (context, index) {
          final fazenda = _mockFazendas[index];
          return _buildFazendaCard(fazenda);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Abrir dialog para criar fazenda
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildFazendaCard(FazendaLocal fazenda) {
    return GestureDetector(
      onTap: () {
        // TODO: Navegar para detalhes da fazenda
      },
      child: DeFuloCard(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header com imagem
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.primaryGreen.withOpacity(0.8),
                    AppTheme.primaryGreen.withOpacity(0.4),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '${fazenda.areaTotal?.toStringAsFixed(0) ?? '0'} ha',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryGreen,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 12,
                    left: 12,
                    child: Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
            // Conteúdo
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fazenda.nome,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: AppTheme.textLight,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          fazenda.localizacao ?? 'Local não informado',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppTheme.textLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.person_outline,
                        size: 16,
                        color: AppTheme.textLight,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          fazenda.produtor ?? 'Produtor não informado',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppTheme.textLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // TODO: Editar fazenda
                          },
                          child: const Text('Editar'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // TODO: Ver talhões
                          },
                          child: const Text('Talhões'),
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
    );
  }
}
