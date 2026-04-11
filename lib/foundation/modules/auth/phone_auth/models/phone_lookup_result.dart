import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_lookup_result.freezed.dart';
part 'phone_lookup_result.g.dart';

/// Result of POST /auth/verify-otp.
/// Branches based on whether the user already has an account.
@freezed
abstract class PhoneLookupResult with _$PhoneLookupResult {
  const factory PhoneLookupResult({
    /// Whether the OTP was verified.
    required bool verified,

    /// Whether the user has an account.
    required bool hasAccount,

    /// Present when [hasAccount] is true.
    /// Use to call POST /auth/login or POST /auth/register with the token.
    String? phoneGrantToken,

    /// The phone number that was verified.
    String? phoneNumber,
  }) = _PhoneLookupResult;

  factory PhoneLookupResult.fromJson(Map<String, dynamic> json) =>
      _$PhoneLookupResultFromJson(json);
}
