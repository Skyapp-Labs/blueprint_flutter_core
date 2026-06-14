import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_payload.freezed.dart';
part 'forgot_password_payload.g.dart';

@freezed
abstract class ForgotPasswordPayload with _$ForgotPasswordPayload {
  const factory ForgotPasswordPayload({
    required String email
  }) = _ForgotPasswordPayload;

  factory ForgotPasswordPayload.fromJson(
    Map<String, dynamic> json,
  ) => _$ForgotPasswordPayloadFromJson(json);
}