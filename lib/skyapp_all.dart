/// Single import for apps that want the full public surface (larger analysis scope).
///
/// Prefer narrower libraries (`skyapp_widgets.dart`, `skyapp_auth.dart`, …) when possible.
///
/// ```dart
/// import 'package:skyapp_flutter_core/skyapp_all.dart';
/// ```
library;

export 'skyapp_auth.dart';
export 'skyapp_flutter_core.dart';
export 'skyapp_foundation.dart';
export 'skyapp_network.dart';
export 'skyapp_notifications.dart';
export 'skyapp_profile.dart';
export 'skyapp_theme.dart';
export 'skyapp_widgets.dart';
