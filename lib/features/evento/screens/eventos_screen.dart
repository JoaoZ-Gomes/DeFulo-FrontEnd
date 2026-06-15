import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/common_widgets.dart';
import '../model/evento_repository.dart';

/// Tela de Eventos
class EventosScreen extends ConsumerStatefulWidget {
  final String? talhaoId;

  const EventosScreen({Key? key, this.talhaoId}) : super(key: key);

  @override
  ConsumerState<EventosScreen> createState() => _EventosScreenState();
}

class _EventosScreenState extends ConsumerState<EventosScreen> {
  final List<EventoLocal> _mockEventos = [
    EventoLocal(
      id: '1',
      talhaoId: '1',
      tipo: 'PULVERIZACAO',
      dataEvento: DateTime.now().subtract(const Duration(days: 2)),
      descricao: 'Pulverização preventiva contra pragas',
      status: 'EXECUTADO',
      responsavel: 'João Silva',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    EventoLocal(
      id: '2',
      talhaoId: '1',
      tipo: 'ADUBACAO',
      dataEvento: DateTime.now().subtract(const Duration(days: 5)),
      descricao: 'Adubação de manutenção',
      status: 'EXECUTADO',
      responsavel: 'Maria Santos',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    EventoLocal(
      id: '3',
      talhaoId: '2',
      tipo: 'IRRIGACAO',
      dataEvento: DateTime.now(),
      descricao: 'Irrigação noturna',
      status: 'PENDENTE',
      responsavel: 'Carlos Oliveira',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos'),
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
              // TODO: Implementar filtros por tipo
            },
          ),
        ],
      ),
      body: _mockEventos.isEmpty
        ? EmptyState(
            icon: Icons.event_note,
            title: 'Nenhum evento registrado',
            message: 'Comece registrando o primeiro evento de manejo',
            actionLabel: 'Criar Evento',
            onAction: () {
              // TODO: Abrir dialog para criar evento
            },
          )
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _mockEventos.length,
            itemBuilder: (context, index) {
              final evento = _mockEventos[index];
              return _buildEventoCard(evento);
            },
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Abrir dialog para criar evento
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildEventoCard(EventoLocal evento) {
    final isExecutado = evento.status == 'EXECUTADO';
    
    return GestureDetector(
      onTap: () {
        // TODO: Navegar para detalhes do evento
      },
      child: DeFuloCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getTipoLabel(evento.tipo),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textDark,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _formatarData(evento.dataEvento),
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppTheme.textLight,
                        ),
                      ),
                    ],
                  ),
                ),
                StatusBadge(
                  label: isExecutado ? 'Executado' : 'Pendente',
                  backgroundColor: isExecutado
                    ? AppTheme.successGreen.withOpacity(0.1)
                    : AppTheme.accentAmber.withOpacity(0.1),
                  textColor: isExecutado
                    ? AppTheme.successGreen
                    : AppTheme.accentAmber,
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Descrição
            if (evento.descricao != null) ...[
              Text(
                evento.descricao!,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppTheme.textDark,
                ),
              ),
              const SizedBox(height: 12),
            ],

            // Ícone e tipo de evento
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.primaryGreen.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    _getTipoIcon(evento.tipo),
                    color: AppTheme.primaryGreen,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Responsável',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppTheme.textLight,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          evento.responsavel ?? 'Não informado',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Ações
            Row(
              children: [
                if (!isExecutado)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Marcar como executado
                      },
                      child: const Text('Marcar Executado'),
                    ),
                  ),
                if (!isExecutado) const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // TODO: Editar evento
                    },
                    child: const Text('Detalhes'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getTipoLabel(String tipo) {
    return switch (tipo) {
      'PULVERIZACAO' => 'Pulverização',
      'ADUBACAO' => 'Adubação',
      'IRRIGACAO' => 'Irrigação',
      'PLANTIO' => 'Plantio',
      'COLHEITA' => 'Colheita',
      'CAPINA' => 'Capina',
      _ => tipo,
    };
  }

  IconData _getTipoIcon(String tipo) {
    return switch (tipo) {
      'PULVERIZACAO' => Icons.sanitizer,
      'ADUBACAO' => Icons.spa,
      'IRRIGACAO' => Icons.water_drop,
      'PLANTIO' => Icons.eco,
      'COLHEITA' => Icons.agriculture,
      'CAPINA' => Icons.nature,
      _ => Icons.event,
    };
  }

  String _formatarData(DateTime data) {
    return '${data.day}/${data.month}/${data.year} às ${data.hour.toString().padLeft(2, '0')}:${data.minute.toString().padLeft(2, '0')}';
  }
}
