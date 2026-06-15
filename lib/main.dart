import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'core/services/auth_service.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/dashboard/screens/dashboard_screen.dart';
import 'features/fazenda/screens/fazendas_screen.dart';
import 'features/talhao/screens/talhoes_screen.dart';
import 'features/evento/screens/eventos_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializar serviços
  // await initializeServices();
  
  runApp(
    const ProviderScope(
      child: DeFuloApp(),
    ),
  );
}

class DeFuloApp extends ConsumerWidget {
  const DeFuloApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Monitorar estado de autenticação
    final authState = ref.watch(authStateProvider);
    
    return MaterialApp(
      title: 'DeFulo - Gestão de Inteligência Rural',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.light,
      home: authState.when(
        loading: () => const _SplashScreen(),
        error: (err, stack) => _ErrorScreen(error: err.toString()),
        data: (user) => user != null 
          ? const MainTabScreen() 
          : const LoginScreen(),
      ),
    );
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppTheme.primaryGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
                Icons.agriculture,
                size: 56,
                color: AppTheme.primaryGreen,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'DeFulo',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryGreen,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Gestão de Inteligência Rural',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryGreen),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorScreen extends StatelessWidget {
  final String error;

  const _ErrorScreen({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 24),
              const Text(
                'Erro ao Inicializar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                error,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Reiniciar app
                },
                child: const Text('Tentar Novamente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Tela principal com abas
class MainTabScreen extends StatefulWidget {
  const MainTabScreen({Key? key}) : super(key: key);

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city_outlined),
            activeIcon: Icon(Icons.location_city),
            label: 'Fazendas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.agriculture_outlined),
            activeIcon: Icon(Icons.agriculture),
            label: 'Talhões',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_outlined),
            activeIcon: Icon(Icons.event),
            label: 'Eventos',
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return switch (_selectedIndex) {
      0 => const DashboardScreen(),
      1 => const FazendasScreen(),
      2 => const TalhoesScreen(),
      3 => const EventosScreen(),
      _ => const DashboardScreen(),
    };
  }
}
