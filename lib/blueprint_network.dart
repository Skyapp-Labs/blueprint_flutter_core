/// HTTP client, Dio, services, Firebase client, and networking utilities.
///
/// [ApiEndpoints] is exported from `blueprint_flutter_core.dart` with [AppConfig].
///
/// ```dart
/// import 'package:blueprint_flutter_core/blueprint_network.dart';
/// ```
library;

export 'src/core/network/api_client.dart';
export 'src/core/network/app_service.dart';
export 'src/core/network/firebase/firebase_client.dart';
export 'src/core/network/interceptors/auth_interceptor.dart';
export 'src/core/network/interceptors/error_interceptor.dart';
export 'src/core/network/interceptors/error_mapper.dart';
export 'src/core/network/interceptors/log_interceptor.dart';
export 'src/core/network/interceptors/pending_request_handler.dart';
export 'src/core/network/interceptors/refresh_coordinator.dart';
export 'src/core/network/network_providers.dart';
export 'src/core/network/service_context.dart';
export 'src/core/network/token_manager.dart';
