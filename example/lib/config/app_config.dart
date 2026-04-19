import 'package:blueprint_flutter_core/blueprint_flutter_core.dart';
import 'package:blueprint_flutter_core/blueprint_auth.dart';

/// Concrete app configuration for the example.
///
/// In a real app, you might have multiple configs for dev/staging/prod.
class ExampleAppConfig extends AppConfig {
  ExampleAppConfig();

  @override
  String get appName => 'Blueprint Example';

  @override
  AppEnvironment get environment => AppEnvironment.development;

  @override
  String get apiBaseUrl => 'https://api.example.com';

  @override
  String get apiVersion => 'v1';

  @override
  AuthMethod get authMethod => AuthMethod.email;

  @override
  bool get enableFirebase => false;

  @override
  bool get enableNotifications => false;

  @override
  String get initialCountryCode => 'US';

  @override
  List<String> get favoriteCountries => ['US', 'GB', 'CA', 'NG', 'IN'];
}
