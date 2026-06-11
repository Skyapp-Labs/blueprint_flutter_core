// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_step_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EmailStepController)
final emailStepControllerProvider = EmailStepControllerProvider._();

final class EmailStepControllerProvider
    extends $NotifierProvider<EmailStepController, EmailStepState> {
  EmailStepControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'emailStepControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$emailStepControllerHash();

  @$internal
  @override
  EmailStepController create() => EmailStepController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EmailStepState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EmailStepState>(value),
    );
  }
}

String _$emailStepControllerHash() =>
    r'20259e089acc86464dc2d344ba30841f7fe000e5';

abstract class _$EmailStepController extends $Notifier<EmailStepState> {
  EmailStepState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<EmailStepState, EmailStepState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EmailStepState, EmailStepState>,
              EmailStepState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
