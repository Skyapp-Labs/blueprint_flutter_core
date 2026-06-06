import 'package:blueprint_flutter_core/src/core/utils/validators.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/_inputs.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/steps/_steps.dart';
import 'package:blueprint_flutter_core/src/modules/auth/steps/signup/signup_step_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupStepScreen extends ConsumerWidget {
  const SignupStepScreen({
    super.key,
    required this.template,
  });

  final SignupStepTemplate template;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signupStepControllerProvider);
    return template.buildShell(
      ref: ref,
      context: context,
      body: [
        FxTextField(
          label: 'First Name',
          hint: 'Enter your first name',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          validator: Validators.required,
        ),
        FxTextField(
          label: 'Last Name',
          hint: 'Enter your last name',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          validator: Validators.required,
        ),
        // FxPhoneInput(
        //   decoration: FxPhoneInputDecoration(
        //     label: 'Phonesss',
        //     hint: 'Enter your phone number',
        //   ),
        //   onChanged: (country, phone, [parsed]) {},
        // ),
        FxTextField(
          label: 'Email',
          hint: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          // validator: Validators.email,
        ),
        FxTextField(
          // prefixIcon: const Icon(Icons.email),
          label: 'Password',
          hint: 'Enter your password',
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          obscureText: true,
          validator: Validators.password,
        ),
        FxSelectField(
          // prefixIcon: const Icon(Icons.email),
          label: 'Email',
          hint: 'Enter your email',
          items: [
            'Male',
            'Female'
          ],
          decoration: FxSelectFieldDecoration(
            label: 'Gender',
            hint: 'Select your gender',
            
          ),
          // validator: Validators.email,
        ),
        FxTextField(
          // prefixIcon: const Icon(Icons.email),
          label: 'Email',
          hint: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          // validator: Validators.email,
        ),
        FxTextField(
          // prefixIcon: const Icon(Icons.email),
          label: 'Email',
          hint: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          // validator: Validators.email,
        ),
      ],
    );
  }
}
