import 'package:blueprint_flutter_core/src/core/widgets/display/_display.dart';
import 'package:blueprint_flutter_core/src/core/widgets/layout/_layout.dart';
import 'package:flutter/material.dart';

class FxPhoneEntryStyle {
  const FxPhoneEntryStyle({
    this.title = 'Enter your phone number',
    this.subtitle = "We'll send you a verification code",
    this.flagShape = FxFlagShape.circle,
    this.flagSize = 28,
    this.buttonLabel = 'Send code',
    this.keyboardBuilder,
    this.header,
    this.footer,
    this.safeArea = const FxSafeAreaInsets(),
    this.padding = EdgeInsets.zero,
    this.spacing,
    this.otherWidgets = const [],
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
  });

  /// The title text for the phone entry screen.
  final String? title;
  /// The subtitle text for the phone entry screen.
  final String? subtitle;
  /// The flag shape for the phone entry screen.
  final FxFlagShape flagShape;
  /// The flag size for the phone entry screen.
  final double flagSize;
  /// The button label for the send code button.
  final String buttonLabel;
  /// The header widget for the phone entry screen.
  final Widget? header;
  /// The footer widget for the phone entry screen.
  final Widget? footer;
  /// The safe area for the phone entry screen.
  final FxSafeAreaInsets safeArea;
  /// The padding for the phone entry screen.
  final EdgeInsets padding;
  /// The spacing for the phone entry screen.
  final double? spacing;
  /// The main axis alignment for the phone entry screen.
  final MainAxisAlignment mainAxisAlignment;
  /// The cross axis alignment for the phone entry screen.
  final CrossAxisAlignment crossAxisAlignment;
  /// The other widgets for the phone entry screen.
  final List<Widget> otherWidgets;
  /// The keyboard builder for the phone entry screen.
  final Widget Function(TextEditingController phoneController)? keyboardBuilder;
}