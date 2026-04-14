import 'package:dio/dio.dart';
import 'package:blueprint_flutter_core/src/core/errors/api_error_response.dart';
import 'package:blueprint_flutter_core/src/core/errors/network_exception.dart';
import 'package:blueprint_flutter_core/src/core/errors/unauthorized_exception.dart';

/// Maps raw [DioException]s into typed [NetworkException] or
/// [UnauthorizedException] errors that the rest of the app can handle.
abstract final class ErrorMapper {
  static bool isNetworkError(DioException e) =>
    e.type == DioExceptionType.connectionTimeout ||
    e.type == DioExceptionType.receiveTimeout ||
    e.type == DioExceptionType.connectionError ||
    e.type == DioExceptionType.sendTimeout;

  static DioException map(DioException err) {
    final statusCode = err.response?.statusCode;

    try {
      final data = err.response?.data;
      if (data is Map<String, dynamic>) {
        final apiError = ApiErrorResponse.fromJson(data);
        return DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          error: NetworkException(
            message: apiError.message,
            statusCode: statusCode,
            requestId: apiError.requestId,
          ),
        );
      }
    } catch (_) {}

    final message = isNetworkError(err)
      ? 'No internet connection or request timed out.'
      : 'An unexpected error occurred.';

    return DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      error: NetworkException(message: message, statusCode: statusCode),
    );
  }

  static DioException unauthorized(RequestOptions options) => DioException(
    requestOptions: options,
    error: const UnauthorizedException(),
  );
}
