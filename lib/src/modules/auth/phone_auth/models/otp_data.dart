import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_data.freezed.dart';
part 'otp_data.g.dart';

/// Data returned after a successful POST /auth/send-otp.
@freezed
abstract class OtpData with _$OtpData {
  const factory OtpData({
    required String verificationId,
    required int expiresAt,
  }) = _OtpData;

  factory OtpData.fromJson(Map<String, dynamic> json) =>
      _$OtpDataFromJson(json);
}
