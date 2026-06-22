// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PinStatusDto _$PinStatusDtoFromJson(Map<String, dynamic> json) =>
    _PinStatusDto(
      isSet: json['isSet'] as bool,
      isLocked: json['isLocked'] as bool,
      type: json['type'] as String,
      length: (json['length'] as num).toInt(),
    );

Map<String, dynamic> _$PinStatusDtoToJson(_PinStatusDto instance) =>
    <String, dynamic>{
      'isSet': instance.isSet,
      'isLocked': instance.isLocked,
      'type': instance.type,
      'length': instance.length,
    };
