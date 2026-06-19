import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pinput/pinput.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_pin_input_theme.dart';

class FxPinInput extends StatefulWidget {
  const FxPinInput({
    super.key,
    this.onCompleted,
    this.onChanged,
    this.errorText,
    this.obscureText = false,
    this.enabled = true,
    this.isLoading = false,
    this.length = 6,
    this.controller,
    this.focusNode,
  });

  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChanged;
  final int length;
  final String? errorText;
  final bool obscureText;
  final bool enabled;
  final bool isLoading;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  State<FxPinInput> createState() => FxPinInputState();
}

class FxPinInputState extends State<FxPinInput> 
    with FxUiToolkit {
      
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
  late final TextEditingController pinController;
  late final bool _ownsController;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) BrowserContextMenu.disableContextMenu();
    formKey = GlobalKey<FormState>();
    _ownsController = widget.controller == null;
    pinController = widget.controller ?? TextEditingController();
    focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (kIsWeb) BrowserContextMenu.enableContextMenu();
    if (_ownsController) pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant FxPinInput oldWidget) {
    if (oldWidget.errorText != widget.errorText) {
      pinController.clear();
    }
    super.didUpdateWidget(oldWidget);
  }

  FxPinInputTheme get pinTheme => themeData.pinInputTheme;

  PinTheme get defaultPinTheme => PinTheme(
    width: screenWidth * .12,
    height: pinTheme.height,
    margin: EdgeInsets.zero,
    padding: pinTheme.padding ?? EdgeInsets.symmetric(horizontal: sizes.md, vertical: sizes.lg),
    textStyle: pinTheme.textStyle,
    constraints: BoxConstraints(
      maxWidth: pinTheme.width ?? sizes.inputHeight,
      maxHeight: pinTheme.height ?? sizes.inputHeight,
    ),
    decoration: BoxDecoration(
      color: pinTheme.backgroundColor,
      borderRadius: pinTheme.borderRadiusFromInput,
      border: pinTheme.primaryBorder,
    ),
  );

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return Pinput(
      length: widget.length,
      enabled: widget.isLoading ? false : widget.enabled,
      focusNode: focusNode,
      controller: pinController,
      obscureText: widget.obscureText,
      errorText: widget.errorText,
      forceErrorState: widget.errorText?.isNotEmpty ?? false,
      errorTextStyle: pinTheme.errorTextStyle,
      defaultPinTheme: defaultPinTheme,
      crossAxisAlignment: CrossAxisAlignment.center,
      separatorBuilder: _buildSeparator,
      hapticFeedbackType: HapticFeedbackType.heavyImpact,
      onCompleted: widget.onCompleted,
      onChanged: widget.onChanged,
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: pinTheme.focusBorder
        )
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: pinTheme.primaryBorder,
        )
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: pinTheme.errorBorder,
        ),
      ),
    );
  }

  Widget _buildSeparator(int index) {
    final spacing = themeData.pinInputTheme.spacing ?? sizes.md;
    // final length = widget.length;
    // final indexPlusOne = index + 1;
    // final isSeparator = length % 3 == 0 && indexPlusOne > 0 && indexPlusOne % 3 == 0;

    // if (isSeparator) {
    //   return Container(
    //     margin: EdgeInsets.only(
    //       right: spacing * .5,
    //       left: spacing * .5,
    //     ),
    //     color: colorScheme.outline, 
    //     width: sizes.sm, 
    //     height: sizes.xs * .5
    //   );
    // }
    return Container(
      width: screenWidth * .025,
      constraints: BoxConstraints(maxWidth: spacing)
    );
  }
}
