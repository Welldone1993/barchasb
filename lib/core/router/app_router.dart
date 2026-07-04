import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/create_digital_ad/presentation/pages/create_digital_ad_screen.dart';
import '../../features/create_employer_ad/presentation/pages/create_employer_ad_screen.dart';
import '../../features/create_job_seeker_ad/presentation/pages/create_job_seeker_ad_screen.dart';
import '../../features/create_seller_ad/presentation/pages/create_seller_ad_screen.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/home/presentation/pages/home_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: '/create_employer_ad',
        builder: (context, state) => const EmployerAddJobScreen(),
      ),
      GoRoute(
        path: '/create_job_seeker_ad',
        builder: (context, state) => const JobSeekerAddJobScreen(),
      ),
      GoRoute(
        path: '/create_seller_ad',
        builder: (context, state) => const SellerAddScreen(),
      ),
      GoRoute(
        path: '/create_digital_ad',
        builder: (context, state) => const DigitalAddScreen(),
      ),
    ],
  );
}
