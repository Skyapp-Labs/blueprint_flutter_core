import 'package:blueprint_flutter_core/blueprint_auth.dart' show User;
import 'package:blueprint_flutter_core/blueprint_flutter_core.dart';

import 'package:example/routes/app_paths.dart';

class AppConfig extends FxConfig {
  @override
  String get appName => 'Blueprint Example';

  @override
  String get apiBaseUrl => 'https://goatskin-balance-eliminate.ngrok-free.dev'; // Dummy URL

  @override
  String get apiVersion => 'api/v1';

  @override
  bool get enableFirebase => false;

  @override
  bool get enableNotifications => false;

  @override
  FxRoutingConfig get routing => const FxRoutingConfig(
    splashPath: AppPaths.splash,
    loginPath: AppPaths.login,
    homePath: AppPaths.home,
    authPaths: [AppPaths.login],
    pinUnlockPath: AppPaths.homeUnlock,
    // postRegistrationPath: AppPaths.homeOnboarding,
  );

  @override
  bool isPostRegistrationComplete(User user) => user.onboardingStep >= 2;
}
