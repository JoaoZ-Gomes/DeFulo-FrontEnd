import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/common_widgets.dart';

class NovaFazendaScreen extends ConsumerStatefulWidget {
  const NovaFazendaScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NovaFazendaScreen> createState() => _NovaFazendaScreenState();
}

class _NovaFazendaScreenState extends ConsumerState<NovaFazendaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _localController = TextEditingController();
  final _areaController = TextEditingController();
  final _produtorController = TextEditingController();

  bool _loading = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _localController.dispose();
    _areaController.dispose();
    _produtorController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    await Future.delayed(const Duration(milliseconds: 1500));

    if (mounted) {
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fazenda cadastrada com sucesso!')),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Fazenda'),
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
                'Cadastrar Nova Fazenda',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.primaryGreen),
              ),
              const SizedBox(height: 24),
              DeFuloTextInput(
                label: 'Nome da Fazenda',
                hint: 'Ex: Fazenda Boa Vista',
                controller: _nomeController,
                prefixIcon: Icons.agriculture_outlined,
              ),
              const SizedBox(height: 16),
              DeFuloTextInput(
                label: 'Localização',
                hint: 'Ex: Ribeirão Preto, SP',
                controller: _localController,
                prefixIcon: Icons.location_on_outlined,
              ),
              const SizedBox(height: 16),
              DeFuloTextInput(
                label: 'Área Total (hectares)',
                hint: 'Ex: 150',
                controller: _areaController,
                prefixIcon: Icons.straighten_outlined,
              ),
              const SizedBox(height: 16),
              DeFuloTextInput(
                label: 'Nome do Produtor',
                hint: 'Ex: João Silva',
                controller: _produtorController,
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _loading ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryGreen,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(0, 48),
                  ),
                  child: _loading
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : const Text('Salvar Fazenda'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
