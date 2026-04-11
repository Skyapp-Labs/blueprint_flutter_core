import 'package:dio/dio.dart';
import 'package:skyapp_flutter_core/src/core/config/app_config.dart';
import 'package:skyapp_flutter_core/src/core/network/interceptors/auth_interceptor.dart';
// import 'interceptors/error_interceptor.dart';
import 'package:skyapp_flutter_core/src/core/network/interceptors/log_interceptor.dart' as bp;
import 'package:skyapp_flutter_core/src/core/network/token_manager.dart';

/// Configured Dio HTTP client used by all foundation services.
///
/// Base URL is built from [AppConfig.apiBaseUrl] + [AppConfig.apiVersion].
/// All interceptors are registered here.
class ApiClient {
  ApiClient._();

  static Dio create({
    required AppConfig config,
    required TokenManager tokenManager,
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
      bp.LogInterceptor(),
      AuthInterceptor(
        dio: dio,
        tokenManager: tokenManager,
        onRefresh: onUnauthorized,
        publicEndpoints: config.endpoints.publicEndpoints,
      ),
      // ErrorInterceptor(
      //   dio,
      //   tokenManager,
      //   onUnauthorized,
      //   publicEndpoints: config.endpoints.publicEndpoints,
      // ),
    ]);

    return dio;
  }
}
