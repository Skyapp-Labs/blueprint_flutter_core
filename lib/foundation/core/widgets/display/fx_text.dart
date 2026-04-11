import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../fx_context.dart';

part 'fx_text_style.dart';

/// Callback fired when a tappable span is tapped.
/// [index] is the zero-based position among link spans only.
/// [text] is the raw content of the tapped span (without brackets).
typedef FxTextOnLinkTap = void Function(int index, String text);

/// A rich text widget that supports inline tappable spans using
/// a markdown-inspired bracket syntax.
///
/// Wrap any word or phrase in square brackets to make it tappable:
/// ```dart
/// FxText(
///   'By continuing you agree to our [Terms] and [Privacy Policy].',
///   onTap: (index, text) {
///     if (index == 0) openTerms();
///     if (index == 1) openPrivacy();
///   },
/// )
/// ```
///
/// Use [FxTextStyle] to control appearance. Link color defaults to
/// [ColorScheme.primary] when not explicitly set.
class FxText extends StatefulWidget {
  const FxText(
    this.text, {
    super.key,
    this.padding = EdgeInsets.zero,
    this.style = const FxTextStyle(),
    this.textAlign = TextAlign.start,
    this.onTap,
  });

  final String text;
  final EdgeInsets padding;
  final FxTextStyle style;
  final TextAlign textAlign;
  /// Called when a `[bracketed]` span is tapped.
  final FxTextOnLinkTap? onTap;

  @override
  State<FxText> createState() => _FxTextState();
}

class _FxTextState extends State<FxText> with FxUiToolkit {
  /// Tracks recognizers so they can be disposed and replaced on each rebuild.
  final List<TapGestureRecognizer> _recognizers = [];

  /// All text tokens parsed from [widget.text].
  late List<String> _tokens;

  /// Only the `[bracketed]` tokens, in order — used to resolve tap index.
  late List<String> _linkTokens;

  /// Resolved style, computed in [build] once theme context is available.
  late FxTextStyle _resolvedStyle;

  // ── Lifecycle ────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    _parseTokens();
  }

  @override
  void didUpdateWidget(FxText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) _parseTokens();
  }

  @override
  void dispose() {
    _disposeRecognizers();
    super.dispose();
  }

  // ── Parsing ──────────────────────────────────────────────────

  /// Splits [widget.text] into plain, link `[...]`, and newline tokens.
  void _parseTokens() {
    _tokens = RegExp(r'(\[.*?\]|[^\[\]\n]+|\n)')
        .allMatches(widget.text)
        .map((m) => m.group(0)!)
        .toList();

    _linkTokens = _tokens
        .where((t) => t.startsWith('[') && t.endsWith(']'))
        .toList();
  }

  // ── Recognizer management ────────────────────────────────────

  /// Disposes all tracked recognizers and clears the list.
  /// Called before every build and on widget disposal.
  void _disposeRecognizers() {
    for (final r in _recognizers) {
      r.dispose();
    }
    _recognizers.clear();
  }

  // ── Build ────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);
    _disposeRecognizers();

    // Fall back to theme defaults when not explicitly provided.
    _resolvedStyle = widget.style.copyWith(
      textStyle: widget.style.textStyle ?? typography.bodyMedium,
      linkColor: widget.style.linkColor ?? colors.primary,
      textAlign: widget.style.textAlign ?? widget.textAlign,
    );

    if (_tokens.isEmpty) return const SizedBox.shrink();

    final richText = RichText(
      overflow: _resolvedStyle.overflow,
      maxLines: _resolvedStyle.maxLines,
      textAlign: _resolvedStyle.textAlign ?? widget.textAlign,
      textScaler: TextScaler.linear(_resolvedStyle.textScale),
      text: TextSpan(
        style: _resolvedStyle.textStyle,
        children: List.generate(_tokens.length, _buildSpan),
      ),
    );

    if (widget.padding == EdgeInsets.zero) return richText;

    return Padding(
      padding: widget.padding,
      child: richText,
    );
  }

  // ── Span builders ────────────────────────────────────────────

  InlineSpan _buildSpan(int index) {
    final raw = _tokens[index];

    if (raw == '\n') {
      return const TextSpan(text: '\n');
    }

    final isLink = raw.startsWith('[') && raw.endsWith(']');
    final content = isLink ? raw.substring(1, raw.length - 1) : raw;

    if (!isLink) {
      return TextSpan(
        text: content,
        style: _resolvedStyle.getTextStyle,
      );
    }

    // Recognizer is tracked and disposed before the next rebuild.
    final recognizer = TapGestureRecognizer()
      ..onTap = () => _onLinkTapped(content);
    _recognizers.add(recognizer);

    return TextSpan(
      text: content,
      style: _resolvedStyle.getLinkTextStyle,
      recognizer: recognizer,
    );
  }

  void _onLinkTapped(String content) {
    final index = _linkTokens.indexWhere((t) => t == '[$content]');
    widget.onTap?.call(index, content);
  }
}
