import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/otp_data.dart';
import '../models/phone_lookup_result.dart';

part 'phone_auth_flow_state.freezed.dart';

/// Steps in the phone auth flow.
enum FxPhoneAuthStep { enterPhone, enterOtp, enterDetails }

@freezed
abstract class PhoneAuthFlowState with _$PhoneAuthFlowState {
  const factory PhoneAuthFlowState({
    String? phone,
    @Default(FxPhoneAuthStep.enterPhone) FxPhoneAuthStep step,
    OtpData? otpData,
    PhoneLookupResult? lookupResult,
  }) = _PhoneAuthFlowState;
}
