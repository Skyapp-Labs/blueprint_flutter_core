import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_keyboard.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_pin_input.dart';
import 'package:blueprint_flutter_core/src/modules/security/security_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'verify_pin.dart';
export 'create_pin.dart';
export 'change_pin.dart';
export 'reset_pin.dart';

class PinStepTemplate extends ConsumerStatefulWidget {
  const PinStepTemplate({
    super.key,
    required this.title,
    required this.subtitle,
    this.onBackPressed,
    this.onCompleted,
    this.onActionPressed,
    this.action,
  });

  final String title;
  final String subtitle;
  final Widget? action;
  final Function(String)? onCompleted;
  final Function()? onActionPressed;
  final Function()? onBackPressed;

  @override
  ConsumerState<PinStepTemplate> createState() => _PinStepTemplateState();
}

class _PinStepTemplateState extends ConsumerState<PinStepTemplate> with FxUiToolkit {

  late final TextEditingController pinController;

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    ref.listen(securityControllerProvider, (previous, next) {
      if (previous?.stepView != next.stepView) pinController.clear();
    });

    if (widget.onBackPressed == null) return _buildBody();

    return Stack(
      children: [
        _buildBody(),
        Positioned(
          top: 0,
          left: sizes.md,
          right: 0,
          height: kToolbarHeight,
          child: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: widget.onBackPressed,
              icon: context.componentTheme.navigateBackIcon,
            )
          )
        )
      ]
    );
  }

  Widget _buildBody() {
    final state = ref.watch(securityControllerProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHeading(),
              SizedBox(height: sizes.xl),
              FxPinInput(
                length: state.pinLength,
                controller: pinController,
                errorText: state.error,
                obscureText: true,
                isLoading: state.isLoading,
                onCompleted: widget.onCompleted,
              )
            ]
          )
        ),
        FxKeyboard(
          action: widget.action,
          enabled: !state.isLoading,
          maxLength: state.pinLength,
          controller: pinController,
          onActionPressed: widget.onActionPressed,
        ),
      ],
    );
  }

  Widget _buildHeading() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        widget.title, 
        style: theme.textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: sizes.xs),
      Text(
        widget.subtitle,
        style: theme.textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    ]
  );
}