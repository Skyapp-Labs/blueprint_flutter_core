// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OtpData _$OtpDataFromJson(Map<String, dynamic> json) => _OtpData(
  verificationId: json['verificationId'] as String,
  expiresAt: (json['expiresAt'] as num).toInt(),
);

Map<String, dynamic> _$OtpDataToJson(_OtpData instance) => <String, dynamic>{
  'verificationId': instance.verificationId,
  'expiresAt': instance.expiresAt,
};
