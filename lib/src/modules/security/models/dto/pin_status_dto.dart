import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_status_dto.freezed.dart';
part 'pin_status_dto.g.dart';

@freezed
abstract class PinStatusDto with _$PinStatusDto {
  const factory PinStatusDto({
    required bool isSet,
    required bool isLocked,
    required String type,
    required int length,
  }) = _PinStatusDto;

  factory PinStatusDto.fromJson(Map<String, dynamic> json) =>
      _$PinStatusDtoFromJson(json);
}