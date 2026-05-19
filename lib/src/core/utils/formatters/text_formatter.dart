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

  /// Masks digit characters for safe display.
  ///
  /// Non-digits (`+`, spaces, `-`, `()`) are kept as-is.
  /// Example: `+1 415 555 2671` with [visibleEndDigits] 4 → `+1 ••• ••• 2671`
  static String maskPhoneNumber(
    String phone, {
    int visibleStartDigits = 0,
    int visibleEndDigits = 4,
    String maskChar = '•',
  }) {
    if (phone.isEmpty) return phone;

    final digitPositions = <int>[
      for (var i = 0; i < phone.length; i++)
        if (_isDigit(phone.codeUnitAt(i))) i,
    ];

    final count = digitPositions.length;

    if (count == 0) return phone;

    if (count <= visibleStartDigits + visibleEndDigits) return phone;

    final chars = phone.split('');

    for (var d = 0; d < count; d++) {
      final show =
          d < visibleStartDigits || d >= count - visibleEndDigits;
      if (!show) chars[digitPositions[d]] = maskChar;
    }
    
    return chars.join();
  }

  static bool _isDigit(int codeUnit) => codeUnit >= 0x30 && codeUnit <= 0x39;
}
