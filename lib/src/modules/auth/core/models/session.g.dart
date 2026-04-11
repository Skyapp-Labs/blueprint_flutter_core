// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthSession _$AuthSessionFromJson(Map<String, dynamic> json) => _AuthSession(
  id: json['id'] as String,
  deviceInfo: json['deviceInfo'] as String,
  ipAddress: json['ipAddress'] as String,
  createdAt: json['createdAt'] as String,
  expiresAt: json['expiresAt'] as String,
);

Map<String, dynamic> _$AuthSessionToJson(_AuthSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceInfo': instance.deviceInfo,
      'ipAddress': instance.ipAddress,
      'createdAt': instance.createdAt,
      'expiresAt': instance.expiresAt,
    };
