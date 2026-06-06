import 'package:blueprint_flutter_core/src/core/widgets/display/fx_text.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/layout/_layout.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/enums/auth_step.dart';
import 'package:blueprint_flutter_core/src/modules/auth/flow/auth_flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'base_step.dart';
part 'email_step.dart';
part 'otp_step.dart';
part 'phone_step.dart';
part 'signup_step.dart';
part 'forgot_password_step.dart';
part 'reset_password_step.dart';
part 'verify_reset_password_step.dart';

class StepConfig {

  const StepConfig({
    this.email,
    this.phone,
    this.otp,
    this.signup,
    this.forgotPassword,
    this.resetPassword,
    this.verifyResetPassword,
  });

  final EmailStep? email;
  final PhoneStep? phone;
  final OtpStep? otp;
  final SignupStep? signup;
  final ForgotPasswordStep? forgotPassword;
  final ResetPasswordStep? resetPassword;
  final VerifyResetPasswordStep? verifyResetPassword;

  EmailStep get emailStep => email ?? DefaultEmailStep();
  
  PhoneStep get phoneStep => phone ?? DefaultPhoneStep();
  
  OtpStep get otpStep => otp ?? DefaultOtpStep();

  SignupStep get signupStep => signup ?? DefaultSignupStep();

  ForgotPasswordStep get forgotPasswordStep {
    return forgotPassword ?? DefaultForgotPasswordStep();
  }

  VerifyResetPasswordStep get verifyResetPasswordStep {
    return verifyResetPassword ?? DefaultVerifyResetPasswordStep();
  }

  ResetPasswordStep get resetPasswordStep {
    return resetPassword ?? DefaultResetPasswordStep();
  }
}