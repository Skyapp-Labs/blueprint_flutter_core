import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_keyboard.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_pin_input.dart';
import 'package:flutter/material.dart';

export 'verify_pin.dart';
export 'create_pin.dart';
export 'change_pin.dart';
export 'reset_pin.dart';

class PinStepTemplate extends StatefulWidget {
  const PinStepTemplate({
    super.key,
    required this.title,
    required this.subtitle,
    this.length = 4,
    this.onBackPressed,
    this.isLoading = false,
    this.error,
    this.onCompleted,
    this.onActionPressed,
    this.action,
  });

  final String title;
  final String subtitle;
  final int length;
  final bool isLoading;
  final String? error;
  final Widget? action;
  final Function(String)? onCompleted;
  final Function()? onActionPressed;
  final Function()? onBackPressed;

  @override
  State<PinStepTemplate> createState() => _PinStepTemplateState();
}

class _PinStepTemplateState extends State<PinStepTemplate> with FxUiToolkit {

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

  Widget _buildBody() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Expanded(
        child: Column(
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
            SizedBox(height: sizes.xl),
            FxPinInput(
              length: widget.length,
              controller: pinController,
              errorText: widget.error,
              isLoading: widget.isLoading,
              onCompleted: widget.onCompleted,
            )
          ],
        )
      ),
      FxKeyboard(
        enabled: !widget.isLoading,
        controller: pinController,
        action: widget.action,
        onActionPressed: widget.onActionPressed,
      ),
    ],
  );
}