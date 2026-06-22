import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/overlay/fx_overlay.dart';
import 'package:blueprint_flutter_core/src/modules/security/security_controller.dart';
import 'package:blueprint_flutter_core/src/modules/security/security_state.dart';
import 'package:blueprint_flutter_core/src/modules/security/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LockScreen extends ConsumerStatefulWidget {
  const LockScreen({
    super.key,
    this.length = 6,
    this.pinType = 'authentication',
    this.onUnlocked,
  });

  /// The type of PIN to check.
  final String pinType;
  /// When null, [FxConfig.pinLength] is used.
  final int length;
  /// Called after PIN verification succeeds and home access is granted.
  final VoidCallback? onUnlocked;

  static Future<bool?> asDialog(
    BuildContext context, {
    int length = 4,
    String pinType = 'authentication',
    VoidCallback? onUnlocked,
  }) =>
      showFxOverlay<bool, dynamic>(
        context,
        type: FxOverlayType.modal,
        useSafeArea: false,
        options: FxOverlayOptions.builder(
          builder: (context) => LockScreen(
            length: length,
            pinType: pinType,
            onUnlocked: onUnlocked,
          ),
        ),
      );

  @override
  ConsumerState<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends ConsumerState<LockScreen> with FxUiToolkit {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!mounted) return;
      final pinType = widget.pinType;
      final securityController = ref.read(securityControllerProvider.notifier);

      securityController.setPinLength(length: widget.length);
      securityController.checkPinStatus(pinType: pinType);
    });
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);
    
    return Scaffold(
      body: SafeArea(
        child: _buildBody()
      )
    );
  }

  Widget _buildBody() {
    final state = ref.watch(securityControllerProvider);
    final transitionTheme = componentTheme.switchingViewTransition();

    return AnimatedSwitcher(
      duration: transitionTheme.duration,
      switchInCurve: transitionTheme.switchInCurve,
      switchOutCurve: transitionTheme.switchOutCurve,
      transitionBuilder: (child, animation) {
        // final isForward = (flow.previousStep?.stepIndex ?? 0) < flow.step!.stepIndex;

        return componentTheme
          .switchingViewTransition(isForward: false)
          .transitionBuilder(child, animation);
      },
      layoutBuilder: transitionTheme.layoutBuilder,
      reverseDuration: transitionTheme.reverseDuration,
      child: switch (state.stepView) {
        PinStepView.verifyPin => VerifyPinView(
          onUnlocked: widget.onUnlocked,
        ),
        PinStepView.createPin => CreatePinView(),
        PinStepView.resetPin => ResetPinView(),
        PinStepView.confirmCreatePin => CreatePinView(isConfirming: true),
        PinStepView.confirmChangePin => ChangePinView(isConfirming: true),
        null => Center(child: CircularProgressIndicator())
      },
    );
  }
}