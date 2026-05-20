import 'package:freezed_annotation/freezed_annotation.dart';

part 'fx_notification.freezed.dart';
part 'fx_notification.g.dart';

@freezed
abstract class FxNotification with _$FxNotification {
  const factory FxNotification({
    required String id,
    required String title,
    required String body,
    @Default(false) bool read,
    required String createdAt,
    Map<String, dynamic>? data,
  }) = _FxNotification;

  factory FxNotification.fromJson(Map<String, dynamic> json) =>
      _$FxNotificationFromJson(json);
}
