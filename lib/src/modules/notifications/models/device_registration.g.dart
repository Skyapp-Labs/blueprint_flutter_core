// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceRegistration _$DeviceRegistrationFromJson(Map<String, dynamic> json) =>
    _DeviceRegistration(
      fcmToken: json['fcmToken'] as String,
      deviceType: $enumDecode(_$DeviceTypeEnumMap, json['deviceType']),
      deviceName: json['deviceName'] as String,
    );

Map<String, dynamic> _$DeviceRegistrationToJson(_DeviceRegistration instance) =>
    <String, dynamic>{
      'fcmToken': instance.fcmToken,
      'deviceType': _$DeviceTypeEnumMap[instance.deviceType]!,
      'deviceName': instance.deviceName,
    };

const _$DeviceTypeEnumMap = {
  DeviceType.ios: 'ios',
  DeviceType.android: 'android',
  DeviceType.web: 'web',
};
