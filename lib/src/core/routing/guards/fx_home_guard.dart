import 'package:blueprint_flutter_core/src/core/config/fx_config.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/states/auth_state.dart';

/// Redirect middleware for home/dashboard routes behind optional access gates.
///
/// Compose with [FxAuthGuard] in GoRouter's [redirect]:
/// ```dart
/// redirect: (_, state) {
///   final auth = FxAuthGuard.redirect(...);
///   if (auth != null) return auth;
///   return FxHomeAccessGuard.redirect(
///     config: config,
///     location: state.uri.path,
///     homePath: AppPaths.home,
///     accessState: ref.read(homeAccessControllerProvider),
///     steps: ref.read(fxHomeAccessStepsProvider),
///   );
/// },
/// ```
abstract final class FxHomeGuard {
  static String? redirect({
    required String location,
    required FxConfig config,
    required AuthState authState,
    required bool isPinSessionUnlocked, // from SecurityController
  }) {
    if (!authState.isAuthenticated || authState.user == null) return null;

    final routing = config.routing;
    final path = _normalizePath(location);
    final homePath = _normalizePath(routing.homePath);

    if (!_isUnderHome(path, homePath)) return null;

    final user = authState.user!;
    final pinPath = routing.pinUnlockPath;
    final postRegPath = routing.postRegistrationPath;

    // 1) Post-registration (user-backed)
    if (postRegPath != null && !config.isPostRegistrationComplete(user)) {
      final gate = _normalizePath(postRegPath);
      if (path == gate || path.startsWith('$gate/')) return null;
      return gate;
    }

    // If user finished onboarding but is still on that screen → send home
    if (postRegPath != null &&
        config.isPostRegistrationComplete(user) &&
        _matches(path, postRegPath)) {
      return homePath;
    }

    // 2) PIN (session-backed)
    if (pinPath != null && !isPinSessionUnlocked) {
      final gate = _normalizePath(pinPath);
      if (path == gate || path.startsWith('$gate/')) return null;
      return gate;
    }

    // If PIN verified but still on unlock screen → send home
    if (pinPath != null &&
        isPinSessionUnlocked &&
        _matches(path, pinPath)) {
      return homePath;
    }

    return null;
  }

  static String _normalizePath(String location) {
    final uri = Uri.tryParse(location);
    final path = uri?.path ?? location;
    if (path.length > 1 && path.endsWith('/')) {
      return path.substring(0, path.length - 1);
    }
    return path;
  }

  static bool _isUnderHome(
    String path,
    String homePath
  ) {
    final normalizedHome = _normalizePath(homePath);
    if (path == normalizedHome || path.startsWith('$normalizedHome/')) {
      return true;
    }
    return false;
  }

  static bool _matches(String path, String targetPath) {
    return path == targetPath || path.startsWith('$targetPath/');
  }
}
