import 'package:blueprint_flutter_core/blueprint_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_controller.g.dart';

enum NavigationTarget {
  home,
  login
}

// ─────────────────────────────────────────────
// DEV ZONE — Add splash initialisation logic here.
// e.g. minimum display duration, asset preloading,
// remote config fetching, feature flag loading.
// The screen handles navigation via ref.listen on splashControllerProvider.
// ─────────────────────────────────────────────
@riverpod
class SplashController extends _$SplashController {
  @override
  Future<NavigationTarget?> build() async {
    // Run minimum display time and session restore in parallel.
    // The session restore may involve a network call (token refresh), so we
    // wait for auth to fully settle rather than using a fixed delay — this
    // prevents a race where a slow refresh finishes after the splash ends and
    // the user is incorrectly sent to login.
    await Future.wait([
      Future.delayed(const Duration(milliseconds: 1500)),
      _waitForAuthToSettle(),
    ]);

    final authStatus = ref.read(authControllerProvider).status;

    return switch (authStatus) {
      AuthStatus.authenticated => NavigationTarget.home,
      _ => NavigationTarget.login,
    };
  }

  /// Polls auth state until it leaves the [AuthStatus.authenticating] state.
  /// Resolves immediately if auth is already settled.
  Future<void> _waitForAuthToSettle() async {
    const pollInterval = Duration(milliseconds: 100);
    const maxWait = Duration(seconds: 10);
    var elapsed = Duration.zero;

    while (elapsed < maxWait) {
      final status = ref.read(authControllerProvider).status;
      if (status != AuthStatus.authenticating) return;
      await Future.delayed(pollInterval);
      elapsed += pollInterval;
    }
  }

  /// Whether the minimum display time has elapsed.
  bool get isReady =>
      ref.read(splashControllerProvider).hasValue;

  /// Convenience: exposes auth status for the screen if needed.
  AuthStatus get authStatus =>
      ref.read(authControllerProvider).status;
}
