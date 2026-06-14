import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_otp_response.freezed.dart';
part 'verify_otp_response.g.dart';

@JsonSerializable()
class VerifyOtpResponseData {

  final String subject;
  final String channel;
  final String verificationToken;
  final int expiresAt;
  final bool hasAccount;

  const VerifyOtpResponseData({
    required this.subject,
    required this.channel,
    required this.verificationToken,
    required this.expiresAt,
    required this.hasAccount,
  });

  factory VerifyOtpResponseData.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyOtpResponseDataToJson(this);
}

/// Result of POST /auth/verify-otp.
/// Branches based on whether the user already has an account.
@freezed
abstract class VerifyOtpResponse with _$VerifyOtpResponse {
  const factory VerifyOtpResponse({
    required bool success,
    required String message,
    required VerifyOtpResponseData data,
  }) = _VerifyOtpResponse;

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseFromJson(json);
}
