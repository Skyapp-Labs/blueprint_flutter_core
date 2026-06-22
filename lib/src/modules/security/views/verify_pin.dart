import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/modules/security/security_controller.dart';
import 'package:blueprint_flutter_core/src/modules/security/security_state.dart';
import 'package:blueprint_flutter_core/src/modules/security/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifyPinView extends ConsumerWidget with FxUiToolkit {
  VerifyPinView({
    super.key,
    this.length = 4,
    this.onUnlocked,
  });

  final int length;
  final VoidCallback? onUnlocked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setToolkitContext(context);

    final controller = ref.read(securityControllerProvider.notifier);

    return PinStepTemplate(
      title: 'Enter your PIN',
      subtitle: 'Enter your $length-digit PIN to access your account',
      action: Icon(Icons.lock_reset, size: sizes.iconLg),
      onActionPressed: () => controller.goTo(PinStepView.resetPin),
      onCompleted: (pin) => controller.onVerifyPin(pin: pin)
    );
  }
}