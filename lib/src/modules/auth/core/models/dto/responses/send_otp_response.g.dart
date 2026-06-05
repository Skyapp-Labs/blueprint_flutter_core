// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOtpResponseData _$SendOtpResponseDataFromJson(Map<String, dynamic> json) =>
    SendOtpResponseData(
      verificationId: json['verificationId'] as String,
      expiresAt: (json['expiresAt'] as num).toInt(),
      resendIn: (json['resendIn'] as num).toInt(),
    );

Map<String, dynamic> _$SendOtpResponseDataToJson(
  SendOtpResponseData instance,
) => <String, dynamic>{
  'verificationId': instance.verificationId,
  'expiresAt': instance.expiresAt,
  'resendIn': instance.resendIn,
};

_SendOtpResponse _$SendOtpResponseFromJson(Map<String, dynamic> json) =>
    _SendOtpResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: SendOtpResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SendOtpResponseToJson(_SendOtpResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
