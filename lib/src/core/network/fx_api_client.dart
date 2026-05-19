import 'package:blueprint_flutter_core/src/core/network/interceptors/fx_headers_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:blueprint_flutter_core/src/core/config/fx_config.dart';
import 'package:blueprint_flutter_core/src/core/network/interceptors/fx_auth_interceptor.dart';
import 'package:blueprint_flutter_core/src/core/network/interceptors/fx_log_interceptor.dart';
import 'package:blueprint_flutter_core/src/core/network/fx_token_manager.dart';

/// Configured Dio HTTP client used by all foundation services.
///
/// Base URL is built from [FxConfig.apiBaseUrl] + [FxConfig.apiVersion].
/// All interceptors are registered here.
class FxApiClient {
  FxApiClient._();

  static Dio create({
    required FxConfig config,
    required FxTokenManager tokenManager,
    required Future<bool> Function() onUnauthorized,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: '${config.apiBaseUrl}/${config.apiVersion}',
        connectTimeout: Duration(milliseconds: config.connectTimeoutMs),
        receiveTimeout: Duration(milliseconds: config.receiveTimeoutMs),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      FxHeadersInterceptor(config),
      FxLogInterceptor(),
      FxAuthInterceptor(
        dio: dio,
        tokenManager: tokenManager,
        onRefresh: onUnauthorized,
        publicEndpoints: config.endpoints.publicEndpoints,
      )
    ]);

    return dio;
  }
}
