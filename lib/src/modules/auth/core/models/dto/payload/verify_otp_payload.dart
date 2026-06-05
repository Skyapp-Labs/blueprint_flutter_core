import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_otp_payload.freezed.dart';
part 'verify_otp_payload.g.dart';

@freezed
abstract class VerifyOtpPayload with _$VerifyOtpPayload {
  const factory VerifyOtpPayload({
    required String verificationId,
    required String otp,
  }) = _VerifyOtpPayload;

  factory VerifyOtpPayload.fromJson(
    Map<String, dynamic> json,
  ) => _$VerifyOtpPayloadFromJson(json);
}