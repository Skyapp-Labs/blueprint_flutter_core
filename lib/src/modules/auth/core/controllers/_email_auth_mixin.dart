part of 'auth_controller.dart';

mixin _EmailAuthMixin on _$AuthController {
  // Abstract declarations — provided by AuthController
  AppConfig get _config;
  EmailAuthService get _emailAuthService;
  AuthService get _authService;

  Future<void> _applyTokens(AuthTokens tokens);

  void _handleError(DioException e);

  // ─── Email + Password Flow ────────────────────────────────────────────────

  Future<bool> loginWithEmail({
    required String email,
    required String password,
  }) async {
    assert(
      _config.authMethod == AuthMethod.email,
      'loginWithEmail is only available when authMethod == AuthMethod.email',
    );
    state = state.copyWith(status: AuthStatus.authenticating, error: null);
    try {
      final tokens = await _emailAuthService.login(
        email: email,
        password: password,
      );
      await _applyTokens(tokens);
      return true;
    } on DioException catch (e) {
      _handleError(e);
      return false;
    }
  }

  Future<bool> registerWithEmail(EmailRegisterRequest request) async {
    state = state.copyWith(status: AuthStatus.authenticating, error: null);
    try {
      final tokens = await _authService.register(request.toJson());
      await _applyTokens(tokens);
      return true;
    } on DioException catch (e) {
      _handleError(e);
      return false;
    }
  }
}
