import 'package:blueprint_flutter_core_example/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:blueprint_flutter_core_example/screens/auth_screen.dart';
import 'package:blueprint_flutter_core_example/screens/home_screen.dart';
import 'package:blueprint_flutter_core_example/screens/widgets_screen.dart';

import 'package:blueprint_flutter_core/blueprint_flutter_core.dart';
import 'package:blueprint_flutter_core/blueprint_auth.dart';

part 'router.g.dart';

abstract final class AppPaths {
  static const splash = '/';
  static const login  = '/auth';
  static const home   = '/home';
}

@riverpod
GoRouter router(Ref ref) {
  final notifier = FxRouterNotifier();
  ref.listen(authControllerProvider, (_, _) => notifier.notify());

  final router = GoRouter(
    initialLocation: AppPaths.splash,
    refreshListenable: notifier,
    redirect: (_, state) => AuthGuard.redirect(
      authState: ref.read(authControllerProvider),
      location: state.uri.toString(),
      loginPath: AppPaths.login,
      homePath: AppPaths.home,
    ),
    observers: [FxRouteObserver()],
    routes: [
      GoRoute(path: AppPaths.splash, builder: (_, _) => SplashScreen()),
      GoRoute(path: AppPaths.login,  builder: (_, _) => const AuthScreen()),
      GoRoute(path: AppPaths.home,   builder: (_, _) => HomeScreen()),
      GoRoute(path: '/widgets',      builder: (_, _) => const WidgetsShowcaseScreen()),
    ]
  );

  ref.onDispose(() {
    notifier.dispose();
    router.dispose();
  });

  return router;
}

