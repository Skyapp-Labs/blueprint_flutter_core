import 'dart:async';

import 'package:blueprint_flutter_core/src/core/errors/api_error_response.dart';
import 'package:blueprint_flutter_core/src/core/errors/network_exception.dart';
import 'package:dio/dio.dart';
import 'package:blueprint_flutter_core/src/core/network/fx_token_manager.dart';
import 'package:blueprint_flutter_core/src/core/errors/unauthorized_exception.dart';

part './_error_mapper.dart';
part './_refresh_coordinator.dart';
part './_pending_request_handler.dart';

/// Injects Bearer tokens and handles auth failures for all outgoing requests.
///
/// Delegates refresh coordination to [RefreshCoordinator] and error mapping
/// to [ErrorMapper]. Public endpoints bypass both paths entirely.
/// [skipRefreshEndpoints] never trigger proactive or reactive token refresh
/// (e.g. logout must not re-authenticate before signing out).
class FxAuthInterceptor extends Interceptor {
  FxAuthInterceptor({
    required Dio dio,
    required FxTokenManager tokenManager,
    required Future<bool> Function() onRefresh,
    List<String> publicEndpoints = const []
  })  : _tokenManager = tokenManager,
        _normalizedPublicPaths = publicEndpoints
            .map(FxAuthInterceptor.normalizePath)
            .toSet(),
        _coordinator = _RefreshCoordinator(
          dio: dio,
          tokenManager: tokenManager,
          onRefresh: onRefresh,
        );

  final FxTokenManager _tokenManager;
  final _RefreshCoordinator _coordinator;
  final Set<String> _normalizedPublicPaths;

  /// Normalizes an API path for reliable endpoint matching.
  static String normalizePath(String path) {
    var normalized = path.trim();
    if (normalized.isEmpty) return '/';

    if (normalized.contains('://')) {
      normalized = Uri.parse(normalized).path;
    }

    if (!normalized.startsWith('/')) {
      normalized = '/$normalized';
    }

    while (normalized.length > 1 && normalized.endsWith('/')) {
      normalized = normalized.substring(0, normalized.length - 1);
    }

    return normalized;
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_isPublic(options)) return handler.next(options);

    if (_tokenManager.isExpired) {
      final ok = await _coordinator.ensureRefreshed();
      if (!ok) {
        return handler.reject(DioException(
          requestOptions: options,
          error: const UnauthorizedException(),
        ));
      }
    }

    if (_tokenManager.hasToken) {
      options.headers['Authorization'] =
          'Bearer ${_tokenManager.accessToken}';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final is401 = err.response?.statusCode == 401;

    if (!is401 || _isPublic(err.requestOptions)) {
      return handler.reject(FxErrorMapper.map(err));
    }

    await _coordinator.handleUnauthorized(err, handler);
  }

  bool _isPublic(RequestOptions options) {
    final rawPath = options.path;
    return _normalizedPublicPaths.contains(normalizePath(rawPath));
  }
}
