// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_lookup_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhoneLookupResult _$PhoneLookupResultFromJson(Map<String, dynamic> json) =>
    _PhoneLookupResult(
      verified: json['verified'] as bool,
      hasAccount: json['hasAccount'] as bool,
      phoneGrantToken: json['phoneGrantToken'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$PhoneLookupResultToJson(_PhoneLookupResult instance) =>
    <String, dynamic>{
      'verified': instance.verified,
      'hasAccount': instance.hasAccount,
      'phoneGrantToken': instance.phoneGrantToken,
      'phoneNumber': instance.phoneNumber,
    };
