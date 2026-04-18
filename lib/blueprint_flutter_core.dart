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
/// | `blueprint_flutter_core.dart` | Config, environment, endpoints, errors, pagination, JWT, logger, [FxControllerMixin], [BlueprintFlutterCore] |
/// | `blueprint_theme.dart` | Fx theme tokens, [ThemeController] |
/// | `blueprint_widgets.dart` | Fx widgets, [ScreenUtil], validators, formatters |
/// | `blueprint_network.dart` | Dio client, services, Firebase client, interceptors |
/// | `blueprint_auth.dart` | Auth flows, [AuthController], email/phone UI |
/// | `blueprint_notifications.dart` | Notifications |
/// | `blueprint_profile.dart` | Profile |
library;

export 'src/core/config/app_config.dart';
export 'src/core/config/app_environment.dart';
export 'src/core/network/api_endpoints.dart';

export 'src/core/blueprint_flutter_core.dart';

export 'src/core/controllers/fx_controller_mixin.dart';

export 'src/core/errors/api_error_response.dart';
export 'src/core/errors/app_exception.dart';
export 'src/core/errors/network_exception.dart';
export 'src/core/errors/unauthorized_exception.dart';

export 'src/core/models/file_ref.dart';
export 'src/core/models/paginated_response.dart';
export 'src/core/models/pagination_meta.dart';

export 'src/core/utils/jwt_helper.dart';
export 'src/core/utils/logger.dart';
