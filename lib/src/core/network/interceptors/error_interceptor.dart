import 'package:dio/dio.dart';
import 'package:blueprint_flutter_core/src/core/errors/api_error_response.dart';
import 'package:blueprint_flutter_core/src/core/errors/network_exception.dart';
import 'package:blueprint_flutter_core/src/core/errors/unauthorized_exception.dart';
import 'package:blueprint_flutter_core/src/core/network/token_manager.dart';

/// Handles 401 responses by attempting a token refresh then retrying
/// the original request once. If the refresh also fails, throws
/// [UnauthorizedException] which the auth controller listens to.
///
/// Public endpoints (login, register, refresh, etc.) are excluded from the
/// refresh-and-retry dance — their 401s are passed through as-is so callers
/// receive the server's actual error message.
class ErrorInterceptor extends Interceptor {
  ErrorInterceptor(
    this._dio,
    this._tokenManager,
    this._onUnauthorized, {
    this.publicEndpoints = const [],
  });

  final Dio _dio;
  final TokenManager _tokenManager;
  final Future<bool> Function() _onUnauthorized;
  final List<String> publicEndpoints;

  bool _isRefreshing = false;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    final isPublic = publicEndpoints.any((p) => err.requestOptions.path.endsWith(p));

    if (statusCode == 401 && !_isRefreshing && !isPublic) {
      // Prevent re-entrant refresh loops
      _isRefreshing = true;
      try {
        final refreshed = await _onUnauthorized();
        if (refreshed) {
          // Retry original request with new token
          final opts = err.requestOptions;
          opts.headers['Authorization'] = 'Bearer ${_tokenManager.accessToken}';
          final response = await _dio.fetch(opts);
          _isRefreshing = false;
          return handler.resolve(response);
        }
      } catch (_) {
        // Refresh failed — fall through to UnauthorizedException
      }
      _isRefreshing = false;
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: const UnauthorizedException(),
        ),
      );
    }

    handler.reject(_mapToDioException(err));
  }

  DioException _mapToDioException(DioException err) {
    final statusCode = err.response?.statusCode;
    String message = 'An unexpected error occurred.';

    try {
      final data = err.response?.data;
      if (data is Map<String, dynamic>) {
        final apiError = ApiErrorResponse.fromJson(data);
        message = apiError.message;
        return DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          error: NetworkException(
            message: message,
            statusCode: statusCode,
            requestId: apiError.requestId,
          ),
        );
      }
    } catch (_) {
      // JSON parse failed, use generic message
    }

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError) {
      message = 'No internet connection or request timed out.';
    }

    return DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      error: NetworkException(message: message, statusCode: statusCode),
    );
  }
}
