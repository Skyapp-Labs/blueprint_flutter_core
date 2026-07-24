// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  onboardingStep: (json['onboardingStep'] as num).toInt(),
  isEmailVerified: json['isEmailVerified'] as bool,
  isPhoneVerified: json['isPhoneVerified'] as bool,
  isProfileCompleted: json['isProfileCompleted'] as bool,
  status: json['status'] as String,
  displayName: json['displayName'] as String,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  username: json['username'] as String?,
  email: json['email'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  countryCode: json['countryCode'] as String?,
  roles:
      (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'onboardingStep': instance.onboardingStep,
  'isEmailVerified': instance.isEmailVerified,
  'isPhoneVerified': instance.isPhoneVerified,
  'isProfileCompleted': instance.isProfileCompleted,
  'status': instance.status,
  'displayName': instance.displayName,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'username': instance.username,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'countryCode': instance.countryCode,
  'roles': instance.roles,
};
