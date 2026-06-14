import 'package:example/modules/notification/screens/notification_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:blueprint_flutter_core/blueprint_flutter_core.dart';

import 'package:example/routes/app_paths.dart';

import 'package:example/modules/auth/screens/auth_screen.dart';
import 'package:example/modules/dashboard/screens/dashboard_screen.dart';
import 'package:example/modules/splash/presentation/screens/splash_screen.dart';

// ─────────────────────────────────────────────
// DEV ZONE — Add your routes here.
// Add a constant to app_paths.dart, then add a GoRoute entry below.
// No build step required.
// ─────────────────────────────────────────────

List<RouteBase> appRoutes(FxConfig config) => [
  GoRoute(
    path: AppPaths.splash,
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(
    path: AppPaths.login,
    builder: (context, state) => const AuthScreen(),
  ),


  GoRoute(
    path: AppPaths.home,
    builder: (context, state) => DashboardScreen(),
    routes: [
      GoRoute(
        path: AppPaths.notifications.replaceAll(AppPaths.home, ''),
        builder: (context, state) => const NotificationScreen(),
      ),
    ],
  ),
];
