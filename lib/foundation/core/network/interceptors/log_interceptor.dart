import 'package:dio/dio.dart';
import '../../errors/api_error_response.dart';
import '../../utils/logger.dart';

/// Logs all requests and responses in development/staging.
/// Silenced automatically in production via [FxLogger].
class LogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    FxLogger.d(
      '${options.method} → ${options.uri}\n'
      'Headers → ${options.headers}\n'
      'Body → ${options.data}',
    );
    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    FxLogger.d(
      '${response.statusCode} → ${response.requestOptions.uri}\n'
      'Body → ${response.data}',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    try {
      final data = err.response?.data;
      if (data is Map<String, dynamic>) {
        final apiError = ApiErrorResponse.fromJson(data);
        FxLogger.e(
          '${err.requestOptions.method} → ${err.requestOptions.uri}\n'
          '${apiError.message}'
        );
      } else {
        FxLogger.e('${err.requestOptions.method} → ${err.requestOptions.uri}\n'
          '${err.response?.statusCode} → ${err.response?.data}\n'
          '${err.message}'
        );
      }
    } catch (_) {
      FxLogger.e(
        '${err.requestOptions.method} → ${err.requestOptions.uri}\n'
        '${err.message}',
        err,
      );
    }
    handler.next(err);
  }
}
