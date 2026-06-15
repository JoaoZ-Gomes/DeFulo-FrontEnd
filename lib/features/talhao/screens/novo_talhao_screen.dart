import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/common_widgets.dart';
import '../../fazenda/model/fazenda_repository.dart';

class NovoTalhaoScreen extends ConsumerStatefulWidget {
  final FazendaLocal? fazenda;
  const NovoTalhaoScreen({Key? key, this.fazenda}) : super(key: key);

  @override
  ConsumerState<NovoTalhaoScreen> createState() => _NovoTalhaoScreenState();
}

class _NovoTalhaoScreenState extends ConsumerState<NovoTalhaoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _areaController = TextEditingController();
  final _culturaController = TextEditingController();
  
  bool _loading = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _areaController.dispose();
    _culturaController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Talhão salvo com sucesso!')));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Talhão'),
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
              const Text('Cadastrar Talhão', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.primaryGreen)),
              const SizedBox(height: 24),
              DeFuloTextInput(
                label: 'Identificação do Talhão',
                hint: 'Ex: Talhão 01',
                controller: _nomeController,
                prefixIcon: Icons.grid_on_outlined,
              ),
              const SizedBox(height: 16),
              DeFuloTextInput(
                label: 'Área (hectares)',
                hint: 'Ex: 50.5',
                controller: _areaController,
                prefixIcon: Icons.straighten,
              ),
              const SizedBox(height: 16),
              DeFuloTextInput(
                label: 'Cultura Atual',
                hint: 'Ex: Soja',
                controller: _culturaController,
                prefixIcon: Icons.grass,
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
                      : const Text('Salvar Talhão'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
