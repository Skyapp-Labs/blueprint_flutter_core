// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupProfilePayload _$SignupProfilePayloadFromJson(
  Map<String, dynamic> json,
) => SignupProfilePayload(
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  displayName: json['displayName'] as String?,
  dateOfBirth: json['dateOfBirth'] as String?,
  username: json['username'] as String?,
  gender: json['gender'] as String?,
);

Map<String, dynamic> _$SignupProfilePayloadToJson(
  SignupProfilePayload instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'displayName': instance.displayName,
  'dateOfBirth': instance.dateOfBirth,
  'username': instance.username,
  'gender': instance.gender,
};

_SignupPayload _$SignupPayloadFromJson(Map<String, dynamic> json) =>
    _SignupPayload(
      verificationToken: json['verificationToken'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      profile: json['profile'] == null
          ? const SignupProfilePayload()
          : SignupProfilePayload.fromJson(
              json['profile'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SignupPayloadToJson(_SignupPayload instance) =>
    <String, dynamic>{
      'verificationToken': instance.verificationToken,
      'email': instance.email,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'profile': instance.profile,
    };
