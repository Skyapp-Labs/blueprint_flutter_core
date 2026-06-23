import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_otp_payload.freezed.dart';
part 'refresh_otp_payload.g.dart';

@freezed
abstract class RefreshOtpPayload with _$RefreshOtpPayload {
  const factory RefreshOtpPayload({
    required String verificationId,
  }) = _RefreshOtpPayload;

  factory RefreshOtpPayload.fromJson(
    Map<String, dynamic> json,
  ) => _$RefreshOtpPayloadFromJson(json);
}