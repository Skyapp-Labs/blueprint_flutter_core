import 'package:blueprint_flutter_core/src/modules/auth/core/enums/auth_status.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/auth_state.dart';

/// Handles auth-based route redirection.
///
/// Call from your GoRouter's [redirect] callback:
/// ```dart
/// redirect: (context, state) => AuthGuard.redirect(
///   authState: ref.read(authControllerProvider),
///   location: state.uri.toString(),
///   loginPath: '/login',
///   homePath: '/home',
///   splashPath: '/splash',   // optional
/// ),
/// ```
abstract final class FxAuthGuard {
  static String? redirect({
    required AuthState authState,
    required String location,
    required String loginPath,
    required String homePath,
  }) {
    final isLogin  = location == loginPath;

    switch (authState.status) {
      case AuthStatus.authenticating:
        return null;
      case AuthStatus.authenticated:
        return isLogin ? homePath : null;
      case AuthStatus.unauthenticated:
        return null;
      case AuthStatus.error:
        return null;
    }
  }
}