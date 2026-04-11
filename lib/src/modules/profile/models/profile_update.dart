import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_update.freezed.dart';
part 'profile_update.g.dart';

/// Body for PATCH /users/me
@freezed
abstract class ProfileUpdate with _$ProfileUpdate {
  const factory ProfileUpdate({
    String? firstName,
    String? lastName,
    String? email,
  }) = _ProfileUpdate;

  factory ProfileUpdate.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateFromJson(json);
}
