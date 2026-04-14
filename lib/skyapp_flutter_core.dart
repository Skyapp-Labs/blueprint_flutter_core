/// Shared foundation for Skyapp Flutter apps (networking, auth, theme, Fx widgets).
///
/// **Bootstrap** — config + root widget:
/// ```dart
/// import 'package:skyapp_flutter_core/skyapp_flutter_core.dart';
///
/// void main() {
///   WidgetsFlutterBinding.ensureInitialized();
///   runApp(SkyappFlutterCore(config: MyAppConfig(), child: const MyApp()));
/// }
/// ```
///
/// **Grouped imports** (prefer these over deep `src/` paths):
/// | Library | Use for |
/// |---------|---------|
/// | `skyapp_foundation.dart` | Errors, pagination, JWT, logger, controller mixins |
/// | `skyapp_theme.dart` | Fx theme tokens, [ThemeController] |
/// | `skyapp_widgets.dart` | Fx widgets, [ScreenUtil], validators, formatters |
/// | `skyapp_network.dart` | Dio client, services, Firebase client, interceptors |
/// | `skyapp_auth.dart` | Auth flows, [AuthController], email/phone UI |
/// | `skyapp_notifications.dart` | Notifications |
/// | `skyapp_profile.dart` | Profile |
/// | `skyapp_all.dart` | Everything above (heavy; use for small apps / prototypes) |
library;

export 'src/core/config/app_config.dart';
export 'src/core/config/app_environment.dart';
export 'src/core/network/api_endpoints.dart';
export 'src/core/skyapp_flutter_core.dart';
