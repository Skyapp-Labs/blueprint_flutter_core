import 'package:dio/dio.dart';

/// Stores requests that arrived while a token refresh was in progress
/// and either retries or rejects them once the refresh settles.
class PendingRequestHandler {
  final List<_PendingRequest> _queue = [];

  bool get hasPending => _queue.isNotEmpty;

  /// Adds a request to the queue to be retried after a refresh completes.
  void enqueue(RequestOptions options, ErrorInterceptorHandler handler) {
    _queue.add(_PendingRequest(options, handler));
  }

  /// Retries all queued requests with the new [token].
  void flush(Dio dio, String token) {
    final pending = List.of(_queue);
    _queue.clear();
    for (final req in pending) {
      retry(dio, req.options, token).then(
        req.handler.resolve,
        onError: (e) => req.handler.reject(e as DioException),
      );
    }
  }

  /// Rejects all queued requests with the given [error].
  void drainWithError(DioException error) {
    final pending = List.of(_queue);
    _queue.clear();
    for (final req in pending) {
      req.handler.reject(DioException(
        requestOptions: req.options,
        error: error.error,
        type: error.type,
        response: error.response,
      ));
    }
  }

  /// Retries a single request with the given [token] using [dio.fetch],
  /// which bypasses the interceptor chain to avoid re-entrance.
  static Future<Response<dynamic>> retry(
    Dio dio,
    RequestOptions options,
    String token,
  ) {
    options.headers['Authorization'] = 'Bearer $token';
    return dio.fetch(options);
  }
}

class _PendingRequest {
  const _PendingRequest(this.options, this.handler);
  final RequestOptions options;
  final ErrorInterceptorHandler handler;
}
