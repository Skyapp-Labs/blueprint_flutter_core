import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user.dart';

/// Persists the refresh token and user profile to secure storage.
///
/// The access token is NEVER persisted — it lives in [TokenManager] in memory,
/// obtained fresh via a token refresh on the first protected request.
class AuthStorage {
  AuthStorage() : _storage = const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  static const _refreshTokenKey = 'fx_refresh_token';
  static const _userKey         = 'fx_user';

  // ── Refresh token ──────────────────────────────────────────────────────────

  Future<void> saveRefreshToken(String token) =>
      _storage.write(key: _refreshTokenKey, value: token);

  Future<String?> getRefreshToken() =>
      _storage.read(key: _refreshTokenKey);

  // ── User profile ───────────────────────────────────────────────────────────

  Future<void> saveUser(AuthUser user) =>
      _storage.write(key: _userKey, value: jsonEncode(user.toJson()));

  Future<AuthUser?> getUser() async {
    final raw = await _storage.read(key: _userKey);
    if (raw == null) return null;
    try {
      return AuthUser.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  // ── Clear ──────────────────────────────────────────────────────────────────

  Future<void> clearAll() => _storage.deleteAll();
}
