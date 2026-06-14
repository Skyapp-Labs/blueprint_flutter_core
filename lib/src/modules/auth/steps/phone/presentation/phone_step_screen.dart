import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/src/core/widgets/inputs/_inputs.dart';
import 'package:blueprint_flutter_core/src/core/widgets/buttons/fx_button.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/steps/_steps.dart';
import 'package:blueprint_flutter_core/src/modules/auth/steps/phone/phone_step_controller.dart';

class PhoneStepScreen extends ConsumerWidget {
  const PhoneStepScreen({
    super.key,
    required this.template,
  });

  final PhoneStepTemplate template;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(phoneStepControllerProvider.notifier);
    final state = ref.watch(phoneStepControllerProvider);

    return template.buildShell(
      context: context,
      ref: ref,
      children: [
        FxPhoneInput(
          onChanged: (country, phone, [parsed]) => controller.setPhone(
            parsed?.fullNumber ?? '${country.dialCode}$phone',
            countryCode: country.dialCode,
            formattedPhone: parsed?.formattedNumber ?? phone,
          ),
        ),
        FxButton(
          label: template.actionLabel,
          isLoading: state.isLoading,
          onPressed: state.phone == null ? null : controller.sendOtp,
        ),
      ],
    );
  }
}
