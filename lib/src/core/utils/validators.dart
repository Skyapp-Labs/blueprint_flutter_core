/// Input validators for common field types.
///
/// Each validator returns null on success or an error string on failure,
/// compatible with Flutter's [FormField.validator] signature.
abstract final class Validators {
  static String? required(String? value, [String fieldName = 'This field']) {
    if (value == null || value.trim().isEmpty) return '$fieldName is required.';
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required.';
    final regex = RegExp(r'^[\w.+-]+@[\w-]+\.[a-zA-Z]{2,}$');
    if (!regex.hasMatch(value.trim())) return 'Enter a valid email address.';
    return null;
  }

  /// Validates E.164 phone number format (e.g. +2348012345678).
  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required.';
    }
    final regex = RegExp(r'^\+[1-9]\d{6,14}$');
    if (!regex.hasMatch(value.trim())) {
      return 'Enter a valid phone number with country code (e.g. +2348012345678).';
    }
    return null;
  }

  /// Minimum 8 characters, at least one letter and one number.
  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Password is required.';
    if (value.length < 8) return 'Password must be at least 8 characters.';
    if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
      return 'Password must contain at least one letter.';
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return 'Password must contain at least one number.';
    }
    return null;
  }

  static String? confirmPassword(String? value, String original) {
    if (value == null || value.isEmpty) return 'Please confirm your password.';
    if (value != original) return 'Passwords do not match.';
    return null;
  }

  static String? minLength(String? value, int min, [String? fieldName]) {
    final name = fieldName ?? 'This field';
    if (value == null || value.trim().length < min) {
      return '$name must be at least $min characters.';
    }
    return null;
  }

  static String? maxLength(String? value, int max, [String? fieldName]) {
    final name = fieldName ?? 'This field';
    if (value != null && value.trim().length > max) {
      return '$name must be at most $max characters.';
    }
    return null;
  }
}
