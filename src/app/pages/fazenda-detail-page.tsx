import React, { useState } from 'react';
import { useNavigate, useParams } from 'react-router';
import { ArrowLeft, Plus, MapPin, ChevronRight, Droplets, Sprout, Loader2 } from 'lucide-react';
import { motion, AnimatePresence } from 'motion/react';
import { getFazendaById, getTalhoesByFazenda } from '../lib/mock-data';
import { Button } from '../components/ui/button';

export default function FazendaDetailPage() {
  const { id } = useParams();
  const navigate = useNavigate();
  const fazenda = getFazendaById(id || '');
  const talhoes = getTalhoesByFazenda(id || '');
  const [loading, setLoading] = useState(false);

  if (!fazenda) {
    return (
      <div className="min-h-screen flex items-center justify-center" style={{ backgroundColor: '#F5F5F5' }}>
        <motion.div
          className="text-center p-8"
          initial={{ opacity: 0, scale: 0.9 }}
          animate={{ opacity: 1, scale: 1 }}
        >
          <div className="text-4xl mb-4">🔍</div>
          <h3 className="text-lg mb-2" style={{ color: '#1a1a1a', fontWeight: '600' }}>
            Fazenda não encontrada
          </h3>
          <p className="text-sm mb-4" style={{ color: '#666666' }}>
            A fazenda que você está procurando não existe
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

  const getStatusLabel = (status: string) => {
    switch (status) {
      case 'ideal':
        return 'Ideal';
      case 'seco':
        return 'Seco';
      case 'saturado':
        return 'Saturado';
      default:
        return 'Desconhecido';
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
        <div className="flex items-center gap-4 mb-4">
          <motion.button 
            onClick={() => navigate(-1)}
            whileHover={{ scale: 1.1 }}
            whileTap={{ scale: 0.9 }}
          >
            <ArrowLeft size={26} style={{ color: '#2D5A27' }} />
          </motion.button>
          <div className="flex-1">
            <h2 className="text-xl" style={{ color: '#2D5A27', fontWeight: '700' }}>
              {fazenda.nome}
            </h2>
            <p className="text-sm" style={{ color: '#666666' }}>
              {fazenda.produtor}
            </p>
          </div>
        </div>

        {/* Info Card */}
        <motion.div 
          className="p-4 rounded-xl"
          style={{ backgroundColor: '#F9F9F9', border: '1px solid #e8e8e8' }}
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2 }}
        >
          <div className="grid grid-cols-2 gap-4">
            <div>
              <span className="text-xs" style={{ color: '#999999' }}>Área Total</span>
              <div className="text-base mt-0.5" style={{ color: '#1a1a1a', fontWeight: '700' }}>
                {fazenda.areaTotal}ha
              </div>
            </div>
            <div>
              <span className="text-xs" style={{ color: '#999999' }}>Cultura</span>
              <div className="text-base mt-0.5" style={{ color: '#1a1a1a', fontWeight: '700' }}>
                {fazenda.cultura}
              </div>
            </div>
            <div className="col-span-2">
              <span className="text-xs" style={{ color: '#999999' }}>Engenheiro Responsável</span>
              <div className="text-base mt-0.5" style={{ color: '#1a1a1a', fontWeight: '700' }}>
                {fazenda.agronomoResponsavel}
              </div>
            </div>
          </div>
        </motion.div>
      </motion.div>

      <div className="p-4">
        {/* Status Geral */}
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
            Status Geral da Fazenda
          </h3>
          
          <div className="flex items-center gap-3 mb-3">
            <Droplets size={22} style={{ color: getStatusColor(fazenda.statusUmidade) }} />
            <span className="text-sm" style={{ color: '#666666', fontWeight: '500' }}>Umidade Média</span>
          </div>
          
          <div 
            className="h-3 rounded-full overflow-hidden mb-3"
            style={{ backgroundColor: '#e0e0e0' }}
          >
            <motion.div
              className="h-full"
              style={{
                backgroundColor: getStatusColor(fazenda.statusUmidade),
              }}
              initial={{ width: 0 }}
              animate={{ width: `${fazenda.percentualUmidade}%` }}
              transition={{ duration: 1, delay: 0.5, ease: "easeOut" }}
            />
          </div>
          
          <div className="flex items-center justify-between">
            <span 
              className="px-3 py-1.5 rounded-full text-sm"
              style={{ 
                backgroundColor: getStatusColor(fazenda.statusUmidade) + '20',
                color: getStatusColor(fazenda.statusUmidade),
                fontWeight: '700',
              }}
            >
              {getStatusLabel(fazenda.statusUmidade)}
            </span>
            <span className="text-2xl" style={{ color: getStatusColor(fazenda.statusUmidade), fontWeight: '800' }}>
              {fazenda.percentualUmidade}%
            </span>
          </div>
        </motion.div>

        {/* Lista de Talhões */}
        <div className="flex items-center justify-between mb-4">
          <h3 className="text-lg" style={{ color: '#1a1a1a', fontWeight: '600' }}>
            Talhões ({talhoes.length})
          </h3>
          <motion.div whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }}>
            <Button
              size="sm"
              style={{ 
                backgroundColor: '#2D5A27',
                color: '#ffffff',
                boxShadow: '0 2px 8px rgba(45, 90, 39, 0.3)',
              }}
            >
              <Plus size={16} className="mr-1" />
              Novo Talhão
            </Button>
          </motion.div>
        </div>

        <div className="space-y-3">
          <AnimatePresence mode="popLayout">
            {loading ? (
              <motion.div
                className="flex flex-col items-center justify-center py-12"
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0 }}
              >
                <Loader2 size={40} className="animate-spin" style={{ color: '#2D5A27' }} />
                <p className="mt-4 text-sm" style={{ color: '#666666' }}>Carregando talhões...</p>
              </motion.div>
            ) : talhoes.length === 0 ? (
              <motion.div
                className="text-center py-12 px-4 rounded-xl"
                style={{ backgroundColor: '#ffffff', border: '2px dashed #e0e0e0' }}
                initial={{ opacity: 0, scale: 0.95 }}
                animate={{ opacity: 1, scale: 1 }}
              >
                <div className="text-4xl mb-3">📍</div>
                <h4 className="text-lg mb-2" style={{ color: '#1a1a1a', fontWeight: '600' }}>
                  Nenhum talhão cadastrado
                </h4>
                <p className="text-sm mb-4" style={{ color: '#666666' }}>
                  Comece adicionando talhões para esta fazenda
                </p>
                <Button style={{ backgroundColor: '#2D5A27', color: '#ffffff' }}>
                  <Plus size={16} className="mr-2" />
                  Adicionar Talhão
                </Button>
              </motion.div>
            ) : (
              talhoes.map((talhao, index) => (
                <motion.div
                  key={talhao.id}
                  onClick={() => navigate(`/talhao/${talhao.id}`)}
                  className="p-5 rounded-xl cursor-pointer"
                  style={{ 
                    backgroundColor: '#ffffff',
                    boxShadow: '0 2px 8px rgba(0, 0, 0, 0.06)',
                  }}
                  initial={{ opacity: 0, x: -20 }}
                  animate={{ opacity: 1, x: 0 }}
                  transition={{ duration: 0.3, delay: index * 0.08 }}
                  whileHover={{ 
                    scale: 1.02,
                    boxShadow: '0 8px 24px rgba(0, 0, 0, 0.12)',
                  }}
                  whileTap={{ scale: 0.98 }}
                >
                  <div className="flex items-start justify-between mb-3">
                    <div className="flex-1">
                      <div className="flex items-center gap-2 mb-1">
                        <h4 className="text-lg" style={{ color: '#1a1a1a', fontWeight: '700' }}>
                          Talhão {talhao.numero}
                        </h4>
                        <motion.span 
                          className="text-xs px-2 py-1 rounded-full"
                          style={{ 
                            backgroundColor: getStatusColor(talhao.statusUmidade) + '20',
                            color: getStatusColor(talhao.statusUmidade),
                            fontWeight: '700',
                          }}
                          whileHover={{ scale: 1.1 }}
                        >
                          {getStatusLabel(talhao.statusUmidade)}
                        </motion.span>
                      </div>
                      <p className="text-sm" style={{ color: '#666666' }}>
                        {talhao.area}ha • {talhao.cultura}
                      </p>
                    </div>
                    <ChevronRight size={22} style={{ color: '#999999' }} />
                  </div>

                  <div 
                    className="h-2.5 rounded-full overflow-hidden mb-3"
                    style={{ backgroundColor: '#e0e0e0' }}
                  >
                    <motion.div
                      className="h-full"
                      style={{
                        backgroundColor: getStatusColor(talhao.statusUmidade),
                      }}
                      initial={{ width: 0 }}
                      animate={{ width: `${talhao.percentualUmidade}%` }}
                      transition={{ duration: 0.8, delay: index * 0.08 + 0.3, ease: "easeOut" }}
                    />
                  </div>

                  <div className="flex items-center justify-between text-xs">
                    <span style={{ color: '#999999' }}>
                      Fase: {getFaseLabel(talhao.faseFenologica)}
                    </span>
                    <span style={{ color: '#999999' }}>
                      Plantio: {new Date(talhao.dataPlantio).toLocaleDateString('pt-BR')}
                    </span>
                  </div>
                </motion.div>
              ))
            )}
          </AnimatePresence>
        </div>
      </div>

      {/* FAB - Botão Flutuante */}
      <motion.button
        className="fixed bottom-6 right-6 w-16 h-16 rounded-full flex items-center justify-center"
        style={{ 
          backgroundColor: '#2D5A27',
          color: '#ffffff',
          boxShadow: '0 8px 24px rgba(45, 90, 39, 0.4)',
        }}
        onClick={() => navigate(`/fazenda/${id}/novo-evento`)}
        whileHover={{ scale: 1.1, boxShadow: '0 12px 32px rgba(45, 90, 39, 0.5)' }}
        whileTap={{ scale: 0.9 }}
        initial={{ scale: 0, opacity: 0 }}
        animate={{ scale: 1, opacity: 1 }}
        transition={{ type: "spring", stiffness: 200, delay: 0.6 }}
      >
        <Plus size={28} strokeWidth={2.5} />
      </motion.button>
    </div>
  );
}