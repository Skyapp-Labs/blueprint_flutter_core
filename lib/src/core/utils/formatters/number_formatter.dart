import 'package:intl/intl.dart';

abstract final class NumberFormatter {
  /// e.g. 1200 → "1.2K", 1500000 → "1.5M"
  static String compact(num value) => NumberFormat.compact().format(value);

  /// e.g. 1234.5 → "1,234.50"
  static String decimal(num value, {int decimalPlaces = 2}) =>
      NumberFormat.decimalPatternDigits(
        decimalDigits: decimalPlaces,
      ).format(value);

  /// e.g. 0.75 → "75%"
  static String percent(num value, {int decimalPlaces = 0}) {
    final formatter =
        NumberFormat.percentPattern()
          ..minimumFractionDigits = decimalPlaces
          ..maximumFractionDigits = decimalPlaces;
    return formatter.format(value);
  }

  static String formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
}
