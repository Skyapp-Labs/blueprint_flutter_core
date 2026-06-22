import 'package:blueprint_flutter_core/src/core/network/network_providers.dart';
import 'package:blueprint_flutter_core/src/modules/security/security_state.dart';
import 'package:blueprint_flutter_core/src/modules/security/services/pin_service.dart';
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
  
  late final PinService _pinService;

  @override
  SecurityState build() {
    _pinService = PinService(ref.read(fxServiceProvider));
    return SecurityState();
  }

  void setPinLength({required int length}) {
    state = state.copyWith(pinLength: length);
  }

  bool setPin({String? pin, required bool isConfirming}) {
    if (isConfirming == false) {
      state = state.copyWith(pin: pin);
      return true;
    }

    if (pin == state.pin) return true;

    state = state.copyWith(
      pin: null, 
      error: 'PINs do not match, please try again'
    );

    return false;
  }

  void goTo(PinStepView stepView) {
    state = state.copyWith(stepView: stepView);
  }

  Future<void> checkPinStatus({required String pinType}) async {
    final hasPin = await _pinService.hasPin(pinType);
    hasPin.when(
      success: (response) {
        state = state.copyWith(
          stepView: response.isSet == true ? PinStepView.verifyPin : PinStepView.createPin,
          pinType: response.type,
          pinLength: response.length,
        );
      },
      failure: (error) {
        state = state.copyWith(error: error.message);
      }
    );
  }

  Future<void> onVerifyPin({required String pin}) async {
    state = state.copyWith(isLoading: true, error: null, pin: pin);

    final result = await _pinService.verifyPin(state.pinType, pin);
    result.when(
      success: (response) {
        state = state.copyWith(isLoading: false, error: null, isSessionUnlocked: true);
        return true;
      },
      failure: (error) {
        state = state.copyWith(isLoading: false, error: error.message);
        return false;
      }
    );
  }

  Future<void> onCreatePin(String pin, {bool isConfirming = false}) async {
    final isValid = setPin(pin: pin, isConfirming: isConfirming);
    if (!isValid) {
      goTo(PinStepView.createPin);
      return;
    }
    if (!isConfirming) {
      goTo(PinStepView.confirmCreatePin);
      return;
    }
  
    state = state.copyWith(isLoading: true, error: null);
    final result = await _pinService.createPin(state.pinType, pin);
    result.when(
      success: (response) {
        state = state.copyWith(isLoading: false, error: null);
        goTo(PinStepView.verifyPin);
      },
      failure: (error) {
        state = state.copyWith(isLoading: false, error: error.message);
        goTo(PinStepView.createPin);
      }
    );
  }

  Future<void> forgotPin() async {
    state = state.copyWith(stepView: PinStepView.resetPin);
  }
}