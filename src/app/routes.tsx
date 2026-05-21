import { createBrowserRouter, Navigate } from 'react-router';
import LoginPage from './pages/login-page';
import DashboardPage from './pages/dashboard-page';
import FazendaDetailPage from './pages/fazenda-detail-page';
import TalhaoDetailPage from './pages/talhao-detail-page';
import NovoEventoPage from './pages/novo-evento-page';
import NovoTalhaoPage from './pages/novo-talhao-page';
import RelatoriosPage from './pages/relatorios-page';
import { useAuth } from './lib/auth-context';

function ProtectedRoute({ children }: { children: React.ReactNode }) {
  const { user } = useAuth();
  
  if (!user) {
    return <Navigate to="/login" replace />;
  }
  
  return <>{children}</>;
}

export const router = createBrowserRouter([
  {
    path: '/',
    element: <Navigate to="/login" replace />,
  },
  {
    path: '/login',
    element: <LoginPage />,
  },
  {
    path: '/dashboard',
    element: (
      <ProtectedRoute>
        <DashboardPage />
      </ProtectedRoute>
    ),
  },
  {
    path: '/fazenda/:id',
    element: (
      <ProtectedRoute>
        <FazendaDetailPage />
      </ProtectedRoute>
    ),
  },
  {
    path: '/talhao/:id',
    element: (
      <ProtectedRoute>
        <TalhaoDetailPage />
      </ProtectedRoute>
    ),
  },
  {
    path: '/talhao/:id/novo-evento',
    element: (
      <ProtectedRoute>
        <NovoEventoPage />
      </ProtectedRoute>
    ),
  },
  {
    path: '/fazenda/:id/novo-evento',
    element: (
      <ProtectedRoute>
        <NovoEventoPage />
      </ProtectedRoute>
    ),
  },
  {
    path: '/novo-talhao',
    element: (
      <ProtectedRoute>
        <NovoTalhaoPage />
      </ProtectedRoute>
    ),
  },
  {
    path: '/relatorios',
    element: (
      <ProtectedRoute>
        <RelatoriosPage />
      </ProtectedRoute>
    ),
  },
  {
    path: '*',
    element: <Navigate to="/login" replace />,
  },
]);
