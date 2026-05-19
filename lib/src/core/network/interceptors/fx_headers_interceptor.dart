import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:blueprint_flutter_core/src/core/config/fx_config.dart';

/// Key for [RequestOptions.extra] / [Options.extra] to send `Idempotency-Key`.
///
/// Use the same value when retrying the same logical operation.
class FxRequestExtras {
  FxRequestExtras._();

  static const String idempotencyKey = 'idempotencyKey';
}

/// Adds enterprise-oriented headers on every outbound request.
///
/// Generates fresh `X-Request-Id`, `X-Correlation-Id`, and `X-Client-Trace-Id`
/// per HTTP call. Set [FxRequestExtras.idempotencyKey] in [Options.extra] when
/// the backend expects an idempotency token for mutating calls.
class FxHeadersInterceptor extends Interceptor {
  FxHeadersInterceptor(this._config);

  final FxConfig _config;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final traceId = _uuidV4();
    options.headers['X-Request-Id'] = traceId;
    options.headers['X-Correlation-Id'] = traceId;
    options.headers['X-Client-Trace-Id'] = traceId;

    options.headers['Accept-Language'] =
        PlatformDispatcher.instance.locale.toLanguageTag();

    final ua = _config.apiUserAgent ?? _defaultUserAgent(_config);
    options.headers['User-Agent'] = ua;

    options.headers['X-API-Version'] = _config.apiVersion;
    options.headers['X-Environment'] = _config.environment.name;

    final tenant = _config.tenantId;
    if (tenant != null && tenant.isNotEmpty) {
      options.headers['X-Tenant-Id'] = tenant;
    }

    final org = _config.orgId;
    if (org != null && org.isNotEmpty) {
      options.headers['X-Org-Id'] = org;
    }

    final idem = options.extra[FxRequestExtras.idempotencyKey];
    if (idem is String && idem.isNotEmpty) {
      options.headers['Idempotency-Key'] = idem;
    }

    handler.next(options);
  }
}

String _defaultUserAgent(FxConfig config) {
  final version = config.clientVersion;
  final verSeg = (version != null && version.isNotEmpty) ? version : config.apiVersion;
  return '${config.appName}/$verSeg (Flutter; ${defaultTargetPlatform.name}; ${config.environment.name})';
}

String _uuidV4() {
  final random = Random.secure();
  final bytes = List<int>.generate(16, (_) => random.nextInt(256));
  bytes[6] = (bytes[6] & 0x0f) | 0x40;
  bytes[8] = (bytes[8] & 0x3f) | 0x80;

  const hex = '0123456789abcdef';
  String two(int b) => '${hex[b >> 4]}${hex[b & 0x0f]}';

  return '${two(bytes[0])}${two(bytes[1])}${two(bytes[2])}${two(bytes[3])}-'
      '${two(bytes[4])}${two(bytes[5])}-'
      '${two(bytes[6])}${two(bytes[7])}-'
      '${two(bytes[8])}${two(bytes[9])}-'
      '${two(bytes[10])}${two(bytes[11])}${two(bytes[12])}${two(bytes[13])}${two(bytes[14])}${two(bytes[15])}';
}
