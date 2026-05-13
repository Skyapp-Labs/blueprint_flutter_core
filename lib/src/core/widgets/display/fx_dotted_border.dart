import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';

class FxDottedDivider extends StatelessWidget with FxUiToolkit {

	final Color? color;
	final double? strokeWidth;
	final double? dashWidth;
	final double? dashSpace;

	FxDottedDivider({
		super.key,
		this.color,
		this.strokeWidth,
		this.dashWidth,
		this.dashSpace,
	});

	@override
	Widget build(BuildContext context) {
    setToolkitContext(context);

    return CustomPaint(
      size: const Size.fromHeight(1),
      painter: _DottedLinePainter(
        color: color ?? colorScheme.outline,
        strokeWidth: strokeWidth ?? sizes.inputBorderWidth,
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
