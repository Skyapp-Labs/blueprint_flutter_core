import 'package:blueprint_flutter_core/blueprint_flutter_core.dart';
import 'package:blueprint_flutter_core/blueprint_auth.dart';
import 'package:blueprint_flutter_core_example/config/api_endpoints.dart';

/// Concrete app configuration for the example.
///
/// In a real app, you might have multiple configs for dev/staging/prod.
class AppConfig extends FxConfig {
  AppConfig();

  @override
  String get appName => 'Blueprint Example';

  @override
  Environment get environment => Environment.development;

  @override
  String get apiBaseUrl => 'https://api-blueprint-qshw.onrender.com/';

  @override
  String get apiVersion => 'api/v1';

  @override
  AuthMethod get authMethod => AuthMethod.phone;

  @override
  bool get enableFirebase => false;

  @override
  bool get enableNotifications => false;
  
  @override
  int get connectTimeoutMs => 3000000;
  
  @override
  int get receiveTimeoutMs => 3000000;

  @override
  String get initialCountryCode => 'US';

  @override
  List<String> get favoriteCountries => ['US', 'GB', 'CA', 'NG', 'IN'];

  @override
  FxApiEndpoints get endpoints => const ApiEndpoints();
}
