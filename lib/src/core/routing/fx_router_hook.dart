import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fx_router_hook.g.dart';

/// Optional redirect hook run after foundation auth and home-access guards.
typedef FxRouterRedirectHook = String? Function(Ref ref, GoRouterState state);

/// Override to add app-specific redirects after [FxRouterRedirect.resolve].
@Riverpod(keepAlive: true)
FxRouterRedirectHook? fxRouterRedirectHook(Ref ref) => null;
