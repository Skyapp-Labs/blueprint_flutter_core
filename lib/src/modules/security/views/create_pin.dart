import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/modules/security/security_controller.dart';
import 'package:blueprint_flutter_core/src/modules/security/views/views.dart';

class CreatePinView extends ConsumerWidget with FxUiToolkit {
  CreatePinView({super.key, this.length = 4});

  final int length;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setToolkitContext(context);

    final state = ref.watch(securityControllerProvider);
    final controller = ref.read(securityControllerProvider.notifier);

    return PinStepTemplate(
      title: 'Create your PIN',
      subtitle: 'Enter your new PIN to access your account',
      length: length,
      isLoading: state.isLoading,
      error: state.error,
      onCompleted: (pin) => controller.createPin()
    );
  }
}