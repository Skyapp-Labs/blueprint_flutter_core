import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

/// A user's active device session from GET /auth/sessions.
@freezed
abstract class AuthSession with _$AuthSession {
  const factory AuthSession({
    required String id,
    required String deviceInfo,
    required String ipAddress,
    required String createdAt,
    required String expiresAt,
  }) = _AuthSession;

  factory AuthSession.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionFromJson(json);
}
