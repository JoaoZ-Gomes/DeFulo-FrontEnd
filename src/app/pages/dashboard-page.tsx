import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router';
import { MapPin, TrendingUp, TrendingDown, Droplets, ChevronRight, Sprout, Coffee, Wheat, Loader2 } from 'lucide-react';
import { motion, AnimatePresence } from 'motion/react';
import { useAuth } from '../lib/auth-context';
import api from '../lib/api';
import { Button } from '../components/ui/button';
import logoImage from 'figma:asset/82d3cbfaf0ddec72a45c912d27694f99df1e1b13.png';

interface FazendaAPI {
  id: number;
  nome: string;
  areaTotal: number;
  cultura: string;
  nomeProdutor: string;
}

export default function DashboardPage() {
  const navigate = useNavigate();
  const { user, logout } = useAuth();
  const [loading, setLoading] = useState(true);
  const [fazendas, setFazendas] = useState<FazendaAPI[]>([]);

  useEffect(() => {
    async function loadFazendas() {
      try {
        const response = await api.get('/fazendas');
        setFazendas(response.data);
      } catch (error) {
        console.error('Error loading fazendas:', error);
      } finally {
        setLoading(false);
      }
    }
    loadFazendas();
  }, []);

  const totalArea = fazendas.reduce((sum, f) => sum + f.areaTotal, 0);
  
  // Dados simulados para UI (enquanto não temos telemetria real no back-end)
  const percentualConforto = 75; 
  const percentualEstresse = 25;

  const getStatusColor = (percent: number) => {
    if (percent > 70) return '#2D5A27';
    if (percent > 40) return '#FF8F00';
    return '#C62828';
  };

  const getStatusLabel = (percent: number) => {
    if (percent > 70) return 'Ideal';
    if (percent > 40) return 'Seco';
    return 'Crítico';
  };

  const getCulturaIcon = (cultura: string) => {
    if (cultura.toLowerCase().includes('soja')) return <Sprout size={14} />;
    if (cultura.toLowerCase().includes('milho')) return <Wheat size={14} />;
    if (cultura.toLowerCase().includes('café')) return <Coffee size={14} />;
    return <Wheat size={14} />;
  };

  return (
    <div className="min-h-screen" style={{ backgroundColor: '#F5F5F5' }}>
      {/* Header Robusto */}
      <motion.div 
        className="p-5 shadow-md"
        style={{ backgroundColor: '#ffffff' }}
        initial={{ y: -20, opacity: 0 }}
        animate={{ y: 0, opacity: 1 }}
        transition={{ duration: 0.4 }}
      >
        <div className="flex items-center justify-between mb-4">
          <div className="flex items-center gap-3">
            <motion.img 
              src={logoImage} 
              alt="DeFulo" 
              className="w-10 h-10"
              whileHover={{ scale: 1.1, rotate: 5 }}
              transition={{ type: "spring", stiffness: 300 }}
            />
            <div>
              <h1 className="text-xl" style={{ color: '#2D5A27', fontWeight: '700' }}>
                DeFulo
              </h1>
              <p className="text-xs" style={{ color: '#666666' }}>
                {user?.name}
              </p>
            </div>
          </div>
          <motion.div whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }}>
            <Button
              onClick={logout}
              variant="outline"
              size="sm"
            >
              Sair
            </Button>
          </motion.div>
        </div>

        {/* Selector de Organização - Aumentado */}
        <motion.div 
          className="flex items-center gap-3 p-3 rounded-lg" 
          style={{ backgroundColor: '#F9F9F9', border: '2px solid #e0e0e0' }}
          whileHover={{ borderColor: '#2D5A27' }}
          transition={{ duration: 0.2 }}
        >
          <MapPin size={24} style={{ color: '#2D5A27' }} />
          <select 
            className="flex-1 bg-transparent border-0 outline-none text-base"
            style={{ 
              color: '#1a1a1a',
              fontWeight: '600',
            }}
          >
            <option>Condomínio Agrícola Vale Verde</option>
            <option>Cooperativa Agrícola Regional</option>
            <option>Prefeitura Municipal Rural</option>
          </select>
        </motion.div>
      </motion.div>

      <div className="p-4">
        {/* Widget de Status */}
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
            Visão Geral
          </h3>
          
          <div className="grid grid-cols-2 gap-4 mb-4">
            <motion.div 
              className="text-center p-4 rounded-lg" 
              style={{ backgroundColor: '#F5F5F5' }}
              whileHover={{ scale: 1.03, backgroundColor: '#e8f5e9' }}
              transition={{ duration: 0.2 }}
            >
              <div className="text-3xl mb-1" style={{ color: '#2D5A27', fontWeight: '700' }}>
                {totalArea}ha
              </div>
              <div className="text-xs" style={{ color: '#666666' }}>
                Área Total
              </div>
            </motion.div>
            
            <motion.div 
              className="text-center p-4 rounded-lg" 
              style={{ backgroundColor: '#F5F5F5' }}
              whileHover={{ scale: 1.03, backgroundColor: '#e8f5e9' }}
              transition={{ duration: 0.2 }}
            >
              <div className="text-3xl mb-1" style={{ color: '#2D5A27', fontWeight: '700' }}>
                {mockFazendas.length}
              </div>
              <div className="text-xs" style={{ color: '#666666' }}>
                Fazendas
              </div>
            </motion.div>
          </div>

          <div className="flex items-center gap-4 text-sm">
            <div className="flex items-center gap-2">
              <TrendingUp size={18} style={{ color: '#2D5A27' }} />
              <span style={{ color: '#2D5A27', fontWeight: '500' }}>{percentualConforto}% Conforto</span>
            </div>
            <div className="flex items-center gap-2">
              <TrendingDown size={18} style={{ color: '#FF8F00' }} />
              <span style={{ color: '#FF8F00', fontWeight: '500' }}>{percentualEstresse}% Atenção</span>
            </div>
          </div>
        </motion.div>

        {/* Lista de Fazendas */}
        <div className="space-y-4">
          <h3 className="text-lg" style={{ color: '#1a1a1a', fontWeight: '600' }}>Fazendas</h3>
          
          <AnimatePresence mode="popLayout">
            {loading ? (
              <motion.div
                className="flex flex-col items-center justify-center py-12"
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0 }}
              >
                <Loader2 size={40} className="animate-spin" style={{ color: '#2D5A27' }} />
                <p className="mt-4 text-sm" style={{ color: '#666666' }}>Carregando fazendas...</p>
              </motion.div>
            ) : fazendas.length === 0 ? (
              <motion.div
                className="text-center py-12 px-4 rounded-xl"
                style={{ backgroundColor: '#ffffff', border: '2px dashed #e0e0e0' }}
                initial={{ opacity: 0, scale: 0.95 }}
                animate={{ opacity: 1, scale: 1 }}
              >
                <div className="text-4xl mb-3">🌾</div>
                <h4 className="text-lg mb-2" style={{ color: '#1a1a1a', fontWeight: '600' }}>
                  Nenhuma fazenda cadastrada
                </h4>
                <p className="text-sm" style={{ color: '#666666' }}>
                  Comece adicionando sua primeira fazenda ao sistema
                </p>
              </motion.div>
            ) : (
              fazendas.map((fazenda, index) => {
                // Mock temporário para dados ainda não vindos da API
                const percentualUmidade = 75 - (index * 10); 
                
                return (
                   <motion.div
                    key={fazenda.id}
                    onClick={() => navigate(`/fazenda/${fazenda.id}`)}
                    className="p-5 rounded-xl cursor-pointer"
                    style={{ 
                      backgroundColor: '#ffffff',
                      boxShadow: '0 2px 8px rgba(0, 0, 0, 0.06)',
                    }}
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ duration: 0.3, delay: index * 0.05 }}
                    whileHover={{ 
                      scale: 1.02,
                      boxShadow: '0 8px 24px rgba(0, 0, 0, 0.12)',
                    }}
                    whileTap={{ scale: 0.98 }}
                  >
                    {/* Header do Card */}
                    <div className="flex items-start justify-between mb-4">
                      <div className="flex-1">
                        <div className="flex items-center gap-2 mb-2">
                          <h4 className="text-lg" style={{ color: '#1a1a1a', fontWeight: '700' }}>
                            {fazenda.nome}
                          </h4>
                          <motion.span 
                            className="px-2 py-1 rounded-md flex items-center gap-1.5"
                            style={{ 
                              backgroundColor: '#2D5A27',
                              color: '#ffffff',
                            }}
                            whileHover={{ scale: 1.05 }}
                          >
                            {getCulturaIcon(fazenda.cultura)}
                            <span className="text-xs" style={{ fontWeight: '600' }}>{fazenda.cultura}</span>
                          </motion.span>
                        </div>
                        <p className="text-sm" style={{ color: '#999999', fontWeight: '400' }}>
                          {fazenda.nomeProdutor}
                        </p>
                      </div>
                      <ChevronRight size={24} style={{ color: '#999999' }} />
                    </div>

                    {/* Barra de Status de Umidade - DESTAQUE */}
                    <div className="mb-4">
                      <div className="flex items-center justify-between mb-2">
                        <div className="flex items-center gap-2">
                          <Droplets size={18} style={{ color: getStatusColor(percentualUmidade) }} />
                          <span className="text-sm" style={{ color: '#666666' }}>Umidade</span>
                        </div>
                        <div className="flex items-center gap-2">
                          <motion.span 
                            className="text-2xl"
                            style={{ 
                              color: getStatusColor(percentualUmidade),
                              fontWeight: '800',
                            }}
                            initial={{ scale: 0 }}
                            animate={{ scale: 1 }}
                            transition={{ type: "spring", stiffness: 200, delay: index * 0.05 + 0.2 }}
                          >
                            {percentualUmidade}%
                          </motion.span>
                          <span 
                            className="text-xs px-2 py-1 rounded"
                            style={{ 
                              backgroundColor: getStatusColor(percentualUmidade) + '20',
                              color: getStatusColor(percentualUmidade),
                              fontWeight: '600',
                            }}
                          >
                            {getStatusLabel(percentualUmidade)}
                          </span>
                        </div>
                      </div>
                      <div 
                        className="h-2.5 rounded-full overflow-hidden"
                        style={{ backgroundColor: '#e0e0e0' }}
                      >
                        <motion.div
                          className="h-full"
                          style={{
                            backgroundColor: getStatusColor(percentualUmidade),
                          }}
                          initial={{ width: 0 }}
                          animate={{ width: `${percentualUmidade}%` }}
                          transition={{ duration: 0.8, delay: index * 0.05 + 0.3, ease: "easeOut" }}
                        />
                      </div>
                    </div>

                    {/* Info Adicional */}
                    <div className="flex items-center justify-between">
                      <span className="text-xs" style={{ color: '#999999' }}>
                        {fazenda.areaTotal}ha • Gestão Integrada
                      </span>
                      <span 
                        className="text-xs px-3 py-1.5 rounded-full"
                        style={{ 
                          backgroundColor: '#2D5A27' + '15',
                          color: '#2D5A27',
                          fontWeight: '600',
                        }}
                      >
                        Monitoramento Ativo
                      </span>
                    </div>
                  </motion.div>
                );
              })
            )}
          </AnimatePresence>
        </div>
      </div>
    </div>
  );
}