import 'package:dio/dio.dart';

import 'package:blueprint_flutter_core/src/core/network/fx_api_endpoints.dart';
import 'package:blueprint_flutter_core/src/core/network/fx_service_context.dart';

abstract class FxService {
  FxService(FxServiceContext ctx)
    : dio = ctx.dio,
      endpoints = ctx.endpoints;

  final Dio dio;
  final FxApiEndpoints endpoints;
}
