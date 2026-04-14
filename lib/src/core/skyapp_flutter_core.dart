import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;

import 'package:skyapp_flutter_core/src/core/config/app_config.dart';

/// Root widget that wires [ProviderScope] with [appConfigProvider] for the
/// foundation layer.
///
/// ```dart
/// void main() {
///   WidgetsFlutterBinding.ensureInitialized();
///   runApp(
///     SkyappFlutterCore(
///       config: MyAppConfig(),
///       child: const MyApp(),
///     ),
///   );
/// }
/// ```
class SkyappFlutterCore extends StatelessWidget {
  const SkyappFlutterCore({
    super.key,
    required this.config,
    required this.child,
    this.overrides = const [],
    this.observers,
  });

  /// App-specific configuration (API base URL, auth method, feature flags, …).
  final AppConfig config;

  /// Your app widget tree (typically [MaterialApp] or [MaterialApp.router]).
  final Widget child;

  /// Extra [ProviderScope] overrides merged after [appConfigProvider].
  final List<Override> overrides;

  /// Optional Riverpod observers (logging, debugging).
  final List<ProviderObserver>? observers;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        appConfigProvider.overrideWithValue(config),
        ...overrides,
      ],
      observers: observers,
      child: child,
    );
  }
}
