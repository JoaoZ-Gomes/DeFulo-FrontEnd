import React, { useState } from 'react';
import { useNavigate } from 'react-router';
import { ArrowLeft, Download, FileText, Calendar, User, Filter, Loader2, CheckCircle2, X } from 'lucide-react';
import { motion, AnimatePresence } from 'motion/react';
import { Button } from '../components/ui/button';
import { mockFazendas, mockTalhoes } from '../lib/mock-data';

export default function RelatoriosPage() {
  const navigate = useNavigate();
  const [filtroFazenda, setFiltroFazenda] = useState('');
  const [filtroDataInicio, setFiltroDataInicio] = useState('');
  const [filtroDataFim, setFiltroDataFim] = useState('');
  const [loadingPDF, setLoadingPDF] = useState(false);
  const [loadingCSV, setLoadingCSV] = useState(false);

  const handleGerarPDF = async () => {
    setLoadingPDF(true);
    await new Promise(resolve => setTimeout(resolve, 2000));
    setLoadingPDF(false);
    alert('Gerando relatório em PDF...\nEm produção, isso iniciaria o download do arquivo.');
  };

  const handleExportarCSV = async () => {
    setLoadingCSV(true);
    await new Promise(resolve => setTimeout(resolve, 1500));
    setLoadingCSV(false);
    alert('Exportando histórico em CSV...\nEm produção, isso iniciaria o download do arquivo.');
  };

  const limparFiltros = () => {
    setFiltroFazenda('');
    setFiltroDataInicio('');
    setFiltroDataFim('');
  };

  const totalEventos = mockTalhoes.reduce((sum, t) => sum + t.eventos.length, 0);
  const temFiltros = filtroFazenda || filtroDataInicio || filtroDataFim;

  return (
    <div className="min-h-screen" style={{ backgroundColor: '#F5F5F5' }}>
      {/* Header */}
      <motion.div 
        className="p-5 shadow-md"
        style={{ backgroundColor: '#ffffff' }}
        initial={{ y: -20, opacity: 0 }}
        animate={{ y: 0, opacity: 1 }}
        transition={{ duration: 0.4 }}
      >
        <div className="flex items-center gap-4">
          <motion.button 
            onClick={() => navigate(-1)}
            whileHover={{ scale: 1.1 }}
            whileTap={{ scale: 0.9 }}
          >
            <ArrowLeft size={26} style={{ color: '#2D5A27' }} />
          </motion.button>
          <div className="flex-1">
            <h2 className="text-xl" style={{ color: '#2D5A27', fontWeight: '700' }}>
              Relatórios
            </h2>
            <p className="text-sm" style={{ color: '#666666' }}>
              Exportação e análise de dados
            </p>
          </div>
        </div>
      </motion.div>

      <div className="p-4">
        {/* Estatísticas Gerais */}
        <motion.div 
          className="p-5 rounded-xl mb-5"
          style={{ 
            backgroundColor: '#ffffff',
            boxShadow: '0 4px 12px rgba(0, 0, 0, 0.08)',
          }}
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.4, delay: 0.1 }}
        >
          <h3 className="mb-4 text-lg" style={{ color: '#1a1a1a', fontWeight: '600' }}>
            Resumo Geral
          </h3>
          
          <div className="grid grid-cols-3 gap-3">
            {[
              { value: mockFazendas.length, label: 'Fazendas', color: '#2D5A27' },
              { value: mockTalhoes.length, label: 'Talhões', color: '#4E342E' },
              { value: totalEventos, label: 'Eventos', color: '#FF8F00' },
            ].map((stat, index) => (
              <motion.div 
                key={stat.label}
                className="text-center p-4 rounded-xl" 
                style={{ backgroundColor: '#F9F9F9' }}
                initial={{ opacity: 0, scale: 0.9 }}
                animate={{ opacity: 1, scale: 1 }}
                transition={{ delay: 0.2 + index * 0.05 }}
                whileHover={{ scale: 1.05, backgroundColor: stat.color + '10' }}
              >
                <div className="text-2xl mb-1" style={{ color: stat.color, fontWeight: '800' }}>
                  {stat.value}
                </div>
                <div className="text-xs" style={{ color: '#666666' }}>
                  {stat.label}
                </div>
              </motion.div>
            ))}
          </div>
        </motion.div>

        {/* Filtros */}
        <motion.div 
          className="p-5 rounded-xl mb-5"
          style={{ 
            backgroundColor: '#ffffff',
            boxShadow: '0 4px 12px rgba(0, 0, 0, 0.08)',
          }}
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.4, delay: 0.2 }}
        >
          <div className="flex items-center justify-between mb-4">
            <div className="flex items-center gap-2">
              <Filter size={22} style={{ color: '#2D5A27' }} />
              <h3 className="text-lg" style={{ color: '#1a1a1a', fontWeight: '600' }}>Filtros</h3>
            </div>
            <AnimatePresence>
              {temFiltros && (
                <motion.button
                  onClick={limparFiltros}
                  className="text-xs px-3 py-1.5 rounded-full flex items-center gap-1"
                  style={{ 
                    backgroundColor: '#FF8F00' + '20',
                    color: '#FF8F00',
                    fontWeight: '600',
                  }}
                  initial={{ opacity: 0, scale: 0 }}
                  animate={{ opacity: 1, scale: 1 }}
                  exit={{ opacity: 0, scale: 0 }}
                  whileHover={{ scale: 1.05 }}
                  whileTap={{ scale: 0.95 }}
                >
                  <X size={14} />
                  Limpar
                </motion.button>
              )}
            </AnimatePresence>
          </div>

          <div className="space-y-4">
            <div>
              <label className="text-sm flex items-center gap-2 mb-2" style={{ color: '#666666', fontWeight: '600' }}>
                <User size={16} />
                Fazenda
              </label>
              <select
                value={filtroFazenda}
                onChange={(e) => setFiltroFazenda(e.target.value)}
                className="w-full p-3 rounded-xl transition-all"
                style={{ 
                  backgroundColor: '#F9FAFB',
                  border: '2px solid #E5E7EB',
                }}
              >
                <option value="">Todas as fazendas</option>
                {mockFazendas.map((fazenda) => (
                  <option key={fazenda.id} value={fazenda.id}>
                    {fazenda.nome}
                  </option>
                ))}
              </select>
            </div>

            <div className="grid grid-cols-2 gap-3">
              <div>
                <label className="text-sm flex items-center gap-2 mb-2" style={{ color: '#666666', fontWeight: '600' }}>
                  <Calendar size={16} />
                  Data Início
                </label>
                <input
                  type="date"
                  value={filtroDataInicio}
                  onChange={(e) => setFiltroDataInicio(e.target.value)}
                  className="w-full p-3 rounded-xl transition-all"
                  style={{ 
                    backgroundColor: '#F9FAFB',
                    border: '2px solid #E5E7EB',
                  }}
                />
              </div>

              <div>
                <label className="text-sm flex items-center gap-2 mb-2" style={{ color: '#666666', fontWeight: '600' }}>
                  <Calendar size={16} />
                  Data Fim
                </label>
                <input
                  type="date"
                  value={filtroDataFim}
                  onChange={(e) => setFiltroDataFim(e.target.value)}
                  className="w-full p-3 rounded-xl transition-all"
                  style={{ 
                    backgroundColor: '#F9FAFB',
                    border: '2px solid #E5E7EB',
                  }}
                />
              </div>
            </div>
          </div>
        </motion.div>

        {/* Ações de Exportação */}
        <motion.div 
          className="p-5 rounded-xl mb-5"
          style={{ 
            backgroundColor: '#ffffff',
            boxShadow: '0 4px 12px rgba(0, 0, 0, 0.08)',
          }}
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.4, delay: 0.3 }}
        >
          <h3 className="mb-4 text-lg" style={{ color: '#1a1a1a', fontWeight: '600' }}>
            Exportar Dados
          </h3>

          <div className="space-y-3">
            <motion.button
              onClick={handleGerarPDF}
              disabled={loadingPDF}
              className="w-full p-5 rounded-xl border-2 border-dashed text-left transition-colors"
              style={{ 
                borderColor: '#2D5A27',
                backgroundColor: '#2D5A27' + '08',
              }}
              whileHover={!loadingPDF ? { scale: 1.02, backgroundColor: '#2D5A27' + '15' } : {}}
              whileTap={!loadingPDF ? { scale: 0.98 } : {}}
            >
              <div className="flex items-center gap-4">
                <motion.div 
                  className="w-12 h-12 rounded-xl flex items-center justify-center flex-shrink-0"
                  style={{ backgroundColor: '#2D5A27' }}
                  animate={loadingPDF ? { rotate: 360 } : {}}
                  transition={loadingPDF ? { duration: 1, repeat: Infinity, ease: "linear" } : {}}
                >
                  {loadingPDF ? (
                    <Loader2 size={24} style={{ color: '#ffffff' }} />
                  ) : (
                    <FileText size={24} style={{ color: '#ffffff' }} />
                  )}
                </motion.div>
                <div className="flex-1">
                  <div className="text-base mb-1" style={{ color: '#1a1a1a', fontWeight: '700' }}>
                    {loadingPDF ? 'Gerando PDF...' : 'Gerar PDF de Performance'}
                  </div>
                  <div className="text-xs" style={{ color: '#666666' }}>
                    Relatório completo com gráficos e análises
                  </div>
                </div>
                {!loadingPDF && <Download size={24} style={{ color: '#2D5A27' }} />}
              </div>
            </motion.button>

            <motion.button
              onClick={handleExportarCSV}
              disabled={loadingCSV}
              className="w-full p-5 rounded-xl border-2 border-dashed text-left transition-colors"
              style={{ 
                borderColor: '#4E342E',
                backgroundColor: '#4E342E' + '08',
              }}
              whileHover={!loadingCSV ? { scale: 1.02, backgroundColor: '#4E342E' + '15' } : {}}
              whileTap={!loadingCSV ? { scale: 0.98 } : {}}
            >
              <div className="flex items-center gap-4">
                <motion.div 
                  className="w-12 h-12 rounded-xl flex items-center justify-center flex-shrink-0"
                  style={{ backgroundColor: '#4E342E' }}
                  animate={loadingCSV ? { rotate: 360 } : {}}
                  transition={loadingCSV ? { duration: 1, repeat: Infinity, ease: "linear" } : {}}
                >
                  {loadingCSV ? (
                    <Loader2 size={24} style={{ color: '#ffffff' }} />
                  ) : (
                    <FileText size={24} style={{ color: '#ffffff' }} />
                  )}
                </motion.div>
                <div className="flex-1">
                  <div className="text-base mb-1" style={{ color: '#1a1a1a', fontWeight: '700' }}>
                    {loadingCSV ? 'Exportando CSV...' : 'Exportar CSV de Histórico'}
                  </div>
                  <div className="text-xs" style={{ color: '#666666' }}>
                    Planilha com todos os eventos de manejo
                  </div>
                </div>
                {!loadingCSV && <Download size={24} style={{ color: '#4E342E' }} />}
              </div>
            </motion.button>
          </div>
        </motion.div>

        {/* Informação */}
        <motion.div 
          className="p-4 rounded-xl"
          style={{ 
            backgroundColor: '#F0F9FF',
            border: '1px solid #BAE6FD',
          }}
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.5 }}
        >
          <p className="text-xs" style={{ color: '#0369A1', fontWeight: '500' }}>
            💡 <strong>Dica:</strong> Os relatórios respeitam os filtros aplicados acima. 
            Para relatórios completos, limpe todos os filtros antes de exportar.
          </p>
        </motion.div>
      </div>
    </div>
  );
}