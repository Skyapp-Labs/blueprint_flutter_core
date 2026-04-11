import 'package:dio/dio.dart';

import 'package:skyapp_flutter_core/src/core/network/api_endpoints.dart';
import 'package:skyapp_flutter_core/src/core/network/service_context.dart';

abstract class AppService {
  AppService(ServiceContext ctx)
    : dio = ctx.dio,
      endpoints = ctx.endpoints;

  final Dio dio;
  final ApiEndpoints endpoints;
}
