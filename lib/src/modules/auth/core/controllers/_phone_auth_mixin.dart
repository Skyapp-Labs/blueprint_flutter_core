part of 'auth_controller.dart';

mixin _PhoneAuthMixin on _$AuthController {
  // Abstract declarations — provided by AuthController
  AppConfig get _config;
  AuthService get _authService;
  PhoneAuthService get _phoneAuthService;
  Future<void> _applyTokens(AuthTokens tokens);
  void _handleError(DioException e);

  // ─── Phone OTP Flow ───────────────────────────────────────────────────────

  /// Step 1: Send OTP to the given phone number.
  Future<OtpData?> sendOtp(String phone) async {
    assert(
      _config.authMethod == AuthMethod.phone,
      'sendOtp is only available when authMethod == AuthMethod.phone',
    );
    state = state.copyWith(status: AuthStatus.authenticating, error: null);
    try {
      final data = await _phoneAuthService.sendOtp(phone);
      state = state.copyWith(status: AuthStatus.unauthenticated);
      return data;
    } on DioException catch (e) {
      _handleError(e);
      return null;
    }
  }

  /// Step 2: Verify OTP code. Returns a [PhoneLookupResult] indicating
  /// whether this is a login (existing user) or registration (new user).
  Future<PhoneLookupResult?> verifyOtp({
    required String verificationId,
    required String code,
  }) async {
    state = state.copyWith(status: AuthStatus.authenticating, error: null);
    try {
      final result = await _phoneAuthService.verifyOtp(
        verificationId: verificationId,
        code: code,
      );
      state = state.copyWith(status: AuthStatus.unauthenticated);
      return result;
    } on DioException catch (e) {
      _handleError(e);
      return null;
    }
  }

  /// Step 2b: Resend OTP to the same session.
  Future<OtpData?> resendOtp(String sessionToken) async {
    try {
      return await _phoneAuthService.resendOtp(sessionToken);
    } on DioException catch (e) {
      _handleError(e);
      return null;
    }
  }

  /// Step 3a: Login an existing user using the temp token from [verifyOtp].
  Future<bool> loginWithToken(String phoneGrantToken) async {
    state = state.copyWith(status: AuthStatus.authenticating, error: null);
    try {
      final tokens = await _phoneAuthService.loginWithToken(phoneGrantToken);
      await _applyTokens(tokens);
      return true;
    } on DioException catch (e) {
      _handleError(e);
      return false;
    }
  }

  /// Step 3b: Register a new user via the phone OTP flow.
  Future<bool> registerWithPhone(PhoneRegisterRequest request) async {
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
