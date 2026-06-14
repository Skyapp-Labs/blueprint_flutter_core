// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpResponseData _$VerifyOtpResponseDataFromJson(
  Map<String, dynamic> json,
) => VerifyOtpResponseData(
  subject: json['subject'] as String,
  channel: json['channel'] as String,
  verificationToken: json['verificationToken'] as String,
  expiresAt: (json['expiresAt'] as num).toInt(),
  hasAccount: json['hasAccount'] as bool,
);

Map<String, dynamic> _$VerifyOtpResponseDataToJson(
  VerifyOtpResponseData instance,
) => <String, dynamic>{
  'subject': instance.subject,
  'channel': instance.channel,
  'verificationToken': instance.verificationToken,
  'expiresAt': instance.expiresAt,
  'hasAccount': instance.hasAccount,
};

_VerifyOtpResponse _$VerifyOtpResponseFromJson(Map<String, dynamic> json) =>
    _VerifyOtpResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: VerifyOtpResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$VerifyOtpResponseToJson(_VerifyOtpResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
