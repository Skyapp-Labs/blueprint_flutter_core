abstract final class TextFormatter {
  /// Capitalises the first letter of each word.
  static String titleCase(String value) => value
      .split(' ')
      .map(
        (w) =>
            w.isEmpty ? w : w[0].toUpperCase() + w.substring(1).toLowerCase(),
      )
      .join(' ');

  /// Returns initials from a full name (e.g. "John Doe" → "JD").
  static String initials(String fullName, {int maxLetters = 2}) {
    final parts = fullName.trim().split(RegExp(r'\s+'));
    return parts
        .take(maxLetters)
        .map((p) => p.isEmpty ? '' : p[0].toUpperCase())
        .join();
  }

  /// Truncates text with an ellipsis if it exceeds [maxLength].
  static String truncate(String value, int maxLength) {
    if (value.length <= maxLength) return value;
    return '${value.substring(0, maxLength)}…';
  }

  /// Masks a string leaving [visibleEnd] characters visible.
  /// e.g. maskEmail("john@example.com") → "j***@example.com"
  static String maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;
    final name = parts[0];
    final masked =
        name.length <= 1 ? name : '${name[0]}${'*' * (name.length - 1)}';
    return '$masked@${parts[1]}';
  }
}
