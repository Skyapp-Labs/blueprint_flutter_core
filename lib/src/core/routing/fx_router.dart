import 'package:blueprint_flutter_core/src/core/config/fx_config.dart';
import 'package:blueprint_flutter_core/src/core/routing/fx_app_routes.dart';
import 'package:blueprint_flutter_core/src/core/routing/fx_route_observer.dart';
import 'package:blueprint_flutter_core/src/core/routing/fx_router_notifier.dart';
import 'package:blueprint_flutter_core/src/core/routing/fx_router_redirect.dart';
import 'package:blueprint_flutter_core/src/modules/auth/auth_controller.dart';
import 'package:blueprint_flutter_core/src/modules/security/security_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fx_router.g.dart';

/// Foundation [GoRouter] with auth and home-access listeners and redirects.
///
/// Apps supply routes via [fxAppRoutesProvider] and optional hooks via
/// [fxExtraHomeAccessStepsProvider] / [fxRouterRedirectHookProvider].
@Riverpod(keepAlive: true)
GoRouter fxRouter(Ref ref) {
  final notifier = FxRouterNotifier();
  final routing = ref.read(fxConfigProvider).routing;

  ref.listen(authControllerProvider, (_, _) => notifier.notify());
  ref.listen(securityControllerProvider, (_, _) => notifier.notify());

  final router = GoRouter(
    initialLocation: routing.splashPath,
    refreshListenable: notifier,
    redirect: (_, state) => FxRouterRedirect.resolve(ref, state),
    observers: [FxRouteObserver()],
    routes: ref.read(fxAppRoutesProvider),
  );

  ref.onDispose(() {
    notifier.dispose();
    router.dispose();
  });

  return router;
}
