import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/modules/security/security_controller.dart';
import 'package:blueprint_flutter_core/src/modules/security/security_state.dart';
import 'package:blueprint_flutter_core/src/modules/security/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetPinView extends ConsumerWidget with FxUiToolkit {
  ResetPinView({super.key, this.length = 4});

  final int length;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setToolkitContext(context);

    final controller = ref.read(securityControllerProvider.notifier);

    return PinStepTemplate(
      title: 'Forgot your PIN?',
      subtitle: 'Enter your new $length-digit PIN to access your account',
      onBackPressed: () => controller.goTo(PinStepView.verifyPin),
      onCompleted: (pin) => {}
    );
  }
}