import 'package:blueprint_flutter_core/src/core/utils/jwt_helper.dart';

/// Holds the access token in memory only — never persisted to disk.
///
/// The refresh token is handled separately in [AuthStorage].
class TokenManager {
  String? _accessToken;

  String? get accessToken => _accessToken;

  bool get hasToken => _accessToken != null && _accessToken!.isNotEmpty;

  /// True if there is no token or its JWT expiry claim has passed.
  bool get isExpired =>
    _accessToken == null || JwtHelper.isExpired(_accessToken!);

  void setToken(String token) => _accessToken = token;

  void clearToken() => _accessToken = null;
}
