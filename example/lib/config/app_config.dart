import 'package:blueprint_flutter_core/blueprint_flutter_core.dart';

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
}
