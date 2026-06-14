import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';

class FxDottedDividerThemeData {
  const FxDottedDividerThemeData({
    this.color,
    this.strokeWidth = 1,
    this.dashWidth = 5,
    this.dashSpace = 3,
  });

  final Color? color;
  final double? strokeWidth;
  final double? dashWidth;
  final double? dashSpace;
}

class FxDottedDivider extends StatelessWidget with FxUiToolkit {

	final Color? color;
	final double? thickness;
	final double? dashWidth;
	final double? dashSpace;

	FxDottedDivider({
		super.key,
		this.color,
		this.thickness,
		this.dashWidth,
		this.dashSpace,
	});

  factory FxDottedDivider.fromThemeData(FxDottedDividerThemeData themeData) {
    return FxDottedDivider(
      color: themeData.color,
      thickness: themeData.strokeWidth,
      dashWidth: themeData.dashWidth,
      dashSpace: themeData.dashSpace,
    );
  }

	@override
	Widget build(BuildContext context) {
    setToolkitContext(context);

    if(dashWidth == null || dashSpace == null || dashWidth == 0 || dashSpace == 0) {
      return Divider(
        color: color ?? colorScheme.outline,
        height: thickness ?? sizes.inputBorderWidth,
        thickness: thickness ?? sizes.inputBorderWidth,
      );
    }

    return CustomPaint(
      size: const Size.fromHeight(1),
      painter: _DottedLinePainter(
        color: color ?? colorScheme.outline,
        strokeWidth: thickness ?? sizes.inputBorderWidth,
        dashWidth: dashWidth ?? sizes.sm,
        dashSpace: dashSpace ?? sizes.xs,
      )
    );
  }
}

class _DottedLinePainter extends CustomPainter with FxUiToolkit {

	final Color? color;
	final double? strokeWidth;
	final double? dashWidth;
	final double? dashSpace;

	_DottedLinePainter({
		this.color,
		this.strokeWidth = 1,
		this.dashWidth = 5.0,
		this.dashSpace = 3.0,
	});

	@override
	void paint(Canvas canvas, Size size) {
		final paint = Paint()
			..color = color ?? Colors.grey.shade300
			..strokeWidth = strokeWidth ?? 1;

		final double localDashWidth = dashWidth ?? 5.0;
		final double localDashSpace = dashSpace ?? 3.0;
		double startX = 0;

		while (startX < size.width) {
			canvas.drawLine(
				Offset(startX, 0),
				Offset(startX + localDashWidth, 0),
				paint,
			);
			startX += localDashWidth + localDashSpace;
		}
	}

	@override
	bool shouldRepaint(CustomPainter oldDelegate) => false;
}
