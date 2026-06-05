import 'package:blueprint_flutter_core/src/modules/auth/core/models/entities/user.dart';
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

  static User getUserFromToken(String token) {
    final user = decode(token)?['user'] as Map<String, dynamic>?;
    if (user == null) throw Exception('User not found in token');
    user['roles'] = roles(token);
    return User.fromJson(user);
  }

  static List<String> roles(String token) {
    try {
      final raw = decode(token)?['roles'] as List<dynamic>?;
      if (raw is List) return raw.cast<String>();
      return [];
    } catch (_) {
      return [];
    }
  }
  
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
