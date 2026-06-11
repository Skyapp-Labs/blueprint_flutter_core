// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_flow_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthFlowController)
final authFlowControllerProvider = AuthFlowControllerProvider._();

final class AuthFlowControllerProvider
    extends $NotifierProvider<AuthFlowController, AuthFlowState> {
  AuthFlowControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authFlowControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authFlowControllerHash();

  @$internal
  @override
  AuthFlowController create() => AuthFlowController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthFlowState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthFlowState>(value),
    );
  }
}

String _$authFlowControllerHash() =>
    r'572eec8f4a79db5930cadbe2614caccdbaa426d5';

abstract class _$AuthFlowController extends $Notifier<AuthFlowState> {
  AuthFlowState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AuthFlowState, AuthFlowState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthFlowState, AuthFlowState>,
              AuthFlowState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
