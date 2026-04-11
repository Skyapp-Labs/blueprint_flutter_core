import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import 'package:skyapp_flutter_core/src/modules/auth/core/controllers/auth_controller.dart';
import 'package:skyapp_flutter_core/src/core/config/app_config.dart';
import 'package:skyapp_flutter_core/src/core/network/service_context.dart';

part 'network_providers.g.dart';

/// The shared authenticated [Dio] instance, owned by [AuthController].
@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  return ref.watch(authControllerProvider.notifier).dio;
}

/// Bundles [Dio] + [ApiEndpoints] for use in all [AppService] subclasses.
@Riverpod(keepAlive: true)
ServiceContext serviceContext(Ref ref) => ServiceContext(
  dio: ref.watch(dioProvider),
  endpoints: ref.watch(appConfigProvider).endpoints,
);
