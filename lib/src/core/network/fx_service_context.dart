// foundation/core/network/service_context.dart
import 'package:dio/dio.dart';

import 'package:blueprint_flutter_core/src/core/network/fx_api_endpoints.dart';

class FxServiceContext {
  const FxServiceContext({required this.dio, required this.endpoints});

  final Dio dio;
  final FxApiEndpoints endpoints;
}
