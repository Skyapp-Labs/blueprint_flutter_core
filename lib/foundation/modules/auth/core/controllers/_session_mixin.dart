part of 'auth_controller.dart';

mixin _SessionMixin on _$AuthController {
  // Abstract declarations — provided by AuthController
  AuthService get _authService;
  void _handleError(DioException e);

  // ─── Session Management ───────────────────────────────────────────────────

  /// Returns all active sessions for the current user.
  Future<List<AuthSession>> getSessions() async {
    try {
      return await _authService.getSessions();
    } on DioException catch (e) {
      _handleError(e);
      return [];
    }
  }

  /// Revokes a specific session by ID.
  Future<bool> revokeSession(String sessionId) async {
    try {
      await _authService.revokeSession(sessionId);
      return true;
    } on DioException catch (e) {
      _handleError(e);
      return false;
    }
  }
}
