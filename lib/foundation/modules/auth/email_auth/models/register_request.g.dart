// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmailRegisterRequest _$EmailRegisterRequestFromJson(
  Map<String, dynamic> json,
) => _EmailRegisterRequest(
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  phone: json['phone'] as String?,
  countryCode: json['countryCode'] as String?,
);

Map<String, dynamic> _$EmailRegisterRequestToJson(
  _EmailRegisterRequest instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'password': instance.password,
  'phone': instance.phone,
  'countryCode': instance.countryCode,
};
