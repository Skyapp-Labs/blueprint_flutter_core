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
abstract final class AuthGuard {
  static String? redirect({
    required AuthState authState,
    required String location,
    required String loginPath,
    required String homePath,
    String splashPath = '/splash',
    List<String> publicPaths = const ['/splash', '/login'],
  }) {
    final isSplash = location == splashPath;
    final isLogin  = location == loginPath;
    final isPublic = publicPaths.contains(location);

    switch (authState.status) {
      case AuthStatus.authenticating:
        return isPublic ? null : splashPath;
      case AuthStatus.authenticated:
        return (isSplash || isLogin) ? homePath : null;
      case AuthStatus.unauthenticated:
        return isPublic ? null : loginPath;
      case AuthStatus.error:
        return isLogin ? null : loginPath;
    }
  }
}