part of 'auth_controller.dart';

mixin _PasswordMixin on _$AuthController {
  // Abstract declarations — provided by AuthController
  EmailAuthService get _emailAuthService;
  AuthService get _authService;
  void _handleError(DioException e);

  // ─── Password Reset ───────────────────────────────────────────────────────

  Future<bool> forgotPassword(String email) async {
    try {
      await _emailAuthService.forgotPassword(email);
      return true;
    } on DioException catch (e) {
      _handleError(e);
      return false;
    }
  }

  Future<bool> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      await _emailAuthService.resetPassword(token: token, newPassword: newPassword);
      return true;
    } on DioException catch (e) {
      _handleError(e);
      return false;
    }
  }

  Future<bool> resetPasswordViaPhone({
    required String phoneGrantToken,
    required String newPassword,
  }) async {
    try {
      await _emailAuthService.resetPasswordViaPhone(
        phoneGrantToken: phoneGrantToken,
        newPassword: newPassword,
      );
      return true;
    } on DioException catch (e) {
      _handleError(e);
      return false;
    }
  }

  // ─── Account Management ───────────────────────────────────────────────────

  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await _authService.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      return true;
    } on DioException catch (e) {
      _handleError(e);
      return false;
    }
  }
}
