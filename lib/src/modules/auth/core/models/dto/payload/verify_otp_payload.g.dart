// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyOtpPayload _$VerifyOtpPayloadFromJson(Map<String, dynamic> json) =>
    _VerifyOtpPayload(
      verificationId: json['verificationId'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$VerifyOtpPayloadToJson(_VerifyOtpPayload instance) =>
    <String, dynamic>{
      'verificationId': instance.verificationId,
      'otp': instance.otp,
    };
