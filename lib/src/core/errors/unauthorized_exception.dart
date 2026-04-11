import 'package:skyapp_flutter_core/src/core/errors/app_exception.dart';

/// Thrown when the access token has expired AND the refresh attempt also
/// failed (e.g. refresh token revoked, session expired).
///
/// Catching this exception should clear local auth state and redirect
/// the user to the login screen.
final class UnauthorizedException extends AppException {
  const UnauthorizedException([
    super.message = 'Session expired. Please log in again.',
  ]);
}
