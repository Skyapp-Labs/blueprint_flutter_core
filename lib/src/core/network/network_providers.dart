import 'package:blueprint_flutter_core/src/modules/auth/auth_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import 'package:blueprint_flutter_core/src/core/config/fx_config.dart';
import 'package:blueprint_flutter_core/src/core/network/fx_service_context.dart';

export 'fx_result.dart';

part 'network_providers.g.dart';

/// The shared authenticated [Dio] instance, owned by [AuthController].
@Riverpod(keepAlive: true)
Dio fxDio(Ref ref) {
  return ref.watch(authControllerProvider.notifier).dio;
}

/// Bundles [Dio] + [ApiEndpoints] for use in all [AppService] subclasses.
@Riverpod(keepAlive: true)
FxServiceContext fxService(Ref ref) => FxServiceContext(
  dio: ref.watch(fxDioProvider),
  endpoints: ref.watch(fxConfigProvider).endpoints,
);
