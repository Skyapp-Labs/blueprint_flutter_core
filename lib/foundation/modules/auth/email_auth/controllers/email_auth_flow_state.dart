import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_auth_flow_state.freezed.dart';

enum FxEmailAuthStep { login, register, forgotPassword }

@freezed
abstract class EmailAuthFlowState with _$EmailAuthFlowState {
  const factory EmailAuthFlowState({
    String? email,
    @Default(FxEmailAuthStep.login) FxEmailAuthStep step,
    @Default(false) bool isLoading,
    String? error,
  }) = _EmailAuthFlowState;
}
