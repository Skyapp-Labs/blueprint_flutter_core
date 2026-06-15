part of '_steps.dart';

/// Visual layout for an auth step shell.
@immutable
class AuthStepLayout {
  const AuthStepLayout({
    this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.actionLabel = 'Continue',
    this.contentPadding,
    this.contentSpacing,
    this.headerSpacing,
    this.textAlign = TextAlign.center,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    this.titleOnTap,
    this.subtitleOnTap,
  });

  final String? title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final void Function(int position, String text)? titleOnTap;
  final void Function(int position, String text)? subtitleOnTap;
  final String actionLabel;
  final EdgeInsets? contentPadding;
  final double? contentSpacing;
  final double? headerSpacing;
  final TextAlign textAlign;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  bool get hasHeaderContent => title != null || subtitle != null;

  AuthStepLayout copyWith({
    String? title,
    String? subtitle,
  }) => AuthStepLayout(
    title: title ?? this.title,
    subtitle: subtitle ?? this.subtitle,
    titleStyle: titleStyle,
    subtitleStyle: subtitleStyle,
    titleOnTap: titleOnTap,
    subtitleOnTap: subtitleOnTap,
    actionLabel: actionLabel,
    contentPadding: contentPadding,
    contentSpacing: contentSpacing,
    headerSpacing: headerSpacing,
    textAlign: textAlign,
    mainAxisAlignment: mainAxisAlignment,
    crossAxisAlignment: crossAxisAlignment,
  );
}
