/// Single import for apps that want the full public surface (larger analysis scope).
///
/// Prefer narrower libraries (`blueprint_widgets.dart`, `blueprint_auth.dart`, …) when possible.
///
/// ```dart
/// import 'package:blueprint_flutter_core/blueprint_all.dart';
/// ```
library;

export 'blueprint_auth.dart';
export 'blueprint_flutter_core.dart';
export 'blueprint_foundation.dart';
export 'blueprint_network.dart';
export 'blueprint_notifications.dart';
export 'blueprint_profile.dart';
export 'blueprint_theme.dart';
export 'blueprint_widgets.dart';
