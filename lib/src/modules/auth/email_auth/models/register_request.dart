import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request.freezed.dart';
part 'register_request.g.dart';

/// Request body for [AuthMethod.email] registration.
@freezed
abstract class EmailRegisterRequest with _$EmailRegisterRequest {
  const factory EmailRegisterRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    String? phone,
    String? countryCode,
  }) = _EmailRegisterRequest;

  factory EmailRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$EmailRegisterRequestFromJson(json);
}
