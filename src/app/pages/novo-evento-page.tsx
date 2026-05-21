import React, { useState } from 'react';
import { useNavigate, useParams } from 'react-router';
import { ArrowLeft, Save, Droplets, Leaf, Tractor, WheatOff, Sprout, Loader2 } from 'lucide-react';
import { motion } from 'motion/react';
import { Button } from '../components/ui/button';
import { Input } from '../components/ui/input';
import { Label } from '../components/ui/label';
import { Textarea } from '../components/ui/textarea';

export default function NovoEventoPage() {
  const { id } = useParams();
  const navigate = useNavigate();
  const [tipo, setTipo] = useState('irrigacao');
  const [descricao, setDescricao] = useState('');
  const [quantidade, setQuantidade] = useState('');
  const [loading, setLoading] = useState(false);
  const [focusedField, setFocusedField] = useState<string | null>(null);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    
    // Simula salvamento
    await new Promise(resolve => setTimeout(resolve, 1500));
    
    setLoading(false);
    alert('Evento registrado com sucesso!');
    navigate(-1);
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
              Registrar Evento
            </h2>
            <p className="text-sm" style={{ color: '#666666' }}>
              Novo evento de manejo
            </p>
          </div>
        </div>
      </motion.div>

      <div className="p-4">
        <form onSubmit={handleSubmit}>
          <motion.div 
            className="p-6 rounded-2xl space-y-6 mb-5"
            style={{ 
              backgroundColor: '#ffffff',
              boxShadow: '0 4px 12px rgba(0, 0, 0, 0.08)',
            }}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.4, delay: 0.1 }}
          >
            <div>
              <Label 
                htmlFor="tipo"
                style={{ color: '#1a1a1a', fontWeight: '600', fontSize: '14px' }}
              >
                Tipo de Evento
              </Label>
              <select
                id="tipo"
                value={tipo}
                onChange={(e) => setTipo(e.target.value)}
                onFocus={() => setFocusedField('tipo')}
                onBlur={() => setFocusedField(null)}
                className="w-full mt-2 p-3 rounded-xl transition-all"
                style={{ 
                  backgroundColor: '#F9FAFB',
                  border: focusedField === 'tipo' ? '2px solid #2D5A27' : '2px solid #E5E7EB',
                }}
              >
                <option value="irrigacao">💧 Irrigação</option>
                <option value="adubacao">🌿 Adubação</option>
                <option value="aplicacao">🚜 Aplicação</option>
                <option value="colheita">🌾 Colheita</option>
                <option value="plantio">🌱 Plantio</option>
              </select>
            </div>

            <div>
              <Label 
                htmlFor="descricao"
                style={{ color: '#1a1a1a', fontWeight: '600', fontSize: '14px' }}
              >
                Descrição
              </Label>
              <Textarea
                id="descricao"
                value={descricao}
                onChange={(e) => setDescricao(e.target.value)}
                onFocus={() => setFocusedField('descricao')}
                onBlur={() => setFocusedField(null)}
                placeholder="Descreva o evento de manejo..."
                required
                className="mt-2 transition-all min-h-[100px]"
                rows={4}
                style={{ 
                  backgroundColor: '#F9FAFB',
                  border: focusedField === 'descricao' ? '2px solid #2D5A27' : '2px solid #E5E7EB',
                  borderRadius: '12px',
                }}
              />
            </div>

            <div>
              <Label 
                htmlFor="quantidade"
                style={{ color: '#1a1a1a', fontWeight: '600', fontSize: '14px' }}
              >
                Quantidade (opcional)
              </Label>
              <Input
                id="quantidade"
                value={quantidade}
                onChange={(e) => setQuantidade(e.target.value)}
                onFocus={() => setFocusedField('quantidade')}
                onBlur={() => setFocusedField(null)}
                placeholder="Ex: 20mm, 150kg/ha"
                className="mt-2 h-12 transition-all"
                style={{ 
                  backgroundColor: '#F9FAFB',
                  border: focusedField === 'quantidade' ? '2px solid #2D5A27' : '2px solid #E5E7EB',
                  borderRadius: '12px',
                }}
              />
            </div>

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
                    backgroundColor: loading ? '#795548' : '#4E342E',
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
                      Salvar
                    </span>
                  )}
                </Button>
              </motion.div>
            </div>
          </motion.div>
        </form>

        {/* Atalhos Rápidos */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.4, delay: 0.3 }}
        >
          <h3 className="mb-4 text-lg" style={{ color: '#1a1a1a', fontWeight: '600' }}>
            Atalhos Rápidos
          </h3>
          <div className="grid grid-cols-2 gap-3">
            {[
              { tipo: 'irrigacao', label: 'Irrigar', icon: <Droplets size={24} style={{ color: '#4E89DC' }} />, color: '#4E89DC' },
              { tipo: 'adubacao', label: 'Adubar', icon: <Leaf size={24} style={{ color: '#2D5A27' }} />, color: '#2D5A27' },
              { tipo: 'aplicacao', label: 'Aplicar', icon: <Tractor size={24} style={{ color: '#4E342E' }} />, color: '#4E342E' },
              { tipo: 'colheita', label: 'Colher', icon: <WheatOff size={24} style={{ color: '#FF8F00' }} />, color: '#FF8F00' },
            ].map((atalho, index) => (
              <motion.button
                key={atalho.tipo}
                type="button"
                onClick={() => {
                  setTipo(atalho.tipo);
                  window.scrollTo({ top: 0, behavior: 'smooth' });
                }}
                className="p-5 rounded-xl text-center"
                style={{ 
                  backgroundColor: '#ffffff',
                  boxShadow: '0 2px 8px rgba(0, 0, 0, 0.06)',
                }}
                initial={{ opacity: 0, scale: 0.9 }}
                animate={{ opacity: 1, scale: 1 }}
                transition={{ delay: 0.4 + index * 0.08 }}
                whileHover={{ 
                  scale: 1.05,
                  boxShadow: `0 8px 24px ${atalho.color}30`,
                }}
                whileTap={{ scale: 0.95 }}
              >
                <motion.div 
                  className="mb-3 flex items-center justify-center"
                  whileHover={{ rotate: 10, scale: 1.1 }}
                >
                  {atalho.icon}
                </motion.div>
                <div className="text-sm" style={{ color: '#1a1a1a', fontWeight: '600' }}>
                  {atalho.label}
                </div>
              </motion.button>
            ))}
          </div>
        </motion.div>
      </div>
    </div>
  );
}