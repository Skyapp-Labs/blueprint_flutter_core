// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChangePasswordPayload _$ChangePasswordPayloadFromJson(
  Map<String, dynamic> json,
) => _ChangePasswordPayload(
  currentPassword: json['currentPassword'] as String,
  newPassword: json['newPassword'] as String,
);

Map<String, dynamic> _$ChangePasswordPayloadToJson(
  _ChangePasswordPayload instance,
) => <String, dynamic>{
  'currentPassword': instance.currentPassword,
  'newPassword': instance.newPassword,
};
