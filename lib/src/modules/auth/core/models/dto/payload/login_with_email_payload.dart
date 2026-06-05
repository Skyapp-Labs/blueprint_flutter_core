import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_with_email_payload.freezed.dart';
part 'login_with_email_payload.g.dart';

@freezed
abstract class LoginWithEmailPayload with _$LoginWithEmailPayload {
  const factory LoginWithEmailPayload({
    required String email,
    required String password,
  }) = _LoginWithEmailPayload;

  factory LoginWithEmailPayload.fromJson(
    Map<String, dynamic> json,
  ) => _$LoginWithEmailPayloadFromJson(json);
}