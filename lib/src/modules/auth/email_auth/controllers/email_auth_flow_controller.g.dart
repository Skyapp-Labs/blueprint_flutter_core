// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_auth_flow_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages the email auth flow (login and register steps).
/// Delegates all API calls to [authControllerProvider].

@ProviderFor(EmailAuthFlowController)
final emailAuthFlowControllerProvider = EmailAuthFlowControllerProvider._();

/// Manages the email auth flow (login and register steps).
/// Delegates all API calls to [authControllerProvider].
final class EmailAuthFlowControllerProvider
    extends $NotifierProvider<EmailAuthFlowController, EmailAuthFlowState> {
  /// Manages the email auth flow (login and register steps).
  /// Delegates all API calls to [authControllerProvider].
  EmailAuthFlowControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'emailAuthFlowControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$emailAuthFlowControllerHash();

  @$internal
  @override
  EmailAuthFlowController create() => EmailAuthFlowController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EmailAuthFlowState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EmailAuthFlowState>(value),
    );
  }
}

String _$emailAuthFlowControllerHash() =>
    r'd3ac221f4e5f62808a48ff9aed84b6cec5081745';

/// Manages the email auth flow (login and register steps).
/// Delegates all API calls to [authControllerProvider].

abstract class _$EmailAuthFlowController extends $Notifier<EmailAuthFlowState> {
  EmailAuthFlowState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<EmailAuthFlowState, EmailAuthFlowState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EmailAuthFlowState, EmailAuthFlowState>,
              EmailAuthFlowState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
