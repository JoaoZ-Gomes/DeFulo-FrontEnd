import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/common_widgets.dart';

class RelatoriosScreen extends ConsumerStatefulWidget {
  const RelatoriosScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RelatoriosScreen> createState() => _RelatoriosScreenState();
}

class _RelatoriosScreenState extends ConsumerState<RelatoriosScreen> {
  String? _selectedFazenda;
  DateTime? _startDate;
  DateTime? _endDate;

  bool _loadingPDF = false;
  bool _loadingCSV = false;

  final List<Map<String, String>> _fazendas = [
    {'id': '1', 'nome': 'Fazenda São Paulo'},
    {'id': '2', 'nome': 'Fazenda do Vale'},
    {'id': '3', 'nome': 'Hacienda Nueva'},
  ];

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 30)),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  Future<void> _gerarPDF() async {
    setState(() => _loadingPDF = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _loadingPDF = false);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Exportação concluída'),
          content: const Text('Relatório PDF de Performance gerado e baixado com sucesso.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _gerarCSV() async {
    setState(() => _loadingCSV = true);
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      setState(() => _loadingCSV = false);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Exportação concluída'),
          content: const Text('Histórico de Manejo CSV exportado e baixado com sucesso.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _limparFiltros() {
    setState(() {
      _selectedFazenda = null;
      _startDate = null;
      _endDate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool temFiltro = _selectedFazenda != null || _startDate != null || _endDate != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatórios'),
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
            // Resumo Geral Card
            DeFuloCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Resumo Geral',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildResumoStat('3', 'Fazendas', AppTheme.primaryGreen),
                      _buildResumoStat('12', 'Talhões', AppTheme.primaryGreen.withBlue(100)),
                      _buildResumoStat('45', 'Eventos', AppTheme.accentAmber),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Filtros Card
            DeFuloCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.filter_alt_outlined, color: AppTheme.primaryGreen),
                          SizedBox(width: 8),
                          Text(
                            'Filtros de Exportação',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textDark,
                            ),
                          ),
                        ],
                      ),
                      if (temFiltro)
                        TextButton(
                          onPressed: _limparFiltros,
                          child: const Text(
                            'Limpar',
                            style: TextStyle(color: AppTheme.alertOrange, fontWeight: FontWeight.bold),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Fazenda Dropdown
                  DropdownButtonFormField<String>(
                    value: _selectedFazenda,
                    onChanged: (value) {
                      setState(() {
                        _selectedFazenda = value;
                      });
                    },
                    items: _fazendas.map((f) {
                      return DropdownMenuItem(
                        value: f['id'],
                        child: Text(f['nome']!),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Fazenda',
                      prefixIcon: const Icon(Icons.location_city_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppTheme.dividerGrey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Datas
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _selectStartDate(context),
                          child: AbsorbPointer(
                            child: DeFuloTextInput(
                              label: 'Data Início',
                              hint: _startDate == null 
                                  ? 'Selecione' 
                                  : '${_startDate!.day.toString().padLeft(2, '0')}/${_startDate!.month.toString().padLeft(2, '0')}/${_startDate!.year}',
                              prefixIcon: Icons.calendar_today_outlined,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _selectEndDate(context),
                          child: AbsorbPointer(
                            child: DeFuloTextInput(
                              label: 'Data Fim',
                              hint: _endDate == null 
                                  ? 'Selecione' 
                                  : '${_endDate!.day.toString().padLeft(2, '0')}/${_endDate!.month.toString().padLeft(2, '0')}/${_endDate!.year}',
                              prefixIcon: Icons.calendar_month_outlined,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Exportar Ações Header
            const Text(
              'Exportar Dados',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 12),

            // Botão Exportar PDF
            _buildExportButton(
              onTap: _loadingPDF || _loadingCSV ? null : _gerarPDF,
              loading: _loadingPDF,
              icon: Icons.picture_as_pdf,
              title: 'Gerar PDF de Performance',
              subtitle: 'Relatório completo com gráficos e análises.',
              color: AppTheme.primaryGreen,
            ),
            const SizedBox(height: 12),

            // Botão Exportar CSV
            _buildExportButton(
              onTap: _loadingPDF || _loadingCSV ? null : _gerarCSV,
              loading: _loadingCSV,
              icon: Icons.table_view_outlined,
              title: 'Exportar CSV de Histórico',
              subtitle: 'Planilha contendo todos os eventos de manejo do talhão.',
              color: AppTheme.primaryGreen.withBlue(80),
            ),
            const SizedBox(height: 24),

            // Dica de filtro
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.withValues(alpha: 0.2)),
              ),
              child: Row(
                children: const [
                  Icon(Icons.lightbulb_outline, color: Colors.blue),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Dica: Os relatórios gerados respeitam os filtros de Fazenda e Período de Datas selecionados acima.',
                      style: TextStyle(fontSize: 12, color: Colors.blue, fontWeight: FontWeight.w500),
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

  Widget _buildResumoStat(String value, String label, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.1)),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: AppTheme.textLight),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExportButton({
    required VoidCallback? onTap,
    required bool loading,
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return DeFuloCard(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: loading
                ? const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryGreen),
                    ),
                  )
                : Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppTheme.textLight,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.download, color: AppTheme.textLight),
        ],
      ),
    );
  }
}
