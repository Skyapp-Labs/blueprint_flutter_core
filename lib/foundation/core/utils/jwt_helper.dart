import 'package:jwt_decoder/jwt_decoder.dart';

/// Decodes a JWT access token to expose user claims.
///
/// Per the API spec the payload contains:
/// sub, phoneNumber, email, fullName, countryCode, permissions[], iat, exp
abstract final class JwtHelper {
  /// Returns the decoded payload map. Returns null if the token is invalid.
  static Map<String, dynamic>? decode(String token) {
    try {
      return JwtDecoder.decode(token);
    } catch (_) {
      return null;
    }
  }

  static String? userId(String token) => decode(token)?['sub'] as String?;

  static String? email(String token) => decode(token)?['email'] as String?;

  static String? fullName(String token) =>
      decode(token)?['fullName'] as String?;

  static String? phoneNumber(String token) =>
      decode(token)?['phoneNumber'] as String?;

  static String? countryCode(String token) =>
      decode(token)?['countryCode'] as String?;

  static List<String> permissions(String token) {
    final raw = decode(token)?['permissions'];
    if (raw is List) return raw.cast<String>();
    return [];
  }

  static bool hasPermission(String token, String permission) =>
      permissions(token).contains(permission);

  static bool isExpired(String token) {
    try {
      return JwtDecoder.isExpired(token);
    } catch (_) {
      return true;
    }
  }

  static DateTime? expiresAt(String token) {
    try {
      return JwtDecoder.getExpirationDate(token);
    } catch (_) {
      return null;
    }
  }
}
