import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fx_app_routes.g.dart';

/// App route tree supplied by the host application.
///
/// Override in [BlueprintFlutterCore.overrides]:
/// ```dart
/// fxAppRoutesProvider.overrideWith(
///   (ref) => appRoutes(ref.read(fxConfigProvider)),
/// ),
/// ```
@Riverpod(keepAlive: true)
List<RouteBase> fxAppRoutes(Ref ref) {
  throw UnimplementedError(
    'Override fxAppRoutesProvider with your app route tree.',
  );
}
