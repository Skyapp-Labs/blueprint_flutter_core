part of '_steps.dart';

abstract class BaseStep with FxUiToolkit {

  void initView(BuildContext context) => setToolkitContext(context);

  TextEditingController? _textController;

  TextEditingController get textController => _textController ??= TextEditingController();

  void dispose() {
    _textController?.dispose();
    _textController = null;
  }

  void setTextController(TextEditingController controller) {
    _textController?.dispose();
    _textController = controller;
  }

  String get key;

  String? get title => null;

  String? get subtitle => null;

  String get actionLabel => 'Continue';

  bool get hasTopContent => title != null || subtitle != null;

  double get spacing => sizes.xs;

  TextAlign get textAlign => TextAlign.center;

  CrossAxisAlignment get crossAxisAlignment => CrossAxisAlignment.center;

  MainAxisAlignment get mainAxisAlignment => MainAxisAlignment.center;

  EdgeInsets get padding => EdgeInsets.symmetric(horizontal: sizes.md);

  TextStyle? get titleStyle => null;

  TextStyle? get subtitleStyle => null;

  Widget titleWidget(BuildContext context) => Text(
    title!, 
    style: titleStyle ?? typography.headlineSmall,
    textAlign: TextAlign.center,
  );

  Widget subtitleWidget(BuildContext context) => Text(
    subtitle!, 
    style: subtitleStyle ?? typography.bodyMedium,
    textAlign: TextAlign.center,
  );

  Widget footer(BuildContext context) => const SizedBox.shrink();

  PreferredSizeWidget? header(BuildContext context) => null;

  Widget bottomContent(BuildContext context) => const SizedBox.shrink();

  Widget topContent(BuildContext context) {
    if (title == null && subtitle == null) return const SizedBox.shrink();

    final crossAxisAlignment = switch (textAlign) {
      TextAlign.start => CrossAxisAlignment.start,
      TextAlign.end => CrossAxisAlignment.end,
      TextAlign.center => CrossAxisAlignment.center,
      TextAlign.left => CrossAxisAlignment.start,
      TextAlign.right => CrossAxisAlignment.end,
      _ => CrossAxisAlignment.center,
    };

    return Column(
      spacing: spacing,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        if (title != null) titleWidget(context),
        if (subtitle != null) subtitleWidget(context),
      ]
    );
  }

  Widget build(BuildContext context, {required List<Widget> children}) {
    initView(context);

    return FxScrollableForm(
      key: ValueKey(key),
      header: header(context),
      footer: footer(context),
      // safeArea: safeArea,
      padding: padding,
      // spacing: style.spacing,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        if(hasTopContent) ...[
          topContent(context),
          SizedBox(height: sizes.xs),
        ],
        ...children,
        bottomContent(context),
      ]
    );
  }
}