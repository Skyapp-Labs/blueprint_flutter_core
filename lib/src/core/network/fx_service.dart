import 'package:dio/dio.dart';

import 'package:blueprint_flutter_core/src/core/network/fx_error.dart';
import 'package:blueprint_flutter_core/src/core/network/fx_result.dart';
import 'package:blueprint_flutter_core/src/core/network/fx_api_endpoints.dart';
import 'package:blueprint_flutter_core/src/core/network/fx_service_context.dart';

import 'package:blueprint_flutter_core/src/core/errors/network_exception.dart';
import 'package:blueprint_flutter_core/src/core/errors/unauthorized_exception.dart';

export 'fx_error.dart';
export 'fx_result.dart';
export 'fx_service_context.dart';

typedef FxResponse<T> = Future<FxResult<T>>;

abstract class FxService {
  FxService(FxServiceContext context)
      : dio = context.dio,
        endpoints = context.endpoints;

  final Dio dio;
  final FxApiEndpoints endpoints;

  FxResponse<T> execute<T>(Future<T> Function() request) async {
    try {
      final result = await request();

      return FxResult.success(result);
    } on DioException catch (e) {
      return FxResult.failure(_mapDioException(e));
    } catch (e) {
      return FxResult.failure(FxError(message: e.toString()));
    }
  }

  FxError _mapDioException(DioException exception) {
    final error = exception.error;

    if (error is NetworkException) {
      return FxError(message: error.message);
    }

    if (error is UnauthorizedException) {
      return FxError(message: error.message);
    }

    return FxError(
      message: 'An unexpected error occurred.',
      statusCode: exception.response?.statusCode,
    );
  }
}