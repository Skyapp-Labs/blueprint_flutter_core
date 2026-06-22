// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_controller.dart';

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

@ProviderFor(SecurityController)
final securityControllerProvider = SecurityControllerProvider._();

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
final class SecurityControllerProvider
    extends $NotifierProvider<SecurityController, SecurityState> {
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
  SecurityControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'securityControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$securityControllerHash();

  @$internal
  @override
  SecurityController create() => SecurityController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SecurityState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SecurityState>(value),
    );
  }
}

String _$securityControllerHash() =>
    r'22dc72f87f761820097c8910a5817d26eac7f43c';

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

abstract class _$SecurityController extends $Notifier<SecurityState> {
  SecurityState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SecurityState, SecurityState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SecurityState, SecurityState>,
              SecurityState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
