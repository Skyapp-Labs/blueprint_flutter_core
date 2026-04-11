import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_registration.freezed.dart';
part 'device_registration.g.dart';

enum DeviceType { ios, android, web }

@freezed
abstract class DeviceRegistration with _$DeviceRegistration {
  const factory DeviceRegistration({
    required String fcmToken,
    required DeviceType deviceType,
    required String deviceName,
  }) = _DeviceRegistration;

  factory DeviceRegistration.fromJson(Map<String, dynamic> json) =>
      _$DeviceRegistrationFromJson(json);
}
