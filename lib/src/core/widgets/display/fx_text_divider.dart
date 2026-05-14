import 'package:blueprint_flutter_core/src/core/widgets/display/fx_dotted_border.dart';
import 'package:flutter/material.dart';

class FxTextDivider extends StatelessWidget {
  const FxTextDivider({
    super.key,
    required this.text,
    this.style,
    this.isDotted = false,
    this.dashWidth,
    this.dashSpace,
    this.spacing = 16,
    this.color,
    this.strokeWidth,
  });

  final bool isDotted;
  final String text;
  final TextStyle? style;
  final double? dashWidth;
  final double? dashSpace;
  final double spacing;
  final Color? color;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) => Row(
    spacing: spacing,
    children: [
      Expanded(child: _buildDivider()),
      Text(text, style: style),
      Expanded(child: _buildDivider()),
    ],
  );

  Widget _buildDivider() {
    if (isDotted) {
      return FxDottedDivider(
        dashWidth: dashWidth,
        dashSpace: dashSpace,
        color: color,
        strokeWidth: strokeWidth,
      );
    }

    return Divider(
      color: color,
      thickness: strokeWidth,
    );
  }
}