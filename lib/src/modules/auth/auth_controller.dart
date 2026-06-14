import 'package:blueprint_flutter_core/src/modules/auth/core/models/dto/payload/refresh_token_payload.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


import 'package:blueprint_flutter_core/blueprint_network.dart';
import 'package:blueprint_flutter_core/blueprint_notifications.dart';
import 'package:blueprint_flutter_core/src/core/network/firebase/fx_messaging.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/storage/auth_storage.dart';
import 'package:blueprint_flutter_core/src/core/config/fx_config.dart';
import 'package:blueprint_flutter_core/src/core/utils/jwt_helper.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/services/auth_service.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/states/auth_state.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/entities/auth_tokens.dart';

part 'auth_controller.g.dart';

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
class AuthController extends _$AuthController {

  late final FxConfig _config;

  late final AuthStorage _authStorage;

  late final AuthService _authService;

  final FxTokenManager _tokenManager = FxTokenManager();

  late final Dio _dio;

  /// The authenticated [Dio] instance. Available synchronously after [build].
  /// Consumed by [dioProvider].
  Dio get dio => _dio;

  @override
  AuthState build() {
    _config = ref.read(fxConfigProvider);
    _authStorage = AuthStorage();

    _dio = FxApiClient.create(
      config: _config,
      tokenManager: _tokenManager,
      onUnauthorized: _handleTokenRefresh,
    );

    final serviceContext = FxServiceContext(dio: _dio, endpoints: _config.endpoints);
    _authService = AuthService(serviceContext);

    _tryRestoreSession();
    _listenToNotifications();
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

  /// Listens to notifications and registers the device if the user is authenticated.
  void _listenToNotifications() {
    if (_config.enableNotifications && FxFirebaseClient.isInitialized) {
      final sub = FxMessaging.onTokenRefresh.listen((newToken) {
        if (state.status == AuthStatus.authenticated) {
          ref.read(fxNotificationControllerProvider.notifier).registerDevice(newToken);
        }
      });
      ref.onDispose(sub.cancel);
    }
  }

  // ─── Token Refresh (called by error interceptor) ─────────────────────────

  Future<bool> _handleTokenRefresh() async {
    final refreshToken = await _authStorage.getRefreshToken();
    if (refreshToken == null) return false;

    final payload = RefreshTokenPayload(refreshToken: refreshToken);
    final result = await _authService.refresh(payload);

    return result.when(
      success: (response) {
        applyTokens(response);
        return true;
      },
      failure: (error) async {
        await _signOut();
        return false;
      }
    );
  }

  // ─── Token Application ────────────────────────────────────────────────────
  Future<void> applyTokens(AuthTokens tokens) async {
    _tokenManager.setToken(tokens.accessToken);

    final user = JwtHelper.getUserFromToken(tokens.accessToken);

    await Future.wait([
      _authStorage.saveRefreshToken(tokens.refreshToken),
      _authStorage.saveUser(user),
    ]);

    state = state.copyWith(
      status: AuthStatus.authenticated,
      user: user,
      error: null,
    );
  }

  // ─── Logout ───────────────────────────────────────────────────────────────
  Future<void> logout() async {
    final result = await _authService.logout();
    result.when(
      success: (response) async {
        await _signOut();
      },
      failure: (error) async {
        await _signOut();
      }
    );
  }

  Future<void> _signOut() async {
    _tokenManager.clearToken();
    await _authStorage.clearAll();
    state = const AuthState(status: AuthStatus.unauthenticated);
  }

  // ─── Utility ─────────────────────────────────────────────────────────────
  /// Clears any existing error from the state.
  void clearError() {
    if (state.hasError) {
      state = state.copyWith(status: AuthStatus.unauthenticated, error: null);
    }
  }
}
