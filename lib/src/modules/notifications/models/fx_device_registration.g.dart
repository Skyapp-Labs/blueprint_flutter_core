// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_device_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FxDeviceRegistration _$FxDeviceRegistrationFromJson(
  Map<String, dynamic> json,
) => _FxDeviceRegistration(
  fcmToken: json['fcmToken'] as String,
  deviceType: $enumDecode(_$DeviceTypeEnumMap, json['deviceType']),
  deviceName: json['deviceName'] as String,
);

Map<String, dynamic> _$FxDeviceRegistrationToJson(
  _FxDeviceRegistration instance,
) => <String, dynamic>{
  'fcmToken': instance.fcmToken,
  'deviceType': _$DeviceTypeEnumMap[instance.deviceType]!,
  'deviceName': instance.deviceName,
};

const _$DeviceTypeEnumMap = {
  DeviceType.ios: 'ios',
  DeviceType.android: 'android',
  DeviceType.web: 'web',
};
