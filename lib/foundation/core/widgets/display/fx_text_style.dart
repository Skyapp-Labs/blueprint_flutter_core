part of 'fx_text.dart';

/// Visual configuration for [FxText].
///
/// Pass to [FxText.style] to control typography, color, and link appearance.
/// Use [FxTextStyle.fromStyle] to derive from an existing [TextStyle].
///
/// ```dart
/// FxText(
///   'Read our [Terms].',
///   style: FxTextStyle.fromStyle(theme.bodySmall).copyWith(
///     linkColor: Colors.blue,
///   ),
/// )
/// ```
class FxTextStyle {
  const FxTextStyle({
    this.color,
    this.size,
    this.height,
    this.textScale = 1.0,
    this.textStyle,
    this.maxLines,
    this.overflow = TextOverflow.clip,
    this.textAlign,
    this.fontWeight,
    this.linkColor,
    this.linkFontWeight = FontWeight.w500,
  });

  /// Derives an [FxTextStyle] from a Flutter [TextStyle].
  factory FxTextStyle.fromStyle(TextStyle style) => FxTextStyle(
        color: style.color,
        size: style.fontSize,
        height: style.height,
        textStyle: style,
        fontWeight: style.fontWeight,
      );

  final Color? color;
  final double? size;
  final double? height;
  final double textScale;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextOverflow overflow;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  /// Color applied to tappable spans. Defaults to [ColorScheme.primary].
  final Color? linkColor;

  /// Font weight applied to tappable spans. Defaults to [FontWeight.w500].
  final FontWeight? linkFontWeight;

  FxTextStyle copyWith({
    Color? color,
    double? size,
    double? height,
    double? textScale,
    TextStyle? textStyle,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    FontWeight? fontWeight,
    Color? linkColor,
    FontWeight? linkFontWeight,
  }) =>
      FxTextStyle(
        color: color ?? this.color,
        size: size ?? this.size,
        height: height ?? this.height,
        textScale: textScale ?? this.textScale,
        textStyle: textStyle ?? this.textStyle,
        textAlign: textAlign ?? this.textAlign,
        maxLines: maxLines ?? this.maxLines,
        overflow: overflow ?? this.overflow,
        fontWeight: fontWeight ?? this.fontWeight,
        linkColor: linkColor ?? this.linkColor,
        linkFontWeight: linkFontWeight ?? this.linkFontWeight,
      );

  /// Base [TextStyle] with color, size, height, and weight applied.
  TextStyle get getTextStyle {
    final base = textStyle ?? const TextStyle();
    return base.copyWith(
      color: color ?? base.color,
      fontSize: size ?? base.fontSize,
      height: height ?? base.height,
      fontWeight: fontWeight ?? base.fontWeight,
    );
  }

  /// [TextStyle] for tappable spans — applies [linkColor] and [linkFontWeight].
  TextStyle get getLinkTextStyle => getTextStyle.copyWith(
        color: linkColor,
        fontWeight: linkFontWeight,
      );
}
