import 'package:go_router/go_router.dart';

import 'screens/home_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/widgets_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/widgets',
      builder: (context, state) => const WidgetsShowcaseScreen(),
    ),
  ],
);
