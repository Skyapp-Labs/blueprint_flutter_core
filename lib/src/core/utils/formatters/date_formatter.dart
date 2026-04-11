import 'package:intl/intl.dart';

abstract final class DateFormatter {
  /// e.g. "2 hours ago", "3 days ago", "just now"
  static String relative(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inSeconds < 60) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return absolute(dateTime);
  }

  /// e.g. "Mar 5, 2026"
  static String absolute(DateTime dateTime) =>
      DateFormat('MMM d, y').format(dateTime);

  /// e.g. "05/03/2026"
  static String date(DateTime dateTime) =>
      DateFormat('dd/MM/yyyy').format(dateTime);

  /// e.g. "14:30"
  static String time(DateTime dateTime) => DateFormat('HH:mm').format(dateTime);

  /// e.g. "Mar 5, 2026 14:30"
  static String dateTime(DateTime dt) =>
      DateFormat('MMM d, y HH:mm').format(dt);

  static DateTime? tryParse(String? value) {
    if (value == null) return null;
    try {
      return DateTime.parse(value);
    } catch (_) {
      return null;
    }
  }
}
