/// Shared foundation for Blueprint Flutter apps (networking, auth, theme, Fx widgets).
///
/// **Bootstrap** — config + root widget:
/// ```dart
/// import 'package:blueprint_flutter_core/blueprint_flutter_core.dart';
///
/// void main() {
///   WidgetsFlutterBinding.ensureInitialized();
///   runApp(BlueprintFlutterCore(config: MyAppConfig(), child: const MyApp()));
/// }
/// ```
///
/// **Grouped imports** (prefer these over deep `src/` paths):
/// | Library | Use for |
/// |---------|---------|
/// | `blueprint_foundation.dart` | Errors, pagination, JWT, logger, controller mixins |
/// | `blueprint_theme.dart` | Fx theme tokens, [ThemeController] |
/// | `blueprint_widgets.dart` | Fx widgets, [ScreenUtil], validators, formatters |
/// | `blueprint_network.dart` | Dio client, services, Firebase client, interceptors |
/// | `blueprint_auth.dart` | Auth flows, [AuthController], email/phone UI |
/// | `blueprint_notifications.dart` | Notifications |
/// | `blueprint_profile.dart` | Profile |
/// | `blueprint_all.dart` | Everything above (heavy; use for small apps / prototypes) |
library;

export 'src/core/config/app_config.dart';
export 'src/core/config/app_environment.dart';
export 'src/core/network/api_endpoints.dart';
export 'src/core/blueprint_flutter_core.dart';
