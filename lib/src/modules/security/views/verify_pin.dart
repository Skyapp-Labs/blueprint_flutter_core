import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/modules/security/security_controller.dart';
import 'package:blueprint_flutter_core/src/modules/security/security_state.dart';
import 'package:blueprint_flutter_core/src/modules/security/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifyPinView extends ConsumerWidget with FxUiToolkit {
  VerifyPinView({super.key, this.length = 4});

  final int length;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setToolkitContext(context);

    final state = ref.watch(securityControllerProvider);
    final controller = ref.read(securityControllerProvider.notifier);

    return PinStepTemplate(
      length: length,
      title: 'Enter your PIN',
      subtitle: 'Enter your PIN to access your account',
      action: Icon(Icons.lock_reset, size: sizes.iconLg),
      onActionPressed: () => controller.goTo(PinStepView.resetPin),
      isLoading: state.isLoading,
      error: state.error,
      onCompleted: (pin) => controller.onVerifyPinPressed(pin: pin)
    );
  }
}