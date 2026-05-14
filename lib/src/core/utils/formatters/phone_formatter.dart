import 'package:blueprint_flutter_core/src/core/data/fx_countries.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart' show parse;

/// Parsed phone data from libphonenumber (`parse` map).
class PhoneParseResult {
  const PhoneParseResult({
    required this.fullNumber,
    required this.formattedNumber,
    this.national,
    this.type,
  });

  /// Complete number with country code (e.g. `+14155552671`). Use this for APIs, SMS, and storage.
  final String fullNumber;

  /// Same digits as [fullNumber], spaced for display (e.g. `+1 415 555 2671`).
  final String formattedNumber;

  /// National format when available.
  final String? national;

  /// Libphonenumber type label when available (e.g. `mobile`).
  final String? type;
}

/// Phone parsing and normalization via [flutter_libphonenumber].
///
/// Call [tryParse] or [tryFullNumber] as static methods, same style as
/// [TextFormatter] / [NumberFormatter].
///
/// Pass [country] or [region] (ISO code such as `US`, `IL`) when the input is
/// a national number without a leading `+`. For numbers that already start
/// with `+`, region is optional.
abstract final class PhoneFormatter {
  /// Parses [phone] and returns structured fields, or `null` if invalid.
  static Future<PhoneParseResult?> tryParse(
    String phone, {
    FxCountry? country,
    String? region,
  }) async {
    final trimmed = phone.trim();
    if (trimmed.isEmpty) return null;

    try {
      final parsed = await parse(
        trimmed,
        region: country?.code ?? region,
      );

      final fullNumber = parsed['e164'] as String?;
      final formattedNumber = parsed['international'] as String?;
      if (fullNumber == null || formattedNumber == null) return null;

      return PhoneParseResult(
        fullNumber: fullNumber,
        formattedNumber: formattedNumber,
        national: parsed['national'] as String?,
        type: parsed['type'] as String?,
      );
    } catch (_) {
      return null;
    }
  }

  /// Returns [PhoneParseResult.fullNumber] for [phone], or `null` if parsing fails.
  static Future<String?> tryFullNumber(
    String phone, {
    FxCountry? country,
    String? region,
  }) async =>
      (await tryParse(phone, country: country, region: region))?.fullNumber;
}
