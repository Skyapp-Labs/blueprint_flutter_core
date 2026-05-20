import 'package:freezed_annotation/freezed_annotation.dart';

part 'fx_device_registration.freezed.dart';
part 'fx_device_registration.g.dart';

enum DeviceType { ios, android, web }

@freezed
abstract class FxDeviceRegistration with _$FxDeviceRegistration {
  const factory FxDeviceRegistration({
    required String fcmToken,
    required DeviceType deviceType,
    required String deviceName,
  }) = _FxDeviceRegistration;

  factory FxDeviceRegistration.fromJson(Map<String, dynamic> json) =>
      _$FxDeviceRegistrationFromJson(json);
}
