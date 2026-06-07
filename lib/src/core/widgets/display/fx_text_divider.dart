import 'package:blueprint_flutter_core/src/core/widgets/display/fx_dotted_border.dart';
import 'package:flutter/material.dart';

class FxTextDivider extends StatelessWidget {
  const FxTextDivider({
    super.key,
    required this.text,
    this.style,
    this.color,
    this.align = TextAlign.center,
    this.spacing = 16,
    this.dashWidth = 5,
    this.dashSpace = 0,
    this.strokeWidth = 1,
  });

  final Color? color;
  final String text;
  final double dashWidth;
  final double dashSpace;
  final double spacing;
  final double strokeWidth;
  final TextStyle? style;
  final TextAlign align;

  bool get isStartAlign => [TextAlign.start, TextAlign.left].contains(align);
  bool get isEndAlign => [TextAlign.end, TextAlign.right].contains(align);

  @override
  Widget build(BuildContext context) {
    if(text.isEmpty) return _buildDivider();
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: spacing,
      children: [
        if(isStartAlign == false) Expanded(child: _buildDivider()),
        Text(text, style: style),
        if(isEndAlign == false) Expanded(child: _buildDivider()),
      ],
    );
  }

  Widget _buildDivider() {
    if(strokeWidth < 1) return const SizedBox.shrink();
    
    if(dashWidth < 1 || dashSpace < 1) {
      return Divider(
        color: color,
        height: strokeWidth,
        thickness: strokeWidth,
      );
    }

    return FxDottedDivider(
      color: color,
      dashWidth: dashWidth,
      dashSpace: dashSpace,
      thickness: strokeWidth,
    );
  }
}