import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:blueprint_flutter_core/src/modules/auth/core/models/entities/user.dart';

part 'auth_state.freezed.dart';

/// Status of the current authentication session.
enum AuthStatus {
  /// No session exists — user must log in.
  unauthenticated,

  /// Auth operation in progress (login, OTP verify, etc.).
  authenticating,

  /// User is fully authenticated.
  authenticated,

  /// An auth error occurred.
  error,
}

/// Immutable snapshot of the current auth session.
@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.unauthenticated) AuthStatus status,
    User? user,
    String? error,
  }) = _AuthState;

  const AuthState._();

  bool get isAuthenticated => status == AuthStatus.authenticated;
  bool get isLoading => status == AuthStatus.authenticating;
  bool get hasError => status == AuthStatus.error;
}
