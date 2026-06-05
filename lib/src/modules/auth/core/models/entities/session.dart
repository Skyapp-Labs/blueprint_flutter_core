import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

/// A user's active device session from GET /auth/sessions.
@freezed
abstract class Session with _$Session {
  const factory Session({
    required String id,
    required String deviceInfo,
    required String ipAddress,
    required String createdAt,
    required String expiresAt,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}
