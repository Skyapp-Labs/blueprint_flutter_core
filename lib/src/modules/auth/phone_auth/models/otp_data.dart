import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_data.freezed.dart';
part 'otp_data.g.dart';

/// Payload in the `data` field from POST /auth/send-otp (and resend).
@JsonSerializable()
class OtpDataResponse {
  const OtpDataResponse({
    required this.verificationId,
    required this.expiresAt,
    required this.resendIn,
  });
  final String verificationId;
  final int expiresAt;
  final int resendIn;
  factory OtpDataResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OtpDataResponseToJson(this);
}

/// Data returned after a successful POST /auth/send-otp.
@freezed
abstract class OtpData with _$OtpData {
  // {success: true, message: OTP generated successfully, data: {verificationId: d9850f80-ea85-4cb3-9f7d-0bbec222302b, expiresAt: 1778692045871, resendIn: 60000}}

  const factory OtpData({
    required bool success,
    required String message,
    required OtpDataResponse data,
  }) = _OtpData;

  factory OtpData.fromJson(Map<String, dynamic> json) =>
      _$OtpDataFromJson(json);
}
