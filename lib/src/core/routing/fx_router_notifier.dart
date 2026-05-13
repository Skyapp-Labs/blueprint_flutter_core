import 'package:flutter/foundation.dart';

/// Bridges Riverpod state changes to GoRouter's [refreshListenable].
/// Use this in your app's router provider to react to auth state changes.
///
/// ```dart
/// @riverpod
/// GoRouter router(Ref ref) {
///   final notifier = FxRouterNotifier();
///   ref.listen(authControllerProvider, (_, __) => notifier.notify());
///   ref.onDispose(notifier.dispose);
///   return GoRouter(refreshListenable: notifier, ...);
/// }
/// ```
class FxRouterNotifier extends ChangeNotifier {
  void notify() => notifyListeners();
}