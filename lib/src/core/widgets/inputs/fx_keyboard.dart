import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_keyboard_theme.dart';
import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';

class FxKeyboard extends StatefulWidget {
	final Widget? action;
  final int? maxLength;
	final void Function()? onActionPressed;
	final bool enabled;
	final Function(String)? onChange;
	final Function(String)? onSubmit;
	final TextEditingController? controller;

	const FxKeyboard({
		super.key,
		this.maxLength,
		this.enabled = true,
		this.onChange,
		this.onSubmit,
		this.action,
		this.onActionPressed,
		this.controller,
	});

  @override
  State<FxKeyboard> createState() => _FxKeyboardState();
}

class _FxKeyboardState extends State<FxKeyboard> with FxUiToolkit {
	final List<int> keys = [1,2,3,4,5,6,7,8,9,111,0,222];
  late final TextEditingController _controller;
  late final bool _ownsController;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _ownsController = widget.controller == null;
  }

  @override
  void dispose() {
    if (_ownsController) _controller.dispose();
    super.dispose();
  }

  Size get keySize => keyboardTheme.keySize ?? Size(sizes.inputHeight, sizes.inputHeight);

  FxKeyboardTheme get keyboardTheme => themeData.keyboardTheme;

	@override
	Widget build(BuildContext context) {
		setToolkitContext(context);

    return Align(
      alignment: Alignment.center,
      child: Container(
        width: themeData.keyboardTheme.constraints?.minWidth,
        constraints: themeData.keyboardTheme.constraints,
        child: _buildGridView(),
      )
    );
	}

  Widget _buildGridView() => GridView.builder(
    physics: const NeverScrollableScrollPhysics(),
    padding: keyboardTheme.padding ?? EdgeInsets.zero,
    itemCount: keys.length,
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: keyboardTheme.keyAspectRatio ?? keySize.width / keySize.height,
      mainAxisSpacing: keyboardTheme.spacing,
      crossAxisSpacing: keyboardTheme.spacing,
    ),
    itemBuilder: (context, index) => Align(
      alignment: Alignment.center, 
      child: SizedBox(
        width: keySize.width, 
        height: keySize.height, 
        child: _buildItem(keys[index])
      )
    )
  );

  Widget _buildItem(int input) {
    if (input < 10) return _buttonWidget(input);
    return iconButtonWidget(input);
  }

	Widget _buttonWidget(int buttonText) => _iconButton(
		onTap: () {
			if (_controller.text.length == widget.maxLength) return;
			_controller.text = '${_controller.text}$buttonText';
			if (widget.onChange != null) widget.onChange!(_controller.text);
			if (_controller.text.length != widget.maxLength) return;
			if (widget.onSubmit != null) widget.onSubmit!(_controller.text);
		},
		child: Text(
			buttonText.toString(),
			style: keyboardTheme.textStyle,
			textAlign: TextAlign.center,
		)
	);

	Widget iconButtonWidget(int input) => 
  _iconButton(
		color: Colors.transparent,
		onTap: () {
			if(input != 111) return onDelete();
			if(widget.onActionPressed != null) return widget.onActionPressed?.call();
		},
		child: input == 111
			? widget.action ?? const SizedBox.shrink()
			: Icon(
				Icons.keyboard_arrow_left_outlined,
				size: keySize.width * 0.5,
				color: keyboardTheme.foreground
			)
	);

	void onDelete() {
		if(_controller.text.isEmpty) return;
		_controller.text = _controller.text.substring(
			0,
			_controller.text.length - 1
		);
		widget.onChange?.call(_controller.text);
	}

	Widget _iconButton({
		Color? color,
		required Widget child,
		required void Function() onTap,
	}) => AnimatedOpacity(
		opacity: widget.enabled ? 1.0 : .5,
		duration: Duration(milliseconds: 300),
		child: Material(
			color: color ?? keyboardTheme.background, // Ensures ripple is visible
			shape: keyboardTheme.shape,
      shadowColor: Colors.transparent,
      elevation: 0,
			child: InkWell(
				customBorder: keyboardTheme.shape,
				onTap: widget.enabled ? onTap : null,
				child: Container(
					alignment: Alignment.center,
					padding: keyboardTheme.keyPadding,
					child: child
				)
			)
		)
	);
}
