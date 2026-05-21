import React, { useState } from 'react';
import { useNavigate } from 'react-router';
import { ArrowLeft, Save, MapPin, Loader2, CheckCircle2 } from 'lucide-react';
import { motion } from 'motion/react';
import { Button } from '../components/ui/button';
import { Input } from '../components/ui/input';
import { Label } from '../components/ui/label';
import { useAuth } from '../lib/auth-context';
import { mockFazendas } from '../lib/mock-data';

export default function NovoTalhaoPage() {
  const navigate = useNavigate();
  const { user } = useAuth();
  const [fazendaId, setFazendaId] = useState('');
  const [numero, setNumero] = useState('');
  const [area, setArea] = useState('');
  const [cultura, setCultura] = useState('');
  const [dataPlantio, setDataPlantio] = useState('');
  const [limiteCritico, setLimiteCritico] = useState('40');
  const [loading, setLoading] = useState(false);
  const [focusedField, setFocusedField] = useState<string | null>(null);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    
    // Simula salvamento
    await new Promise(resolve => setTimeout(resolve, 1500));
    
    setLoading(false);
    alert('Talhão cadastrado com sucesso!');
    navigate('/dashboard');
  };

  const isEngenheiro = user?.role === 'engenheiro';

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
              Novo Talhão
            </h2>
            <p className="text-sm" style={{ color: '#666666' }}>
              Cadastro de área de plantio
            </p>
          </div>
        </div>
      </motion.div>

      <div className="p-4">
        <form onSubmit={handleSubmit}>
          <motion.div 
            className="p-6 rounded-2xl space-y-6"
            style={{ 
              backgroundColor: '#ffffff',
              boxShadow: '0 4px 12px rgba(0, 0, 0, 0.08)',
            }}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.4, delay: 0.2 }}
          >
            <div>
              <Label 
                htmlFor="fazenda"
                style={{ color: '#1a1a1a', fontWeight: '600', fontSize: '14px' }}
              >
                <MapPin size={16} className="inline mr-1" />
                Vincular à Fazenda
              </Label>
              <motion.select
                id="fazenda"
                value={fazendaId}
                onChange={(e) => setFazendaId(e.target.value)}
                onFocus={() => setFocusedField('fazenda')}
                onBlur={() => setFocusedField(null)}
                required
                className="w-full mt-2 p-3 rounded-xl transition-all"
                style={{ 
                  backgroundColor: '#F9FAFB',
                  border: focusedField === 'fazenda' ? '2px solid #2D5A27' : '2px solid #E5E7EB',
                }}
                whileFocus={{ scale: 1.01 }}
              >
                <option value="">Selecione uma fazenda</option>
                {mockFazendas.map((fazenda) => (
                  <option key={fazenda.id} value={fazenda.id}>
                    {fazenda.nome} - {fazenda.produtor}
                  </option>
                ))}
              </motion.select>
            </div>

            <div>
              <Label 
                htmlFor="numero"
                style={{ color: '#1a1a1a', fontWeight: '600', fontSize: '14px' }}
              >
                Número do Talhão
              </Label>
              <Input
                id="numero"
                value={numero}
                onChange={(e) => setNumero(e.target.value)}
                onFocus={() => setFocusedField('numero')}
                onBlur={() => setFocusedField(null)}
                placeholder="Ex: 01, 02, 03..."
                required
                className="mt-2 h-12 transition-all"
                style={{ 
                  backgroundColor: '#F9FAFB',
                  border: focusedField === 'numero' ? '2px solid #2D5A27' : '2px solid #E5E7EB',
                  borderRadius: '12px',
                }}
              />
            </div>

            <div>
              <Label 
                htmlFor="area"
                style={{ color: '#1a1a1a', fontWeight: '600', fontSize: '14px' }}
              >
                Tamanho da Área (hectares)
              </Label>
              <Input
                id="area"
                type="number"
                value={area}
                onChange={(e) => setArea(e.target.value)}
                onFocus={() => setFocusedField('area')}
                onBlur={() => setFocusedField(null)}
                placeholder="Ex: 50"
                required
                className="mt-2 h-12 transition-all"
                style={{ 
                  backgroundColor: '#F9FAFB',
                  border: focusedField === 'area' ? '2px solid #2D5A27' : '2px solid #E5E7EB',
                  borderRadius: '12px',
                }}
              />
            </div>

            <div>
              <Label 
                htmlFor="cultura"
                style={{ color: '#1a1a1a', fontWeight: '600', fontSize: '14px' }}
              >
                Cultura
              </Label>
              <select
                id="cultura"
                value={cultura}
                onChange={(e) => setCultura(e.target.value)}
                onFocus={() => setFocusedField('cultura')}
                onBlur={() => setFocusedField(null)}
                required
                className="w-full mt-2 p-3 rounded-xl transition-all"
                style={{ 
                  backgroundColor: '#F9FAFB',
                  border: focusedField === 'cultura' ? '2px solid #2D5A27' : '2px solid #E5E7EB',
                }}
              >
                <option value="">Selecione a cultura</option>
                <option value="Soja">🌱 Soja</option>
                <option value="Milho">🌽 Milho</option>
                <option value="Milho Safrinha">🌽 Milho Safrinha</option>
                <option value="Café">☕ Café</option>
                <option value="Feijão">🫘 Feijão</option>
                <option value="Trigo">🌾 Trigo</option>
                <option value="Algodão">🌸 Algodão</option>
                <option value="Outros">🌿 Outros</option>
              </select>
            </div>

            <div>
              <Label 
                htmlFor="dataPlantio"
                style={{ color: '#1a1a1a', fontWeight: '600', fontSize: '14px' }}
              >
                Data de Plantio
              </Label>
              <Input
                id="dataPlantio"
                type="date"
                value={dataPlantio}
                onChange={(e) => setDataPlantio(e.target.value)}
                onFocus={() => setFocusedField('dataPlantio')}
                onBlur={() => setFocusedField(null)}
                required
                className="mt-2 h-12 transition-all"
                style={{ 
                  backgroundColor: '#F9FAFB',
                  border: focusedField === 'dataPlantio' ? '2px solid #2D5A27' : '2px solid #E5E7EB',
                  borderRadius: '12px',
                }}
              />
            </div>

            {/* Campo técnico - apenas para Engenheiro */}
            <motion.div 
              className="p-4 rounded-xl"
              style={{ 
                backgroundColor: isEngenheiro ? '#2D5A27' + '10' : '#e0e0e0',
                border: isEngenheiro ? '2px solid #2D5A27' : '2px solid #ccc',
              }}
              whileHover={isEngenheiro ? { scale: 1.01 } : {}}
            >
              <Label 
                htmlFor="limiteCritico"
                style={{ color: '#1a1a1a', fontWeight: '600', fontSize: '14px' }}
              >
                Limite Crítico de Umidade (%)
                {!isEngenheiro && (
                  <span className="text-xs ml-2" style={{ color: '#666666' }}>
                    (Apenas Engenheiro Agrônomo)
                  </span>
                )}
              </Label>
              <Input
                id="limiteCritico"
                type="number"
                value={limiteCritico}
                onChange={(e) => setLimiteCritico(e.target.value)}
                disabled={!isEngenheiro}
                required
                className="mt-2 h-12"
                min="0"
                max="100"
                style={{ 
                  backgroundColor: isEngenheiro ? '#ffffff' : '#f5f5f5',
                  borderRadius: '12px',
                }}
              />
              <p className="text-xs mt-2" style={{ color: '#666666' }}>
                Define o valor mínimo de umidade antes de alertas críticos
              </p>
            </motion.div>

            <div className="flex gap-3 pt-4">
              <motion.div 
                className="flex-1"
                whileHover={{ scale: 1.02 }}
                whileTap={{ scale: 0.98 }}
              >
                <Button
                  type="button"
                  variant="outline"
                  className="w-full h-12"
                  onClick={() => navigate(-1)}
                  disabled={loading}
                >
                  Cancelar
                </Button>
              </motion.div>
              <motion.div 
                className="flex-1"
                whileHover={{ scale: loading ? 1 : 1.02 }}
                whileTap={{ scale: loading ? 1 : 0.98 }}
              >
                <Button
                  type="submit"
                  className="w-full h-12 text-base"
                  disabled={loading}
                  style={{ 
                    backgroundColor: loading ? '#66BB6A' : '#2D5A27',
                    color: '#ffffff',
                    fontWeight: '700',
                    borderRadius: '12px',
                  }}
                >
                  {loading ? (
                    <span className="flex items-center gap-2">
                      <Loader2 size={20} className="animate-spin" />
                      Salvando...
                    </span>
                  ) : (
                    <span className="flex items-center gap-2">
                      <Save size={20} />
                      Salvar Talhão
                    </span>
                  )}
                </Button>
              </motion.div>
            </div>
          </motion.div>
        </form>
      </div>
    </div>
  );
}