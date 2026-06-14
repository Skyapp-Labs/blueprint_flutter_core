import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_step_state.freezed.dart';

@freezed
abstract class EmailStepState with _$EmailStepState {
  const factory EmailStepState({
    String? email,
    String? password,
    @Default(false) bool isLoading,
    String? error,
  }) = _EmailStepState;
}