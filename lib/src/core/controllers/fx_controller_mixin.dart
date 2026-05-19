import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/src/core/errors/network_exception.dart';
import 'package:blueprint_flutter_core/src/core/errors/unauthorized_exception.dart';
import 'package:blueprint_flutter_core/src/core/network/network_providers.dart';
import 'package:blueprint_flutter_core/src/core/network/fx_service_context.dart';
import 'package:blueprint_flutter_core/src/core/config/fx_config.dart';

mixin FxControllerMixin {
  Ref get ref; // satisfied automatically by all Riverpod notifiers

  /// Shorthand for the shared service context (dio + endpoints).
  FxServiceContext get serviceContext => ref.read(fxServiceProvider);

  /// Shorthand for the app config.
  FxConfig get config => ref.read(fxConfigProvider);

  /// Converts a caught exception into a user-facing message.
  String resolveError(Object e) {
    if (e is DioException) {
      final err = e.error;
      if (err is NetworkException) return err.message;
      if (err is UnauthorizedException) return err.message;
      return e.message ?? 'An unexpected error occurred.';
    }
    return 'An unexpected error occurred.';
  }
}
