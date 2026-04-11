/// Base class for all application exceptions.
///
/// Every error thrown by the foundation layer is an [AppException].
abstract class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => '$runtimeType: $message';
}
