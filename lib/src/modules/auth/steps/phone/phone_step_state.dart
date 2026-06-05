import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_step_state.freezed.dart';

@freezed
abstract class PhoneStepState with _$PhoneStepState {
  const factory PhoneStepState({
    String? phone,
    String? countryCode,
    String? formattedPhone,
    @Default(false) bool isLoading,
    String? error,
  }) = _PhoneStepState;
}