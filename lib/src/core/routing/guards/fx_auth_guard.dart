import 'package:blueprint_flutter_core/src/core/routing/fx_routing_config.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/states/auth_state.dart';

/// Handles auth-based route redirection.
///
/// Call from your GoRouter's [redirect] callback:
/// ```dart
/// redirect: (context, state) => AuthGuard.redirect(
///   authState: ref.read(authControllerProvider),
///   location: state.uri.toString(),
///   loginPath: '/login',
///   homePath: '/home',
/// ),
/// ```
abstract final class FxAuthGuard {
  static String? redirect({
    required String location,
    required AuthState authState,
    required FxRoutingConfig routingConfig,
  }) {
    final status = authState.status;
    final isAuthRoute = routingConfig.authPaths.contains(location);
    final isAuthenticated = status == AuthStatus.authenticated;

    // Always allow splash to resolve itself
    if (location == routingConfig.splashPath) return null;

    // While the session is being restored or an auth action is in flight,
    // hold position — do not redirect. This prevents a bounce to login
    // when token refresh is slower than the initial navigation.
    if (status == AuthStatus.authenticating) return null;

    // Authenticated users should not be on login
    // if (isAuthenticated && isAuthRoute) return dashboardPath;

    // Unauthenticated users cannot access protected routes
    if ((!isAuthenticated && !isAuthRoute) && routingConfig.authPaths.isNotEmpty) {
      return routingConfig.authPaths.first;
    }

    return null;
  }
}
