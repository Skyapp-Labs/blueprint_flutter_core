import 'package:skyapp_flutter_core/src/core/network/app_service.dart';
import 'package:skyapp_flutter_core/src/modules/auth/core/models/auth_tokens.dart';

/// Handles all OTP-specific API calls for the phone auth flow.
class EmailAuthService extends AppService {
  EmailAuthService(super.ctx);

  // --- Email login ---
  Future<AuthTokens> login({
    required String email,
    required String password,
  }) async {
    final res = await dio.post<Map<String, dynamic>>(
      endpoints.login,
      data: {'email': email, 'password': password},
    );
    return AuthTokens.fromJson(res.data!);
  }

  // --- Password reset ---
  Future<void> forgotPassword(String email) async {
    await dio.post<dynamic>(
      endpoints.forgotPassword,
      data: {'email': email},
    );
  }

  Future<void> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    await dio.post<dynamic>(
      endpoints.resetPassword,
      data: {'token': token, 'newPassword': newPassword},
    );
  }

  Future<void> resetPasswordViaPhone({
    required String phoneGrantToken,
    required String newPassword,
  }) async {
    await dio.post<dynamic>(
      endpoints.resetPasswordPhone,
      data: {
        'phoneGrantToken': phoneGrantToken,
        'newPassword': newPassword,
      },
    );
  }
}
