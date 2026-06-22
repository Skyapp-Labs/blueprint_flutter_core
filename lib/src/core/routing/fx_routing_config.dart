/// App route paths used by [FxAuthGuard], [FxHomeAccessGuard], and [fxRouterProvider].
class FxRoutingConfig {
  const FxRoutingConfig({
    required this.splashPath,
    required this.loginPath,
    required this.homePath,
    this.authPaths = const [],
    this.pinUnlockPath,
    this.postRegistrationPath,
  });

  /// Path to the splash screen.
  final String splashPath;
  /// Path to the login screen.
  final String loginPath;
  /// Path to the home screen.
  final String homePath;
  /// Path to redirect to after successful login to verify PIN.
  /// e.g '/home/unlock' - null = no pin to after auth
  final String? pinUnlockPath;
  /// Path to redirect to after successful registration.
  /// e.g. '/home/onboarding' — null = no extra step
  final String? postRegistrationPath;
  /// Paths that are considered authentication routes 
  /// (e.g. login, registration, etc.).
  final List<String> authPaths;
}
