import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_lookup_result.freezed.dart';
part 'phone_lookup_result.g.dart';

@JsonSerializable()
class PhoneLookupDataResponse {

  final String subject;
  final String channel;
  final String verificationToken;
  final int expiresAt;
  final bool hasAccount;

  const PhoneLookupDataResponse({
    required this.subject,
    required this.channel,
    required this.verificationToken,
    required this.expiresAt,
    required this.hasAccount,
  });

  factory PhoneLookupDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PhoneLookupDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneLookupDataResponseToJson(this);
}

/// Result of POST /auth/verify-otp.
/// Branches based on whether the user already has an account.
@freezed
abstract class PhoneLookupResult with _$PhoneLookupResult {
  const factory PhoneLookupResult({
    required bool success,
    required String message,
    required PhoneLookupDataResponse data,
  }) = _PhoneLookupResult;

  factory PhoneLookupResult.fromJson(Map<String, dynamic> json) =>
      _$PhoneLookupResultFromJson(json);
}
