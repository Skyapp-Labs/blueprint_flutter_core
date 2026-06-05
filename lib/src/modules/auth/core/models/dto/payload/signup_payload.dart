import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_payload.freezed.dart';
part 'signup_payload.g.dart';

@freezed
abstract class SignupPayload with _$SignupPayload {
  const factory SignupPayload({
    String? verificationToken,
    String? email,
    String? password,
  }) = _SignupPayload;

  factory SignupPayload.fromJson(
    Map<String, dynamic> json,
  ) => _$SignupPayloadFromJson(json);
}