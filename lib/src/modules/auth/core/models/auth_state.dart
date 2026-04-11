import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:skyapp_flutter_core/src/modules/auth/core/enums/auth_status.dart';
import 'package:skyapp_flutter_core/src/modules/auth/core/models/user.dart';

part 'auth_state.freezed.dart';

/// Immutable snapshot of the current auth session.
@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.unauthenticated) AuthStatus status,
    AuthUser? user,
    String? error,
  }) = _AuthState;

  const AuthState._();

  bool get isAuthenticated => status == AuthStatus.authenticated;
  bool get isLoading => status == AuthStatus.authenticating;
  bool get hasError => status == AuthStatus.error;
}
