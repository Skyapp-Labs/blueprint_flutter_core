import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/src/core/utils/logger.dart';

/// Route observer that logs navigation events via [FxLogger].
/// Pass to GoRouter's [observers] list.
class FxRouteObserver extends RouteObserver<Route<dynamic>> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    FxLogger.d('→ Navigated to: ${route.settings.name} from ${previousRoute?.settings.name ?? 'N/A'}');
  }
}