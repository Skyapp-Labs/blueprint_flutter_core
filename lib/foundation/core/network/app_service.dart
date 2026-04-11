import 'package:dio/dio.dart';

import 'api_endpoints.dart';
import 'service_context.dart';

abstract class AppService {
  AppService(ServiceContext ctx)
    : dio = ctx.dio,
      endpoints = ctx.endpoints;

  final Dio dio;
  final ApiEndpoints endpoints;
}
