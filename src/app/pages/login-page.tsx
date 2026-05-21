import React, { useState } from 'react';
import { useNavigate } from 'react-router';
import { Eye, EyeOff, Mail, Lock, Loader2, CheckCircle2, AlertCircle } from 'lucide-react';
import { motion, AnimatePresence } from 'motion/react';
import { Button } from '../components/ui/button';
import { Input } from '../components/ui/input';
import { Label } from '../components/ui/label';
import { useAuth } from '../lib/auth-context';
import logoImage from 'figma:asset/82d3cbfaf0ddec72a45c912d27694f99df1e1b13.png';

export default function LoginPage() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [showPassword, setShowPassword] = useState(false);
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const [focusedField, setFocusedField] = useState<string | null>(null);
  const navigate = useNavigate();
  const { login } = useAuth();

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setLoading(true);

    const success = await login(email, password);

    if (success) {
      navigate('/dashboard');
    } else {
      setError('Email ou senha inválidos. Use senha "demo" para testar.');
    }

    setLoading(false);
  };

  return (
    <div
      className="min-h-screen flex items-center justify-center px-6 py-12"
      style={{
        backgroundColor: '#F5F5F5',
        backgroundImage: 'radial-gradient(circle at 20% 80%, rgba(45, 90, 39, 0.03) 0%, transparent 50%), radial-gradient(circle at 80% 20%, rgba(78, 52, 46, 0.03) 0%, transparent 50%)',
      }}
    >
      <motion.div
        className="w-full max-w-md"
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
      >
        {/* Logo e Header */}
        <motion.div
          className="flex flex-col items-center mb-10"
          initial={{ opacity: 0, scale: 0.95 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ duration: 0.6, delay: 0.1 }}
        >
          <motion.div
            whileHover={{ scale: 1.05, rotate: 5 }}
            transition={{ type: "spring", stiffness: 300 }}
          >
            <img
              src={logoImage}
              alt="DeFulo Logo"
              className="w-20 h-20 mb-5 drop-shadow-lg"
            />
          </motion.div>
          <h1
            className="text-3xl text-center mb-2"
            style={{
              color: '#2D5A27',
              fontWeight: '800',
              letterSpacing: '-0.02em',
            }}
          >
            DeFulo
          </h1>
          <p className="text-base text-center" style={{ color: '#666666', fontWeight: '500' }}>
            Gestão de Inteligência Rural
          </p>
        </motion.div>

        {/* Card de Login Premium */}
        <motion.div
          className="p-8 rounded-2xl"
          style={{
            backgroundColor: '#ffffff',
            boxShadow: '0 20px 60px rgba(0, 0, 0, 0.08), 0 8px 24px rgba(0, 0, 0, 0.04)',
          }}
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, delay: 0.2 }}
        >
          <form onSubmit={handleSubmit} className="space-y-6">
            {/* Campo Email */}
            <div>
              <Label
                htmlFor="email"
                style={{
                  color: '#1a1a1a',
                  fontWeight: '600',
                  fontSize: '14px',
                }}
              >
                E-mail
              </Label>
              <motion.div
                className="relative mt-2"
                animate={{
                  scale: focusedField === 'email' ? 1.01 : 1,
                }}
                transition={{ duration: 0.2 }}
              >
                <div
                  className="absolute left-4 top-1/2 -translate-y-1/2 pointer-events-none"
                  style={{ color: focusedField === 'email' ? '#2D5A27' : '#999999' }}
                >
                  <Mail size={20} />
                </div>
                <Input
                  id="email"
                  type="email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  onFocus={() => setFocusedField('email')}
                  onBlur={() => setFocusedField(null)}
                  placeholder="seu@email.com"
                  required
                  className="h-14 pl-12 pr-4 text-base transition-all"
                  style={{
                    backgroundColor: '#F9FAFB',
                    border: focusedField === 'email' ? '2px solid #2D5A27' : '2px solid #E5E7EB',
                    borderRadius: '12px',
                  }}
                />
              </motion.div>
            </div>

            {/* Campo Senha */}
            <div>
              <Label
                htmlFor="password"
                style={{
                  color: '#1a1a1a',
                  fontWeight: '600',
                  fontSize: '14px',
                }}
              >
                Senha
              </Label>
              <motion.div
                className="relative mt-2"
                animate={{
                  scale: focusedField === 'password' ? 1.01 : 1,
                }}
                transition={{ duration: 0.2 }}
              >
                <div
                  className="absolute left-4 top-1/2 -translate-y-1/2 pointer-events-none"
                  style={{ color: focusedField === 'password' ? '#2D5A27' : '#999999' }}
                >
                  <Lock size={20} />
                </div>
                <Input
                  id="password"
                  type={showPassword ? 'text' : 'password'}
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  onFocus={() => setFocusedField('password')}
                  onBlur={() => setFocusedField(null)}
                  placeholder="••••••••"
                  required
                  className="h-14 pl-12 pr-14 text-base transition-all"
                  style={{
                    backgroundColor: '#F9FAFB',
                    border: focusedField === 'password' ? '2px solid #2D5A27' : '2px solid #E5E7EB',
                    borderRadius: '12px',
                  }}
                />
                <motion.button
                  type="button"
                  onClick={() => setShowPassword(!showPassword)}
                  className="absolute right-4 top-1/2 -translate-y-1/2 p-1"
                  style={{ color: '#666666' }}
                  whileHover={{ scale: 1.1 }}
                  whileTap={{ scale: 0.95 }}
                >
                  {showPassword ? <EyeOff size={20} /> : <Eye size={20} />}
                </motion.button>
              </motion.div>
            </div>

            {/* Mensagem de Erro com Animação */}
            <AnimatePresence mode="wait">
              {error && (
                <motion.div
                  className="flex items-start gap-3 p-4 rounded-xl"
                  style={{
                    backgroundColor: '#FEF2F2',
                    border: '1px solid #FCA5A5',
                  }}
                  initial={{ opacity: 0, height: 0, marginTop: 0 }}
                  animate={{ opacity: 1, height: 'auto', marginTop: '1.5rem' }}
                  exit={{ opacity: 0, height: 0, marginTop: 0 }}
                  transition={{ duration: 0.3 }}
                >
                  <AlertCircle size={20} style={{ color: '#C62828', flexShrink: 0 }} />
                  <p className="text-sm" style={{ color: '#C62828' }}>
                    {error}
                  </p>
                </motion.div>
              )}
            </AnimatePresence>

            {/* Botão de Login */}
            <motion.div
              whileHover={{ scale: loading ? 1 : 1.02 }}
              whileTap={{ scale: loading ? 1 : 0.98 }}
            >
              <Button
                type="submit"
                className="w-full h-14 text-base transition-all"
                disabled={loading}
                style={{
                  backgroundColor: loading ? '#66BB6A' : '#2D5A27',
                  color: '#ffffff',
                  fontWeight: '700',
                  borderRadius: '12px',
                  boxShadow: loading ? 'none' : '0 4px 12px rgba(45, 90, 39, 0.3)',
                }}
              >
                {loading ? (
                  <span className="flex items-center gap-2">
                    <Loader2 size={20} className="animate-spin" />
                    Entrando...
                  </span>
                ) : (
                  <span className="flex items-center gap-2">
                    Entrar
                    <CheckCircle2 size={20} />
                  </span>
                )}
              </Button>
            </motion.div>

            {/* Link Esqueci Senha */}
            <motion.button
              type="button"
              className="text-sm w-full text-center py-2"
              style={{ color: '#2D5A27', fontWeight: '600' }}
              whileHover={{ scale: 1.02 }}
              whileTap={{ scale: 0.98 }}
            >
              Esqueci minha senha
            </motion.button>
          </form>

          {/* Divider */}
          <div className="relative my-8">
            <div className="absolute inset-0 flex items-center">
              <div className="w-full border-t" style={{ borderColor: '#E5E7EB' }}></div>
            </div>
            <div className="relative flex justify-center text-xs uppercase">
              <span className="px-2 bg-white" style={{ color: '#999999', fontWeight: '600' }}>
                Perfis de Teste
              </span>
            </div>
          </div>

          {/* Dicas de Login Premium */}
          <motion.div
            className="space-y-2"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ delay: 0.5 }}
          >
            {[
              { email: 'gestor@defulo.com', role: 'Gestor', desc: 'Visão Macro', color: '#2D5A27' },
              { email: 'produtor@defulo.com', role: 'Produtor', desc: 'Visão Micro', color: '#4E342E' },
              { email: 'rtv@defulo.com', role: 'RTV', desc: 'Técnico de Campo', color: '#FF8F00' },
              { email: 'eng@defulo.com', role: 'Engenheiro', desc: 'Agrônomo', color: '#66BB6A' },
            ].map((profile, index) => (
              <motion.button
                key={profile.email}
                type="button"
                onClick={() => {
                  setEmail(profile.email);
                  setPassword('demo');
                }}
                className="w-full p-3 rounded-xl text-left transition-all"
                style={{
                  backgroundColor: '#F9FAFB',
                  border: '1px solid #E5E7EB',
                }}
                whileHover={{
                  backgroundColor: '#ffffff',
                  borderColor: profile.color,
                  x: 4,
                }}
                initial={{ opacity: 0, x: -20 }}
                animate={{ opacity: 1, x: 0 }}
                transition={{ delay: 0.6 + index * 0.1 }}
              >
                <div className="flex items-center justify-between">
                  <div className="flex-1">
                    <div className="flex items-center gap-2 mb-1">
                      <span
                        className="w-2 h-2 rounded-full"
                        style={{ backgroundColor: profile.color }}
                      ></span>
                      <span className="text-sm" style={{ color: '#1a1a1a', fontWeight: '600' }}>
                        {profile.role}
                      </span>
                    </div>
                    <div className="text-xs" style={{ color: '#666666' }}>
                      {profile.email}
                    </div>
                  </div>
                  <div
                    className="text-xs px-2 py-1 rounded-full"
                    style={{
                      backgroundColor: profile.color + '15',
                      color: profile.color,
                      fontWeight: '600',
                    }}
                  >
                    {profile.desc}
                  </div>
                </div>
              </motion.button>
            ))}
          </motion.div>

          {/* Nota de Senha */}
          <motion.div
            className="mt-6 p-3 rounded-xl text-center"
            style={{
              backgroundColor: '#F0F9FF',
              border: '1px solid #BAE6FD',
            }}
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ delay: 0.8 }}
          >
            <p className="text-xs" style={{ color: '#0369A1', fontWeight: '500' }}>
              💡 Use a senha <strong>"demo"</strong> para todos os perfis
            </p>
          </motion.div>
        </motion.div>
      </motion.div>
    </div>
  );
}