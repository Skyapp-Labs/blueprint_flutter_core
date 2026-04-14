import 'package:blueprint_flutter_core/src/core/network/app_service.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/auth_tokens.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/session.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/user.dart';

/// Handles all shared /auth/* and /users/* API calls.
class AuthService extends AppService {
  AuthService(super.ctx);

  // --- Register (both flows) ---
  Future<AuthTokens> register(Map<String, dynamic> body) async {
    body.removeWhere((key, value) => value == null || value == '');
    final res = await dio.post<Map<String, dynamic>>(
      endpoints.register,
      data: body,
    );
    return AuthTokens.fromJson(res.data!);
  }

  // --- Token refresh ---
  Future<AuthTokens> refresh(String refreshToken) async {
    final res = await dio.post<Map<String, dynamic>>(
      endpoints.refresh,
      data: {'refreshToken': refreshToken},
    );
    return AuthTokens.fromJson(res.data!);
  }

  // --- Logout ---
  Future<void> logout() async {
    await dio.post<dynamic>(endpoints.logout);
  }

  // --- Account management ---
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    await dio.post<dynamic>(
      endpoints.changePassword,
      data: {'currentPassword': currentPassword, 'newPassword': newPassword},
    );
  }

  Future<Map<String, dynamic>> requestAccountDeletion() async {
    final res = await dio.post<Map<String, dynamic>>(
      endpoints.deleteRequest,
    );
    return res.data!;
  }

  Future<void> confirmAccountDeletion(Map<String, dynamic> body) async {
    await dio.post<dynamic>(endpoints.deleteConfirm, data: body);
  }

  // --- Sessions ---
  Future<List<AuthSession>> getSessions() async {
    final res = await dio.get<List<dynamic>>(endpoints.sessions);
    return res.data!
        .cast<Map<String, dynamic>>()
        .map(AuthSession.fromJson)
        .toList();
  }

  Future<void> revokeSession(String sessionId) async {
    await dio.post<dynamic>(endpoints.revokeSession(sessionId));
  }

  // --- Current user ---
  Future<AuthUser> getMe() async {
    final res = await dio.get<Map<String, dynamic>>(endpoints.me);
    return AuthUser.fromJson(res.data!);
  }
}
