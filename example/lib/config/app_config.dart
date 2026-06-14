import 'package:blueprint_flutter_core/blueprint_flutter_core.dart';

class MyAppConfig extends FxConfig {
  @override
  String get appName => 'Blueprint Example';

  @override
  String get apiBaseUrl => 'https://jsonplaceholder.typicode.com'; // Dummy URL

  @override
  String get apiVersion => 'v1';

  @override
  bool get enableFirebase => false;

  @override
  bool get enableNotifications => false;
}
