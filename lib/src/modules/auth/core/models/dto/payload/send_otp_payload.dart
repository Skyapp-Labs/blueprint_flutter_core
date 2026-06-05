import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_otp_payload.freezed.dart';
part 'send_otp_payload.g.dart';

@freezed
abstract class SendOtpPayload with _$SendOtpPayload {
  const factory SendOtpPayload({
    required String phone,
  }) = _SendOtpPayload;

  factory SendOtpPayload.fromJson(
    Map<String, dynamic> json,
  ) => _$SendOtpPayloadFromJson(json);
}