import 'package:blueprint_flutter_core/src/modules/security/security_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'security_controller.g.dart';

/// Central auth controller. Handles both [AuthMethod.phone] and [AuthMethod.email].
///
/// Delegates each domain to a focused mixin:
/// - Phone OTP flow → [_PhoneAuthMixin]
/// - Email + password → [_EmailAuthMixin]
/// - Password reset / change → [_PasswordMixin]
/// - Session management → [_SessionMixin]
/// - Invite acceptance → [_InviteMixin]
///
/// Inject via: `ref.watch(authControllerProvider)`
/// State: [AuthState]
@riverpod
class SecurityController extends _$SecurityController {

  @override
  SecurityState build() => SecurityState();

  void initializePinScreen() {
    state = state.copyWith(stepView: PinStepView.verifyPin);
  }

  void setConfirmPin(String confirmPin) {
    state = state.copyWith(confirmPin: confirmPin);
  }

  void goTo(PinStepView stepView) {
    state = state.copyWith(stepView: stepView);
  }

  Future<void> onVerifyPinPressed({required String pin}) async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 2));

    state = state.copyWith(isLoading: false, error: 'Invalid PIN');
  }

  Future<void> createPin() async {
    state = state.copyWith(stepView: PinStepView.createPin);
  }

  Future<void> confirmPin() async {
    state = state.copyWith(stepView: PinStepView.confirmPin);
  }

  Future<void> forgotPin() async {
    state = state.copyWith(stepView: PinStepView.resetPin);
  }
}