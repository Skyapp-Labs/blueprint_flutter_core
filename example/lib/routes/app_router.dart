import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:blueprint_flutter_core/blueprint_flutter_core.dart';
import 'package:blueprint_flutter_core/blueprint_auth.dart';

import 'package:example/routes/app_paths.dart';
import 'package:example/routes/app_routes.dart';

part 'app_router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final notifier = FxRouterNotifier();
  ref.listen(authControllerProvider, (_, _) => notifier.notify());

  final router = GoRouter(
    initialLocation: AppPaths.splash,
    refreshListenable: notifier,
    redirect: (_, state) => FxAuthGuard.redirect(
      initialPath: AppPaths.splash,
      dashboardPath: AppPaths.home,
      authPaths: [AppPaths.login],
      authState: ref.read(authControllerProvider),
      location: state.uri.toString(),
    ),
    observers: [FxRouteObserver()],
    routes: appRoutes(ref.read(fxConfigProvider)),
  );

  ref.onDispose(() {
    notifier.dispose();
    router.dispose();
  });

  return router;
}
