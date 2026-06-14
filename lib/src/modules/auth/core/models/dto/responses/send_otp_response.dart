import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_otp_response.freezed.dart';
part 'send_otp_response.g.dart';

/// Payload in the `data` field from POST /auth/send-otp (and resend).
@JsonSerializable()
class SendOtpResponseData {
  const SendOtpResponseData({
    required this.verificationId,
    required this.expiresAt,
    required this.resendIn,
  });
  final String verificationId;
  final int expiresAt;
  final int resendIn;
  factory SendOtpResponseData.fromJson(Map<String, dynamic> json) =>
      _$SendOtpResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$SendOtpResponseDataToJson(this);
}

/// Data returned after a successful POST /auth/send-otp.
@freezed
abstract class SendOtpResponse with _$SendOtpResponse {
  const factory SendOtpResponse({
    required bool success,
    required String message,
    required SendOtpResponseData data,
  }) = _SendOtpResponse;

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$SendOtpResponseFromJson(json);
}
