// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Session _$SessionFromJson(Map<String, dynamic> json) => _Session(
  id: json['id'] as String,
  deviceInfo: json['deviceInfo'] as String,
  ipAddress: json['ipAddress'] as String,
  createdAt: json['createdAt'] as String,
  expiresAt: json['expiresAt'] as String,
);

Map<String, dynamic> _$SessionToJson(_Session instance) => <String, dynamic>{
  'id': instance.id,
  'deviceInfo': instance.deviceInfo,
  'ipAddress': instance.ipAddress,
  'createdAt': instance.createdAt,
  'expiresAt': instance.expiresAt,
};
