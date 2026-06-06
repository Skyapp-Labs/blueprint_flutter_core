part of '_steps.dart';

/// Presentation template for a single auth-flow step.
///
/// Subclasses customize copy and optional chrome (app bar/footer).
/// Step screens own form state, controllers, and Riverpod logic.
abstract class AuthStepTemplate {
  const AuthStepTemplate();

  /// Stable step identity — not a Flutter [Key].
  String get stepId;

  /// Layout defaults for this step.
  AuthStepLayout get layout => const AuthStepLayout();

  /// Convenience accessors for step screens.
  String get actionLabel => layout.actionLabel;
  String? get title => layout.title;
  String? get subtitle => layout.subtitle;

  /// Optional app bar for this step.
  PreferredSizeWidget? buildAppBar(
    BuildContext context,
    WidgetRef ref,
  ) => null;

  /// Optional sticky footer below scroll content.
  Widget? buildFooter(
    BuildContext context,
    WidgetRef ref,
  ) => null;

  /// Optional content appended after the main body.
  Widget? buildTrailingContent(
    BuildContext context,
    WidgetRef ref,
  ) => null;

  /// Wraps [body] in the shared auth step shell.
  Widget buildShell({
    required BuildContext context,
    required WidgetRef ref,
    required List<Widget> body,
  }) {
    return _AuthStepShell(
      stepId: stepId,
      layout: layout,
      appBar: buildAppBar(context, ref),
      footer: buildFooter(context, ref),
      trailingContent: buildTrailingContent(context, ref),
      body: body,
    );
  }
}

class _AuthStepShell extends ConsumerWidget with FxUiToolkit {
  _AuthStepShell({
    required this.stepId,
    required this.layout,
    required this.body,
    this.appBar,
    this.footer,
    this.trailingContent,
  });

  final String stepId;
  final AuthStepLayout layout;
  final List<Widget> body;
  final PreferredSizeWidget? appBar;
  final Widget? footer;
  final Widget? trailingContent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setToolkitContext(context);

    return FxScrollableForm(
      key: ValueKey(stepId),
      header: appBar,
      footer: footer,
      padding: layout.contentPadding ?? EdgeInsets.symmetric(horizontal: sizes.md),
      spacing: layout.contentSpacing ?? sizes.md,
      mainAxisAlignment: layout.mainAxisAlignment,
      crossAxisAlignment: layout.crossAxisAlignment,
      children: [
        if (layout.hasHeaderContent) _StepHeader(layout: layout),
        ...body,
        ?trailingContent,
      ],
    );
  }
}

class _StepHeader extends StatelessWidget with FxUiToolkit {
  _StepHeader({required this.layout});

  final AuthStepLayout layout;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    final crossAxisAlignment = switch (layout.textAlign) {
      TextAlign.start || TextAlign.left => CrossAxisAlignment.start,
      TextAlign.end || TextAlign.right => CrossAxisAlignment.end,
      _ => CrossAxisAlignment.center,
    };

    return Padding(
      padding: EdgeInsets.only(bottom: layout.headerSpacing ?? sizes.md),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          if (layout.title != null)
            Text(
              layout.title!,
              style: layout.titleStyle ?? typography.headlineSmall,
              textAlign: layout.textAlign,
            ),
          if (layout.subtitle != null)
            Text(
              layout.subtitle!,
              style: layout.subtitleStyle ?? typography.bodyMedium,
              textAlign: layout.textAlign,
            ),
        ],
      ),
    );
  }
}

/// Navigation helper for step templates and footers.
extension AuthStepNavigation on WidgetRef {
  void goToAuthStep(AuthStep step) {
    read(authFlowControllerProvider.notifier).goToStep(step);
  }

  void goToNextAuthStep() {
    read(authFlowControllerProvider.notifier).goToNextStep();
  }

  void goToPreviousAuthStep() {
    read(authFlowControllerProvider.notifier).goToPreviousStep();
  }
}
