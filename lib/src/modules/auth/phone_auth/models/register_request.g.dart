// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhoneRegisterRequest _$PhoneRegisterRequestFromJson(
  Map<String, dynamic> json,
) => _PhoneRegisterRequest(
  phoneGrantToken: json['phoneGrantToken'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  email: json['email'] as String?,
);

Map<String, dynamic> _$PhoneRegisterRequestToJson(
  _PhoneRegisterRequest instance,
) => <String, dynamic>{
  'phoneGrantToken': instance.phoneGrantToken,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
};
