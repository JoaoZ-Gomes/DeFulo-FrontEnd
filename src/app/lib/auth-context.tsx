import React, { createContext, useContext, useState, ReactNode, useEffect } from 'react';
import api from './api';

export type UserRole = 'gestor' | 'prefeitura' | 'produtor' | 'rtv' | 'engenheiro';

export interface User {
  id: string;
  name: string;
  email: string;
  role: UserRole;
}

interface AuthContextType {
  user: User | null;
  login: (email: string, password: string) => Promise<boolean>;
  logout: () => void;
  loading: boolean;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);

  // Recuperar sessão ao carregar a página
  useEffect(() => {
    const savedUser = localStorage.getItem('defulo_user');
    if (savedUser) {
      setUser(JSON.parse(savedUser));
    }
    setLoading(false);
  }, []);

  const login = async (email: string, password: string): Promise<boolean> => {
    try {
      const response = await api.post('/auth/login', { email, senha: password });
      const { token, id, nome, email: userEmail, perfil } = response.data;

      const newUser: User = {
        id: id.toString(),
        name: nome,
        email: userEmail,
        role: perfil.toLowerCase() as UserRole,
      };

      localStorage.setItem('defulo_token', token);
      localStorage.setItem('defulo_user', JSON.stringify(newUser));
      setUser(newUser);
      
      return true;
    } catch (error) {
      console.error('Login failed:', error);
      return false;
    }
  };

  const logout = () => {
    localStorage.removeItem('defulo_token');
    localStorage.removeItem('defulo_user');
    setUser(null);
  };

  return (
    <AuthContext.Provider value={{ user, login, logout, loading }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
}
