// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_countries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FxCountry _$FxCountryFromJson(Map<String, dynamic> json) => _FxCountry(
  name: json['name'] as String,
  code: json['code'] as String,
  dialCode: json['dialCode'] as String,
  flag: json['flag'] as String,
  continent: json['continent'] as String,
);

Map<String, dynamic> _$FxCountryToJson(_FxCountry instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'dialCode': instance.dialCode,
      'flag': instance.flag,
      'continent': instance.continent,
    };
