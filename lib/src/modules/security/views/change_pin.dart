import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/modules/security/security_controller.dart';
import 'package:blueprint_flutter_core/src/modules/security/views/views.dart';

class ChangePinView extends ConsumerWidget with FxUiToolkit {
  ChangePinView({super.key, this.isConfirming = false});

  /// Whether the user is confirming the PIN.
  final bool isConfirming;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setToolkitContext(context);

    final controller = ref.read(securityControllerProvider.notifier);

    return PinStepTemplate(
      title: 'Change your PIN',
      subtitle: 'Enter your new ${isConfirming ? 'confirm' : 'change'} PIN to access your account',
      onCompleted: (pin) => controller.onVerifyPin(pin: pin)
    );
  }
}