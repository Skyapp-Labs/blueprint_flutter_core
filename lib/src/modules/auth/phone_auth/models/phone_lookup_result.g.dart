// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_lookup_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneLookupDataResponse _$PhoneLookupDataResponseFromJson(
  Map<String, dynamic> json,
) => PhoneLookupDataResponse(
  subject: json['subject'] as String,
  channel: json['channel'] as String,
  verificationToken: json['verificationToken'] as String,
  expiresAt: (json['expiresAt'] as num).toInt(),
  hasAccount: json['hasAccount'] as bool,
);

Map<String, dynamic> _$PhoneLookupDataResponseToJson(
  PhoneLookupDataResponse instance,
) => <String, dynamic>{
  'subject': instance.subject,
  'channel': instance.channel,
  'verificationToken': instance.verificationToken,
  'expiresAt': instance.expiresAt,
  'hasAccount': instance.hasAccount,
};

_PhoneLookupResult _$PhoneLookupResultFromJson(Map<String, dynamic> json) =>
    _PhoneLookupResult(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: PhoneLookupDataResponse.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PhoneLookupResultToJson(_PhoneLookupResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
