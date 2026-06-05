import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_with_token_payload.freezed.dart';
part 'login_with_token_payload.g.dart';

@freezed
abstract class LoginWithTokenPayload with _$LoginWithTokenPayload {
  const factory LoginWithTokenPayload({
    required String verificationToken,
  }) = _LoginWithTokenPayload;

  factory LoginWithTokenPayload.fromJson(
    Map<String, dynamic> json,
  ) => _$LoginWithTokenPayloadFromJson(json);
}