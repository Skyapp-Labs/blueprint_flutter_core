// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

@ProviderFor(AuthController)
final authControllerProvider = AuthControllerProvider._();

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
final class AuthControllerProvider
    extends $NotifierProvider<AuthController, AuthState> {
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
  AuthControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authControllerHash();

  @$internal
  @override
  AuthController create() => AuthController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthState>(value),
    );
  }
}

String _$authControllerHash() => r'24f6bc25ac0971e06233f0f380e2ea0cfb8aa240';

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

abstract class _$AuthController extends $Notifier<AuthState> {
  AuthState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AuthState, AuthState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthState, AuthState>,
              AuthState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
