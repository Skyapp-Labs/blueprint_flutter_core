// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FxError _$FxErrorFromJson(Map<String, dynamic> json) => _FxError(
  message: json['message'] as String,
  code: json['code'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
);

Map<String, dynamic> _$FxErrorToJson(_FxError instance) => <String, dynamic>{
  'message': instance.message,
  'code': instance.code,
  'statusCode': instance.statusCode,
};
