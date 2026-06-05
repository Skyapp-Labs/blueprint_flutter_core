// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignupPayload _$SignupPayloadFromJson(Map<String, dynamic> json) =>
    _SignupPayload(
      verificationToken: json['verificationToken'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$SignupPayloadToJson(_SignupPayload instance) =>
    <String, dynamic>{
      'verificationToken': instance.verificationToken,
      'email': instance.email,
      'password': instance.password,
    };
