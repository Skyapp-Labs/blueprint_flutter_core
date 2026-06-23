import 'package:blueprint_flutter_core/src/core/widgets/buttons/_buttons.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/_inputs.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/enums/auth_method.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/auth_flow_controller.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/steps/_steps.dart';
import 'package:blueprint_flutter_core/src/modules/auth/steps/signup/signup_step_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupStepScreen extends ConsumerStatefulWidget {
  const SignupStepScreen({
    super.key,
    required this.template,
  });

  final SignupStepTemplate template;

  @override
  ConsumerState<SignupStepScreen> createState() => _SignupStepScreenState();
}

class _SignupStepScreenState extends ConsumerState<SignupStepScreen> with FxUiToolkit {

  late FxSignupFormGroup formGroup;

  @override
  void initState() {
    super.initState();
    formGroup = widget.template.formGroup.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authFlow = ref.read(authFlowControllerProvider);
      formGroup.setValues(phone: authFlow.phone, email: authFlow.email);
      if(authFlow.authMethod == AuthMethod.phone) {
        formGroup = formGroup.hidePassword();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    formGroup.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    final state = ref.watch(signupStepControllerProvider);
    final authFlow = ref.read(authFlowControllerProvider);
    formGroup.setValues(phone: authFlow.phone, email: authFlow.email);

    return widget.template.buildShell(
      customFooter: (context, ref) => FxButton(
        margin: EdgeInsets.symmetric(horizontal: sizes.md),
        label: 'Create account',
        isLoading: state.isLoading,
        onPressed: () => ref.read(signupStepControllerProvider.notifier)
          .onSignUpRequested(formGroup),
      ),
      children: [
        _buildFullNameField(),
        _buildInputField(formGroup.email),
        _buildPhoneField(),
        if(!formGroup.password.isHidden) _buildInputField(formGroup.password),
        if(!formGroup.confirmPassword.isHidden) _buildInputField(formGroup.confirmPassword),
        widget.template.buildTermsAndConditions
      ]
    );
  }

  Widget _buildFullNameField() {
    if (widget.template.nameLayout == FxNameLayout.fullName) {
      return _buildInputField(formGroup.fullNumber);
    }

    final firstName = _buildInputField(formGroup.firstName);
    final lastName = _buildInputField(formGroup.lastName);

    if (widget.template.nameLayout == FxNameLayout.column) {
      return Column(
        spacing: sizes.md,
        children: [ firstName, lastName ],
      );
    }

    if (screenWidth > 360) {
      return Row(
        spacing: sizes.md,
        children: [
          Expanded(child: firstName),
          Expanded(child: lastName),
        ]
      );
    }

    return Column(
      spacing: sizes.md,
      children: [ firstName, lastName ],
    );
  }

  Widget _buildInputField(FxFormControl control) {
    final options = FxFieldOptions(
      label: control.label,
      hint: control.hint,
      keyboardType: control.keyboardType ?? TextInputType.text,
      textInputAction: control.textInputAction ?? TextInputAction.next,
      labelBehavior: FxLabelBehavior.external,
    );

    if (control.isPassword) {
      return FxPasswordField(
        controller: control.controller,
        validator: control.validator,
        options: options
      );
    }

    return FxTextField(
      controller: control.controller,
      validator: control.validator,
      options: options
    );
  }

  Widget _buildPhoneField() => FxPhoneInput(
    validator: formGroup.phone.validator,
    initialValue: formGroup.phone.initialValue,
    onChanged: (country, phone, [parsed]) {
      if(formGroup.phone.controller == null) return;
      formGroup.phone.controller!.text = parsed?.fullNumber ?? '';
      if(formGroup.countryCode.controller == null) return;
      formGroup.countryCode.controller!.text = country.code;
    },
    config: FxPhoneInputConfig(
      layout: FxPhoneInputLayout.integrated,
      options: FxFieldOptions(
        enabled: formGroup.phone.initialValue == null,
        label: formGroup.phone.label,
        hint: formGroup.phone.hint,
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        labelBehavior: FxLabelBehavior.external,
      )
    )
  );
}
