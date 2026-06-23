import 'package:blueprint_flutter_core/src/core/config/fx_config.dart';
import 'package:blueprint_flutter_core/src/core/utils/validators.dart';
import 'package:blueprint_flutter_core/src/core/widgets/display/fx_text.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_form_control.dart';
import 'package:blueprint_flutter_core/src/core/widgets/layout/_layout.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/enums/auth_method.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/enums/auth_step.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/auth_flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'auth_step_layout.dart';
part 'auth_step_template.dart';
part 'email_step.dart';
part 'otp_step.dart';
part 'phone_step.dart';
part 'signup_step.dart';
part 'forgot_password_step.dart';
part 'reset_password_step.dart';
part 'verify_reset_password_step.dart';

/// Registry of customizable auth step presentation templates.
class AuthStepTemplates {
  const AuthStepTemplates({
    this.email = const DefaultEmailStepTemplate(),
    this.phone = const DefaultPhoneStepTemplate(),
    this.otp = const DefaultOtpStepTemplate(),
    this.signup = const DefaultSignupStepTemplate(),
    this.forgotPassword = const DefaultForgotPasswordStepTemplate(),
    this.resetPassword = const DefaultResetPasswordStepTemplate(),
    this.verifyResetPassword = const DefaultVerifyResetPasswordStepTemplate(),
  });

  final EmailStepTemplate email;
  final PhoneStepTemplate phone;
  final OtpStepTemplate otp;
  final SignupStepTemplate signup;
  final ForgotPasswordStepTemplate forgotPassword;
  final ResetPasswordStepTemplate resetPassword;
  final VerifyResetPasswordStepTemplate verifyResetPassword;

  AuthStepTemplates copyWith({
    required BuildContext context,
    required WidgetRef ref
  }) => AuthStepTemplates(
    email: email.copyWith(context: context, ref: ref) as EmailStepTemplate,
    phone: phone.copyWith(context: context, ref: ref) as PhoneStepTemplate,
    otp: otp.copyWith(context: context, ref: ref) as OtpStepTemplate,
    signup: signup.copyWith(context: context, ref: ref) as SignupStepTemplate,
    forgotPassword: forgotPassword.copyWith(context: context, ref: ref) as ForgotPasswordStepTemplate,
    resetPassword: resetPassword.copyWith(context: context, ref: ref) as ResetPasswordStepTemplate,
    verifyResetPassword: verifyResetPassword.copyWith(context: context, ref: ref) as VerifyResetPasswordStepTemplate,
  );
}
