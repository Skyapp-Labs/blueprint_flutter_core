import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_response.freezed.dart';
part 'api_error_response.g.dart';

/// Maps the server's standard error JSON shape:
/// { "statusCode": 401, "message": "...", "error": "Unauthorized", "requestId": "uuid" }
@freezed
abstract class ApiErrorResponse with _$ApiErrorResponse {
  const factory ApiErrorResponse({
    required int statusCode,
    required String message,
    required String error,
    String? requestId,
  }) = _ApiErrorResponse;

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorResponseFromJson(json);
}
