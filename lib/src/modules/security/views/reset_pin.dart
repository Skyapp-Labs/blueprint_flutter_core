import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/modules/security/security_controller.dart';
import 'package:blueprint_flutter_core/src/modules/security/security_state.dart';
import 'package:blueprint_flutter_core/src/modules/security/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetPinView extends ConsumerWidget with FxUiToolkit {
  ResetPinView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setToolkitContext(context);

    final state = ref.watch(securityControllerProvider);
    final controller = ref.read(securityControllerProvider.notifier);

    return PinStepTemplate(
      title: 'Forgot your PIN?',
      subtitle: 'Enter your new PIN to access your account',
      isLoading: state.isLoading,
      onBackPressed: () => controller.goTo(PinStepView.verifyPin),
      error: state.error,
      onCompleted: (pin) => controller.onVerifyPinPressed(pin: pin)
    );
  }
}