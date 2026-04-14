import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/src/core/errors/network_exception.dart';
import 'package:blueprint_flutter_core/src/core/errors/unauthorized_exception.dart';
import 'package:blueprint_flutter_core/src/core/network/network_providers.dart';
import 'package:blueprint_flutter_core/src/core/network/service_context.dart';
import 'package:blueprint_flutter_core/src/core/config/app_config.dart';

part 'fx_state.dart';

mixin FxControllerMixin {
  Ref get ref; // satisfied automatically by all Riverpod notifiers

  /// Shorthand for the shared service context (dio + endpoints).
  ServiceContext get serviceContext => ref.read(serviceContextProvider);

  /// Shorthand for the app config.
  AppConfig get config => ref.read(appConfigProvider);

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
