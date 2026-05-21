import React from 'react';
import { useNavigate, useParams } from 'react-router';
import { ArrowLeft, Droplets, Calendar, Sprout, TrendingUp, Plus, Leaf, PackageCheck, Tractor, WheatOff, Loader2 } from 'lucide-react';
import { motion, AnimatePresence } from 'motion/react';
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';
import { getTalhaoById, mockMonitoramento24h } from '../lib/mock-data';
import { Button } from '../components/ui/button';

export default function TalhaoDetailPage() {
  const { id } = useParams();
  const navigate = useNavigate();
  const talhao = getTalhaoById(id || '');

  if (!talhao) {
    return (
      <div className="min-h-screen flex items-center justify-center" style={{ backgroundColor: '#F5F5F5' }}>
        <motion.div
          className="text-center p-8"
          initial={{ opacity: 0, scale: 0.9 }}
          animate={{ opacity: 1, scale: 1 }}
        >
          <div className="text-4xl mb-4">🔍</div>
          <h3 className="text-lg mb-2" style={{ color: '#1a1a1a', fontWeight: '600' }}>
            Talhão não encontrado
          </h3>
          <p className="text-sm mb-4" style={{ color: '#666666' }}>
            O talhão que você está procurando não existe
          </p>
          <Button onClick={() => navigate('/dashboard')}>
            Voltar ao Dashboard
          </Button>
        </motion.div>
      </div>
    );
  }

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'ideal':
        return '#2D5A27';
      case 'seco':
        return '#FF8F00';
      case 'saturado':
        return '#C62828';
      default:
        return '#666666';
    }
  };

  const getFaseLabel = (fase: string) => {
    switch (fase) {
      case 'emergencia':
        return 'Emergência';
      case 'desenvolvimento':
        return 'Desenvolvimento';
      case 'floracao':
        return 'Floração';
      case 'maturacao':
        return 'Maturação';
      default:
        return fase;
    }
  };

  const getTipoEventoIcon = (tipo: string) => {
    switch (tipo) {
      case 'irrigacao':
        return <Droplets size={20} style={{ color: '#4E89DC' }} />;
      case 'adubacao':
        return <Leaf size={20} style={{ color: '#2D5A27' }} />;
      case 'aplicacao':
        return <Tractor size={20} style={{ color: '#4E342E' }} />;
      case 'colheita':
        return <WheatOff size={20} style={{ color: '#FF8F00' }} />;
      case 'plantio':
        return <Sprout size={20} style={{ color: '#2D5A27' }} />;
      default:
        return <PackageCheck size={20} style={{ color: '#666666' }} />;
    }
  };

  const getTipoEventoLabel = (tipo: string) => {
    switch (tipo) {
      case 'irrigacao':
        return 'Irrigação';
      case 'adubacao':
        return 'Adubação';
      case 'aplicacao':
        return 'Aplicação';
      case 'colheita':
        return 'Colheita';
      case 'plantio':
        return 'Plantio';
      default:
        return tipo;
    }
  };

  const getCargoLabel = (cargo: string) => {
    switch (cargo) {
      case 'engenheiro':
        return 'Eng.';
      case 'rtv':
        return 'RTV';
      case 'produtor':
        return 'Prod.';
      default:
        return cargo;
    }
  };

  return (
    <div className="min-h-screen pb-20" style={{ backgroundColor: '#F5F5F5' }}>
      {/* Header Robusto */}
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
              Talhão {talhao.numero}
            </h2>
            <p className="text-sm" style={{ color: '#666666' }}>
              Monitoramento e Manejo
            </p>
          </div>
        </div>
      </motion.div>

      <div className="p-4 space-y-5">
        {/* Dados Fixos */}
        <motion.div 
          className="p-5 rounded-xl"
          style={{ 
            backgroundColor: '#ffffff',
            boxShadow: '0 4px 12px rgba(0, 0, 0, 0.08)',
          }}
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.4, delay: 0.1 }}
        >
          <h3 className="mb-4 text-lg" style={{ color: '#1a1a1a', fontWeight: '600' }}>
            Informações do Talhão
          </h3>
          
          <div className="grid grid-cols-2 gap-4">
            {[
              { icon: <Sprout size={20} style={{ color: '#2D5A27' }} />, label: 'Área', value: `${talhao.area} hectares` },
              { icon: <Calendar size={20} style={{ color: '#2D5A27' }} />, label: 'Plantio', value: new Date(talhao.dataPlantio).toLocaleDateString('pt-BR') },
              { icon: <TrendingUp size={20} style={{ color: '#2D5A27' }} />, label: 'Cultura', value: talhao.cultura },
              { icon: <Sprout size={20} style={{ color: '#2D5A27' }} />, label: 'Fase', value: getFaseLabel(talhao.faseFenologica) },
            ].map((item, index) => (
              <motion.div 
                key={index}
                className="flex items-start gap-3 p-3 rounded-lg" 
                style={{ backgroundColor: '#F9F9F9' }}
                initial={{ opacity: 0, scale: 0.9 }}
                animate={{ opacity: 1, scale: 1 }}
                transition={{ delay: 0.2 + index * 0.05 }}
                whileHover={{ scale: 1.03, backgroundColor: '#f0f9f0' }}
              >
                <div className="mt-0.5">{item.icon}</div>
                <div>
                  <div className="text-xs" style={{ color: '#999999' }}>{item.label}</div>
                  <div style={{ color: '#1a1a1a', fontWeight: '600' }}>{item.value}</div>
                </div>
              </motion.div>
            ))}
          </div>
        </motion.div>

        {/* Gráfico de Monitoramento */}
        <motion.div 
          className="p-5 rounded-xl"
          style={{ 
            backgroundColor: '#ffffff',
            boxShadow: '0 4px 12px rgba(0, 0, 0, 0.08)',
          }}
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.4, delay: 0.3 }}
        >
          <h3 className="mb-4 text-lg" style={{ color: '#1a1a1a', fontWeight: '600' }}>
            Monitoramento 24h
          </h3>
          
          <div className="h-52 mb-5">
            <ResponsiveContainer width="100%" height="100%">
              <LineChart data={mockMonitoramento24h}>
                <CartesianGrid strokeDasharray="3 3" stroke="#e0e0e0" />
                <XAxis 
                  dataKey="timestamp" 
                  stroke="#666666"
                  style={{ fontSize: '11px' }}
                />
                <YAxis 
                  stroke="#666666"
                  style={{ fontSize: '11px' }}
                />
                <Tooltip 
                  contentStyle={{ 
                    backgroundColor: '#ffffff',
                    border: '1px solid #e0e0e0',
                    borderRadius: '8px',
                    fontSize: '12px',
                  }}
                />
                <Legend wrapperStyle={{ fontSize: '12px' }} />
                <Line 
                  type="monotone" 
                  dataKey="umidade" 
                  stroke="#2D5A27" 
                  strokeWidth={3}
                  name="Umidade (%)"
                  dot={false}
                />
                <Line 
                  type="monotone" 
                  dataKey="previsaoChuva" 
                  stroke="#4E89DC" 
                  strokeWidth={3}
                  name="Prev. Chuva (mm)"
                  dot={false}
                />
              </LineChart>
            </ResponsiveContainer>
          </div>

          {/* Status Atual - DESTAQUE */}
          <motion.div 
            className="p-4 rounded-xl"
            style={{ 
              backgroundColor: getStatusColor(talhao.statusUmidade) + '08',
              border: `2px solid ${getStatusColor(talhao.statusUmidade)}`,
            }}
            whileHover={{ scale: 1.01 }}
            transition={{ duration: 0.2 }}
          >
            <div className="flex items-center justify-between mb-3">
              <div className="flex items-center gap-2">
                <Droplets size={22} style={{ color: getStatusColor(talhao.statusUmidade) }} />
                <span className="text-sm" style={{ color: '#1a1a1a', fontWeight: '600' }}>
                  Umidade Atual
                </span>
              </div>
              <motion.span 
                className="text-4xl"
                style={{ 
                  color: getStatusColor(talhao.statusUmidade),
                  fontWeight: '900',
                  letterSpacing: '-0.02em',
                }}
                initial={{ scale: 0 }}
                animate={{ scale: 1 }}
                transition={{ type: "spring", stiffness: 200, delay: 0.5 }}
              >
                {talhao.percentualUmidade}%
              </motion.span>
            </div>
            
            <div 
              className="h-2.5 rounded-full overflow-hidden mb-2"
              style={{ backgroundColor: '#e0e0e0' }}
            >
              <motion.div
                className="h-full"
                style={{
                  backgroundColor: getStatusColor(talhao.statusUmidade),
                }}
                initial={{ width: 0 }}
                animate={{ width: `${talhao.percentualUmidade}%` }}
                transition={{ duration: 1, delay: 0.6, ease: "easeOut" }}
              />
            </div>
            
            <div className="flex items-center justify-between text-xs">
              <span style={{ color: '#666666' }}>
                Limite crítico: {talhao.limiteCriticoUmidade}%
              </span>
              <span 
                className="px-2 py-1 rounded-full"
                style={{ 
                  backgroundColor: getStatusColor(talhao.statusUmidade),
                  color: '#ffffff',
                  fontWeight: '700',
                }}
              >
                {talhao.statusUmidade === 'ideal' ? 'IDEAL' : talhao.statusUmidade === 'seco' ? 'SECO' : 'SATURADO'}
              </span>
            </div>
          </motion.div>
        </motion.div>

        {/* Timeline de Manejo */}
        <motion.div 
          className="p-5 rounded-xl"
          style={{ 
            backgroundColor: '#ffffff',
            boxShadow: '0 4px 12px rgba(0, 0, 0, 0.08)',
          }}
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.4, delay: 0.4 }}
        >
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg" style={{ color: '#1a1a1a', fontWeight: '600' }}>
              Histórico de Manejo
            </h3>
            <motion.div whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }}>
              <Button
                size="sm"
                style={{ 
                  backgroundColor: '#4E342E',
                  color: '#ffffff',
                }}
                onClick={() => navigate(`/talhao/${id}/novo-evento`)}
              >
                <Plus size={16} className="mr-1" />
                Registrar
              </Button>
            </motion.div>
          </div>

          <AnimatePresence mode="popLayout">
            {talhao.eventos.length === 0 ? (
              <motion.div
                className="text-center py-8 px-4"
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0 }}
              >
                <div className="text-3xl mb-3">📋</div>
                <p className="text-sm" style={{ color: '#999999' }}>
                  Nenhum evento registrado ainda
                </p>
              </motion.div>
            ) : (
              <div className="space-y-3">
                {talhao.eventos.map((evento, index) => (
                  <motion.div
                    key={evento.id}
                    className="flex gap-4 p-4 rounded-xl"
                    style={{ 
                      backgroundColor: '#F9F9F9',
                      border: '1px solid #e8e8e8',
                    }}
                    initial={{ opacity: 0, x: -20 }}
                    animate={{ opacity: 1, x: 0 }}
                    transition={{ delay: index * 0.08 }}
                    whileHover={{ 
                      scale: 1.02,
                      backgroundColor: '#f0f9f0',
                      borderColor: '#2D5A27',
                    }}
                  >
                    <motion.div 
                      className="w-12 h-12 rounded-xl flex items-center justify-center flex-shrink-0"
                      style={{ backgroundColor: '#ffffff', border: '1px solid #e0e0e0' }}
                      whileHover={{ scale: 1.1, rotate: 5 }}
                    >
                      {getTipoEventoIcon(evento.tipo)}
                    </motion.div>
                    
                    <div className="flex-1">
                      <div className="flex items-start justify-between mb-2">
                        <div>
                          <div className="text-base" style={{ color: '#1a1a1a', fontWeight: '600' }}>
                            {getTipoEventoLabel(evento.tipo)}
                          </div>
                          <div className="text-sm mt-1" style={{ color: '#666666' }}>
                            {evento.descricao}
                            {evento.quantidade && <span style={{ fontWeight: '600' }}> • {evento.quantidade}</span>}
                          </div>
                        </div>
                      </div>
                      
                      <div className="flex items-center justify-between text-xs mt-3">
                        <span style={{ color: '#999999' }}>
                          {new Date(evento.data).toLocaleDateString('pt-BR')}
                        </span>
                        <span 
                          className="px-3 py-1.5 rounded-full"
                          style={{ 
                            backgroundColor: '#2D5A27',
                            color: '#ffffff',
                            fontWeight: '700',
                          }}
                        >
                          {getCargoLabel(evento.cargoResponsavel)} {evento.responsavel}
                        </span>
                      </div>
                    </div>
                  </motion.div>
                ))}
              </div>
            )}
          </AnimatePresence>
        </motion.div>
      </div>

      {/* FAB - Botão Flutuante */}
      <motion.button
        className="fixed bottom-6 right-6 w-16 h-16 rounded-full flex items-center justify-center"
        style={{ 
          backgroundColor: '#4E342E',
          color: '#ffffff',
          boxShadow: '0 8px 24px rgba(78, 52, 46, 0.4)',
        }}
        onClick={() => navigate(`/talhao/${id}/novo-evento`)}
        whileHover={{ scale: 1.1, boxShadow: '0 12px 32px rgba(78, 52, 46, 0.5)' }}
        whileTap={{ scale: 0.9 }}
        initial={{ scale: 0, opacity: 0 }}
        animate={{ scale: 1, opacity: 1 }}
        transition={{ type: "spring", stiffness: 200, delay: 0.7 }}
      >
        <Plus size={28} strokeWidth={2.5} />
      </motion.button>
    </div>
  );
}