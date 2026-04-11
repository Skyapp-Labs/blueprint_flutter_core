// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_ref.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FileRef _$FileRefFromJson(Map<String, dynamic> json) => _FileRef(
  url: json['url'] as String,
  name: json['name'] as String?,
  mimeType: json['mimeType'] as String?,
  sizeBytes: (json['sizeBytes'] as num?)?.toInt(),
);

Map<String, dynamic> _$FileRefToJson(_FileRef instance) => <String, dynamic>{
  'url': instance.url,
  'name': instance.name,
  'mimeType': instance.mimeType,
  'sizeBytes': instance.sizeBytes,
};
