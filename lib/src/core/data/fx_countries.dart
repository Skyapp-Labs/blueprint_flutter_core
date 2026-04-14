import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fx_countries.freezed.dart';
part 'fx_countries.g.dart';

@freezed
abstract class FxCountry with _$FxCountry {

  const factory FxCountry({
    required String name,
    required String code,
    required String dialCode,
    required String flag,
    required String continent,
  }) = _FxCountry;

  factory FxCountry.fromJson(Map<String, dynamic> json) => _$FxCountryFromJson(json);
}

abstract final class FxCountries {

  static List<FxCountry> _cache = [];

  static Future<void> load() async {
    if (_cache.isNotEmpty) return;
    final json = await rootBundle.loadString(
      'packages/blueprint_flutter_core/assets/data/countries.json',
    );
    final list = jsonDecode(json) as List<dynamic>;
    _cache = list.map((e) => FxCountry.fromJson(e as Map<String, dynamic>)).toList();
  }

  static List<FxCountry> get all => _cache;

  // Common shortcuts
  static FxCountry? byCode(String code) =>
      all.where((c) => c.code == code).firstOrNull;

  static FxCountry? byDialCode(String dialCode) =>
      all.where((c) => c.dialCode == dialCode).firstOrNull;

  static List<FxCountry> byContinent(String continent) =>
      all.where((c) => c.continent == continent).toList();
}
