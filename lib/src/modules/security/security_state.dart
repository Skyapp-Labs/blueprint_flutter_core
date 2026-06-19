import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_state.freezed.dart';

enum PinStepView {
  verifyPin,
  createPin,
  confirmPin,
  resetPin,
}

@freezed
abstract class SecurityState with _$SecurityState {
  const factory SecurityState({
    String? pin,
    String? confirmPin,
    PinStepView? stepView,
    @Default(false) bool isLoading,
    String? error,
  }) = _SecurityState;

  factory SecurityState.initial() => const SecurityState();
}