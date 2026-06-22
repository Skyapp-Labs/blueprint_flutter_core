import 'package:blueprint_flutter_core/src/core/config/fx_config.dart';
import 'package:blueprint_flutter_core/src/core/routing/guards/fx_auth_guard.dart';
import 'package:blueprint_flutter_core/src/core/routing/guards/fx_home_guard.dart';
import 'package:blueprint_flutter_core/src/core/routing/fx_router_hook.dart';
import 'package:blueprint_flutter_core/src/modules/auth/auth_controller.dart';
import 'package:blueprint_flutter_core/src/modules/security/security_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

abstract final class FxRouterRedirect {
  static String? resolve(Ref ref, GoRouterState state) {
    final config = ref.read(fxConfigProvider);
    final routing = config.routing;

    final authState = ref.read(authControllerProvider); 
    final securityState = ref.read(securityControllerProvider);

    final authRedirect = FxAuthGuard.redirect(
      authState: authState,
      location: state.uri.toString(),
      routingConfig: routing,
    );
    if (authRedirect != null) return authRedirect;

    final homeRedirect = FxHomeGuard.redirect(
      config: config,
      location: state.uri.path,
      authState: authState,
      isPinSessionUnlocked: securityState.isSessionUnlocked,
    );

    if (homeRedirect != null) return homeRedirect;

    // Optional app extension
    return ref.read(fxRouterRedirectHookProvider)?.call(ref, state);
  }
}