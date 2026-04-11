import 'package:dio/dio.dart';
import 'package:skyapp_flutter_core/foundation/modules/auth/email_auth/models/register_request.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/errors/network_exception.dart';
import '../../../../core/errors/unauthorized_exception.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/network_providers.dart';
import '../../../../core/network/service_context.dart';
import '../../../../core/network/token_manager.dart';
import '../../../../core/utils/jwt_helper.dart';
import '../../email_auth/services/email_auth_service.dart';
import '../enums/auth_method.dart';
import '../enums/auth_status.dart';
import '../models/auth_state.dart';
import '../models/auth_tokens.dart';
import '../models/session.dart';
import '../models/user.dart';
import '../services/auth_service.dart';
import '../storage/auth_storage.dart';
import '../../phone_auth/models/otp_data.dart';
import '../../phone_auth/models/phone_lookup_result.dart';
import '../../phone_auth/models/register_request.dart';
import '../../phone_auth/services/phone_auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';
part '_phone_auth_mixin.dart';
part '_email_auth_mixin.dart';
part '_password_mixin.dart';
part '_session_mixin.dart';

/// Central auth controller. Handles both [AuthMethod.phone] and [AuthMethod.email].
///
/// Delegates each domain to a focused mixin:
/// - Phone OTP flow → [_PhoneAuthMixin]
/// - Email + password → [_EmailAuthMixin]
/// - Password reset / change → [_PasswordMixin]
/// - Session management → [_SessionMixin]
/// - Invite acceptance → [_InviteMixin]
///
/// Inject via: `ref.watch(authControllerProvider)`
/// State: [AuthState]
@Riverpod(keepAlive: true)
class AuthController extends _$AuthController
    with _PhoneAuthMixin, _EmailAuthMixin, _PasswordMixin, _SessionMixin {

  @override
  late final AppConfig _config;

  late final TokenManager _tokenManager;
  late final AuthStorage _authStorage;

  @override
  late final AuthService _authService;

  @override
  late final PhoneAuthService _phoneAuthService;

  @override
  late final EmailAuthService _emailAuthService;

  late final Dio _dio;

  /// The authenticated [Dio] instance. Available synchronously after [build].
  /// Consumed by [dioProvider].
  Dio get dio => _dio;

  @override
  AuthState build() {
    _config = ref.read(appConfigProvider);
    _tokenManager = TokenManager();
    _authStorage = AuthStorage();
    _dio = ApiClient.create(
      config: _config,
      tokenManager: _tokenManager,
      onUnauthorized: _handleTokenRefresh,
    );
    final serviceContext = ServiceContext(dio: _dio, endpoints: _config.endpoints);
    _authService = AuthService(serviceContext);
    _phoneAuthService = PhoneAuthService(serviceContext);
    _emailAuthService = EmailAuthService(serviceContext);

    _tryRestoreSession();
    return const AuthState();
  }

  // ─── Session Restore ──────────────────────────────────────────────────────

  Future<void> _tryRestoreSession() async {
    final storedUser    = await _authStorage.getUser();
    final refreshToken  = await _authStorage.getRefreshToken();

    // Both must be present — missing either means no valid session.
    if (storedUser == null || refreshToken == null) return;

    // Signal that a restore is in progress so the splash screen waits before
    // deciding whether to route to home or login.
    state = state.copyWith(status: AuthStatus.authenticating, error: null);

    // Restore user state immediately with no network call.
    // The access token is obtained lazily by AuthInterceptor on the
    // first protected request (proactive refresh via ensureRefreshed).
    state = state.copyWith(
      status: AuthStatus.authenticated,
      user: storedUser,
      error: null,
    );
  }

  // ─── Token Refresh (called by error interceptor) ─────────────────────────

  Future<bool> _handleTokenRefresh() async {
    try {
      final refreshToken = await _authStorage.getRefreshToken();
      if (refreshToken == null) return false;

      final tokens = await _authService.refresh(refreshToken);
      await _applyTokens(tokens);
      return true;
    } catch (_) {
      await _signOut();
      return false;
    }
  }

  // ─── Token Application ────────────────────────────────────────────────────

  @override
  Future<void> _applyTokens(AuthTokens tokens) async {
    _tokenManager.setToken(tokens.accessToken);
    await _authStorage.saveRefreshToken(tokens.refreshToken);

    final permissions = JwtHelper.permissions(tokens.accessToken);
    final userId = JwtHelper.userId(tokens.accessToken);
    final fullName = JwtHelper.fullName(tokens.accessToken) ?? '';
    final email = JwtHelper.email(tokens.accessToken);
    final phone = JwtHelper.phoneNumber(tokens.accessToken);
    final countryCode = JwtHelper.countryCode(tokens.accessToken);

    final nameParts = fullName.split(' ');
    final user = AuthUser(
      id: userId ?? '',
      firstName: nameParts.isNotEmpty ? nameParts.first : '',
      lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
      email: email,
      phoneNumber: phone,
      permissions: permissions,
      countryCode: countryCode,
    );

    await Future.wait([
      _authStorage.saveRefreshToken(tokens.refreshToken),
      _authStorage.saveUser(user),           // ← new
    ]);

    state = state.copyWith(
      status: AuthStatus.authenticated,
      user: user,
      error: null,
    );
  }

  // ─── Logout ───────────────────────────────────────────────────────────────

  Future<void> logout() async {
    try {
      await _authService.logout();
    } catch (_) {
      // Silently ignore — we always clear local state
    }
    await _signOut();
  }

  Future<void> _signOut() async {
    _tokenManager.clearToken();
    await _authStorage.clearAll();
    state = const AuthState(status: AuthStatus.unauthenticated);
  }

  // ─── Error Handling ───────────────────────────────────────────────────────

  @override
  void _handleError(DioException e) {
    final err = e.error;
    String message = 'An unexpected error occurred.';

    if (err is NetworkException) {
      message = err.message;
    } else if (err is UnauthorizedException) {
      message = err.message;
    }

    state = state.copyWith(status: AuthStatus.error, error: message);
  }

  // ─── Utility ─────────────────────────────────────────────────────────────

  /// Clears any existing error from the state.
  void clearError() {
    if (state.hasError) {
      state = state.copyWith(status: AuthStatus.unauthenticated, error: null);
    }
  }
}
