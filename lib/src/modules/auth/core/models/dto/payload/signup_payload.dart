import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_payload.freezed.dart';
part 'signup_payload.g.dart';

@JsonSerializable()
class SignupProfilePayload {
  const SignupProfilePayload({
    this.firstName,
    this.lastName,
    this.displayName,
    this.dateOfBirth,
    this.username,
    this.gender,
  });

  final String? firstName;
  final String? lastName;
  final String? displayName;
  final String? dateOfBirth;
  final String? username;
  final String? gender;

  factory SignupProfilePayload.fromJson(Map<String, dynamic> json) =>
      _$SignupProfilePayloadFromJson(json);
  Map<String, dynamic> toJson() => _$SignupProfilePayloadToJson(this);
}

@freezed
abstract class SignupPayload with _$SignupPayload {
  const factory SignupPayload({
    String? verificationToken,
    String? email,
    String? password,
    String? phoneNumber,
    // String? countryCode,
    @Default(SignupProfilePayload()) SignupProfilePayload profile,
  }) = _SignupPayload;

  factory SignupPayload.fromJson(
    Map<String, dynamic> json,
  ) => _$SignupPayloadFromJson(json);
}