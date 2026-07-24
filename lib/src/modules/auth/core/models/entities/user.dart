import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// Represents an authenticated user decoded from the JWT payload
/// and/or fetched from GET /users/me.
@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required int onboardingStep,
    required bool isEmailVerified,
    required bool isPhoneVerified,
    required bool isProfileCompleted,
    required String status,
    required String displayName,
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? phoneNumber,
    String? countryCode,
    @Default([]) List<String> roles,
  }) = _User;


  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  const User._();
}
