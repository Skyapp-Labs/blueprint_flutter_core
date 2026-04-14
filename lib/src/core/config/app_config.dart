import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:blueprint_flutter_core/src/modules/auth/core/enums/auth_method.dart';
import 'package:blueprint_flutter_core/src/core/network/api_endpoints.dart';
import 'package:blueprint_flutter_core/src/core/config/app_environment.dart';

part 'app_config.g.dart';

/// Blueprint contract for app-level configuration.
///
/// Implement this in [app/config/app_config.dart] and never edit this file.
/// Every field here is read by the foundation layer — changes to your
/// implementation are picked up automatically.
abstract class AppConfig {
  /// Human-readable app name shown in the UI.
  String get appName;

  /// The current deployment environment.
  AppEnvironment get environment => AppEnvironment.current;

  /// Whether the app is running in the staging environment.
	bool get isStaging => environment.isStaging;

  /// Whether the app is running in the production environment.
	bool get isProduction => environment.isProduction;

  /// Whether the app is running in the development environment.
	bool get isDevelopment => environment.isDevelopment;

  /// Base URL for all REST API calls, without trailing slash.
  /// Example: 'https://api.myapp.com'
  String get apiBaseUrl;

  /// API version segment appended to every request path.
  /// Example: 'v1'  → calls become https://api.myapp.com/v1/...
  String get apiVersion;

  /// API endpoint paths. Override in app config to add
  /// app-specific endpoints or change defaults.
  ApiEndpoints get endpoints => const ApiEndpoints();

  /// Controls which auth flow is active across the entire app.
  /// Set to [AuthMethod.phone] or [AuthMethod.email].
  AuthMethod get authMethod;

  /// Whether to initialise Firebase. Set false to skip Firebase entirely.
  bool get enableFirebase;

  /// Whether to register the device for push notifications on login.
  bool get enableNotifications;

  /// Connection timeout in milliseconds for API requests.
  int get connectTimeoutMs => 30000;

  /// Receive timeout in milliseconds for API requests.
  int get receiveTimeoutMs => 30000;

  /// Initial country code for phone input
  String get initialCountryCode => 'NG';

  /// Favorite countries for phone input picker
  List<String> get favoriteCountries => ['NG', 'US', 'CA', 'GB', 'Uk', 'IN'];
}

/// Override in main.dart with your [AppConfig] implementation.
@Riverpod(keepAlive: true)
AppConfig appConfig(Ref ref) {
  throw UnimplementedError(
    'appConfigProvider must be overridden in main.dart.',
  );
}
