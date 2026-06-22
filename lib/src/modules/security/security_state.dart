import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_state.freezed.dart';

enum PinStepView {
  verifyPin,
  createPin,
  confirmCreatePin,
  confirmChangePin,
  resetPin,
}

@freezed
abstract class SecurityState with _$SecurityState {
  const factory SecurityState({
    String? pin,
    String? confirmPin,
    PinStepView? stepView,
    @Default(4) int pinLength,
    @Default(false) bool isLoading,
    @Default(false) bool isSessionUnlocked,
    @Default('authentication') String pinType,
    String? error,
  }) = _SecurityState;

  factory SecurityState.initial() => const SecurityState();
}