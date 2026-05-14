import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request.freezed.dart';
part 'register_request.g.dart';

/// Request body for [AuthMethod.phone] registration.
///
/// Used after verifying OTP for a new user (step 3b).
@freezed
abstract class PhoneRegisterRequest with _$PhoneRegisterRequest {
  const factory PhoneRegisterRequest({
    required String lastName,
    required String firstName,
    required String verificationToken,
    String? email,
    String? phone,
    String? countryCode,
  }) = _PhoneRegisterRequest;

  factory PhoneRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$PhoneRegisterRequestFromJson(json);
}
