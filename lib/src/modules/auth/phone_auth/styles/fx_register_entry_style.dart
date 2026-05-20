import 'package:blueprint_flutter_core/src/core/widgets/display/_display.dart';
import 'package:blueprint_flutter_core/src/core/widgets/layout/_layout.dart';
import 'package:flutter/material.dart';

class FxRegisterEntryStyle {
  const FxRegisterEntryStyle({
    this.title = 'Create your account',
    this.subtitle = 'Enter your details to create an account',
    this.buttonLabel = 'Create account',
    this.requireEmail = false,
    this.emailLookup = false,
    this.safeArea = const FxSafeAreaInsets(),
    this.padding = EdgeInsets.zero,
    this.titleStyle,
    this.subtitleStyle,
    this.firstNamePrefix,
    this.lastNamePrefix,
    this.emailPrefix,
    this.header,
    this.footer,
    this.spacing,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
  });

  /// The title text for the user details screen.
  final String? title;
  final FxTextStyle? titleStyle;
  /// The subtitle text for the user details screen.
  final String? subtitle;
  final FxTextStyle? subtitleStyle;
  /// The safe area for the user details screen.
  final FxSafeAreaInsets safeArea;
  /// The button label for the create account button.
  final String buttonLabel;
  /// The prefix widget for the first name input (supports SVG, Icon, etc.).
  final Widget? firstNamePrefix;
  /// The prefix widget for the last name input (supports SVG, Icon, etc.).
  final Widget? lastNamePrefix;
  /// The prefix widget for the email input (supports SVG, Icon, etc.).
  final Widget? emailPrefix;
  /// Whether to require email input.
  final bool requireEmail;
  /// If true, checks on blur whether the email belongs to an existing account.
  final bool emailLookup;
  /// The header widget for the phone entry screen.
  final Widget? header;
  /// The footer widget for the phone entry screen.
  final Widget Function(VoidCallback onSubmit, bool isLoading)? footer;
  /// The spacing for the phone entry screen.
  final double? spacing;
  /// The padding for the user details screen.
  final EdgeInsets padding;
  /// The main axis alignment for the phone entry screen.
  final MainAxisAlignment mainAxisAlignment;
  /// The cross axis alignment for the phone entry screen.
  final CrossAxisAlignment crossAxisAlignment;
}