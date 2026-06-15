import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/common_widgets.dart';
import '../../fazenda/model/fazenda_repository.dart';

class NovoEventoScreen extends ConsumerStatefulWidget {
  final FazendaLocal? fazenda;

  const NovoEventoScreen({
    Key? key,
    this.fazenda,
  }) : super(key: key);

  @override
  ConsumerState<NovoEventoScreen> createState() => _NovoEventoScreenState();
}

class _NovoEventoScreenState extends ConsumerState<NovoEventoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descricaoController = TextEditingController();
  final _quantidadeController = TextEditingController();

  String _selectedTipo = 'IRRIGACAO';
  bool _loading = false;

  final List<Map<String, dynamic>> _tipos = [
    {'value': 'IRRIGACAO', 'label': '💧 Irrigação', 'color': Colors.blue},
    {'value': 'ADUBACAO', 'label': '🌿 Adubação', 'color': Colors.green},
    {'value': 'PULVERIZACAO', 'label': '🚜 Pulverização', 'color': Colors.brown},
    {'value': 'COLHEITA', 'label': '🌾 Colheita', 'color': Colors.amber},
    {'value': 'PLANTIO', 'label': '🌱 Plantio', 'color': Colors.green},
    {'value': 'CAPINA', 'label': '🍃 Capina', 'color': Colors.lightGreen},
  ];

  @override
  void dispose() {
    _descricaoController.dispose();
    _quantidadeController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_descricaoController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, adicione uma descrição para o evento.')),
      );
      return;
    }

    setState(() => _loading = true);

    // Simular salvamento
    await Future.delayed(const Duration(milliseconds: 1500));

    if (mounted) {
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Evento de manejo registrado com sucesso!')),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Evento'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.primaryGreen),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Novo Evento de Manejo',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryGreen,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.fazenda != null 
                  ? 'Registrando ação de manejo para a fazenda: ${widget.fazenda!.nome}'
                  : 'Registre pulverizações, irrigações, adubações ou colheitas efetuadas na lavoura.',
                style: const TextStyle(fontSize: 14, color: AppTheme.textLight),
              ),
              const SizedBox(height: 24),

              // Tipo de Evento
              DropdownButtonFormField<String>(
                value: _selectedTipo,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedTipo = value;
                    });
                  }
                },
                items: _tipos.map((t) {
                  return DropdownMenuItem(
                    value: t['value'] as String,
                    child: Text(t['label'] as String),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Tipo de Evento',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppTheme.dividerGrey),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Descrição
              DeFuloTextInput(
                label: 'Descrição / Observações',
                hint: 'Ex: Aplicação de fertilizante mineral no talhão 02...',
                controller: _descricaoController,
                prefixIcon: Icons.description_outlined,
              ),
              const SizedBox(height: 16),

              // Quantidade
              DeFuloTextInput(
                label: 'Quantidade Aplicada (opcional)',
                hint: 'Ex: 20mm, 150kg/ha, 2L/ha',
                controller: _quantidadeController,
                prefixIcon: Icons.line_weight_outlined,
              ),
              const SizedBox(height: 32),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _loading ? null : () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(0, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Cancelar'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _loading ? null : _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryGreen,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: _loading 
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text('Salvar Evento'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Atalhos rápidos
              const Text(
                'Atalhos Rápidos',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.5,
                children: _tipos.map((t) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTipo = t['value'] as String;
                      });
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: _selectedTipo == t['value']
                              ? AppTheme.primaryGreen
                              : AppTheme.dividerGrey,
                          width: _selectedTipo == t['value'] ? 2.0 : 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            t['label'].toString().split(' ').first,
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            t['label'].toString().split(' ').last,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
