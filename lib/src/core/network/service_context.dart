// foundation/core/network/service_context.dart
import 'package:dio/dio.dart';

import 'package:skyapp_flutter_core/src/core/network/api_endpoints.dart';

class ServiceContext {
  const ServiceContext({required this.dio, required this.endpoints});

  final Dio dio;
  final ApiEndpoints endpoints;
}
