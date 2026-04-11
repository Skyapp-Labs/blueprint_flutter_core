import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// Represents an authenticated user decoded from the JWT payload
/// and/or fetched from GET /users/me.
@freezed
abstract class AuthUser with _$AuthUser {
  const factory AuthUser({
    required String id,
    required String firstName,
    required String lastName,
    String? email,
    String? phoneNumber,
    String? countryCode,
    @Default([]) List<String> permissions,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);

  const AuthUser._();

  String get fullName => '$firstName $lastName'.trim();

  bool hasPermission(String permission) => permissions.contains(permission);
}
