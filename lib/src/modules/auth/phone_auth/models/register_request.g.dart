// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhoneRegisterRequest _$PhoneRegisterRequestFromJson(
  Map<String, dynamic> json,
) => _PhoneRegisterRequest(
  lastName: json['lastName'] as String,
  firstName: json['firstName'] as String,
  verificationToken: json['verificationToken'] as String,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  countryCode: json['countryCode'] as String?,
);

Map<String, dynamic> _$PhoneRegisterRequestToJson(
  _PhoneRegisterRequest instance,
) => <String, dynamic>{
  'lastName': instance.lastName,
  'firstName': instance.firstName,
  'verificationToken': instance.verificationToken,
  'email': instance.email,
  'phone': instance.phone,
  'countryCode': instance.countryCode,
};
