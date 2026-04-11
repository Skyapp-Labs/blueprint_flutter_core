import 'package:skyapp_flutter_core/src/core/errors/app_exception.dart';

/// Thrown when a network/HTTP request fails.
///
/// [statusCode] is null for connectivity errors (no internet, timeout, etc.).
final class NetworkException extends AppException {
  const NetworkException({
    required String message,
    this.statusCode,
    this.requestId,
  }) : super(message);

  final int? statusCode;
  final String? requestId;

  bool get isNotFound => statusCode == 404;
  bool get isConflict => statusCode == 409;
  bool get isValidationError => statusCode == 400;
  bool get isServerError => statusCode != null && statusCode! >= 500;
  bool get isRateLimited => statusCode == 429;
  bool get isConnectivityError => statusCode == null;
}
