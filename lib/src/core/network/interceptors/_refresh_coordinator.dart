part of 'fx_auth_interceptor.dart';

/// Manages the token refresh lifecycle.
///
/// Ensures only one refresh call is ever in-flight at a time. Concurrent
/// callers from [onRequest] wait on a shared [Completer]. Concurrent 401s
/// from [onError] are queued in [PendingRequestHandler] and replayed on
/// success.
class _RefreshCoordinator {
  _RefreshCoordinator({
    required Dio dio,
    required FxTokenManager tokenManager,
    required Future<bool> Function() onRefresh,
  })  : _dio = dio,
        _tokenManager = tokenManager,
        _onRefresh = onRefresh,
        _pending = _PendingRequestHandler();

  final Dio _dio;
  final FxTokenManager _tokenManager;
  final Future<bool> Function() _onRefresh;
  final _PendingRequestHandler _pending;

  bool _isRefreshing = false;
  Completer<bool>? _refreshCompleter;

  // ── Called from onRequest ─────────────────────────────────────────────────

  /// Proactive refresh. Deduplicates concurrent callers via a shared
  /// [Completer] so only one network call is made.
  Future<bool> ensureRefreshed() async {
    if (_isRefreshing && _refreshCompleter != null) {
      return _refreshCompleter!.future;
    }

    _isRefreshing = true;
    _refreshCompleter = Completer<bool>();
    try {
      final ok = await _onRefresh();
      _refreshCompleter!.complete(ok);

      if (ok && _pending.hasPending) {
        _pending.flush(_dio, _tokenManager.accessToken!);
      }

      return ok;
    } catch (_) {
      _refreshCompleter!.complete(false);
      return false;
    } finally {
      _isRefreshing = false;
      _refreshCompleter = null;
    }
  }

  // ── Called from onError ───────────────────────────────────────────────────

  /// Reactive 401 handler. Queues the request if already refreshing,
  /// otherwise starts a refresh and retries on success.
  Future<void> handleUnauthorized(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (_isRefreshing) {
      _pending.enqueue(err.requestOptions, handler);
      return;
    }

    _isRefreshing = true;
    _refreshCompleter = Completer<bool>();
    try {
      final refreshed = await _onRefresh();
      if (!refreshed) throw const _AuthFailure();

      final token = _tokenManager.accessToken!;
      _refreshCompleter!.complete(true);

      final response = await _PendingRequestHandler.retry(
        _dio, err.requestOptions, token,
      );
      _pending.flush(_dio, token);
      handler.resolve(response);
    } on DioException catch (e) {
      _refreshCompleter!.complete(false);
      _pending.drainWithError(err);
      handler.reject(
        FxErrorMapper.isNetworkError(e)
            ? FxErrorMapper.map(err)
            : FxErrorMapper.unauthorized(err.requestOptions),
      );
    } catch (_) {
      _refreshCompleter!.complete(false);
      _pending.drainWithError(err);
      handler.reject(FxErrorMapper.unauthorized(err.requestOptions));
    } finally {
      _isRefreshing = false;
      _refreshCompleter = null;
    }
  }
}

class _AuthFailure implements Exception {
  const _AuthFailure();
}
