// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpDataResponse _$OtpDataResponseFromJson(Map<String, dynamic> json) =>
    OtpDataResponse(
      verificationId: json['verificationId'] as String,
      expiresAt: (json['expiresAt'] as num).toInt(),
      resendIn: (json['resendIn'] as num).toInt(),
    );

Map<String, dynamic> _$OtpDataResponseToJson(OtpDataResponse instance) =>
    <String, dynamic>{
      'verificationId': instance.verificationId,
      'expiresAt': instance.expiresAt,
      'resendIn': instance.resendIn,
    };

_OtpData _$OtpDataFromJson(Map<String, dynamic> json) => _OtpData(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: OtpDataResponse.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OtpDataToJson(_OtpData instance) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
