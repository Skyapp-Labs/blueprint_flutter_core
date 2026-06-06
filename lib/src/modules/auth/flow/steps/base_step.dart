part of '_steps.dart';

abstract class BaseStep with FxUiToolkit {
  late WidgetRef _ref;
  late BuildContext _context;

  bool _isInitialized = false;

  void initView(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;
    _isInitialized = true;
    setToolkitContext(context);
  }

  BuildContext get context {
    if (!_isInitialized) throw Exception('Context not initialized');
    return _context;
  }

  WidgetRef get ref {
    if (!_isInitialized) throw Exception('Ref not initialized');
    return _ref;
  }

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

  void goTo(AuthStep step) {
    final flowController = ref.read(authFlowControllerProvider.notifier);
    flowController.goToStep(step);
  }

  String get key;

  String? get title => null;

  String? get subtitle => null;

  String get actionLabel => 'Continue';

  bool get hasTopContent => title != null || subtitle != null;

  double get spacing => sizes.md;

  double get topContentSpacing => sizes.md;

  TextAlign get textAlign => TextAlign.center;

  CrossAxisAlignment get crossAxisAlignment => CrossAxisAlignment.center;

  MainAxisAlignment get mainAxisAlignment => MainAxisAlignment.center;

  EdgeInsets get padding => EdgeInsets.symmetric(horizontal: sizes.md);

  TextStyle? get titleStyle => null;

  TextStyle? get subtitleStyle => null;

  Widget titleWidget() => Text(
    title!, 
    style: titleStyle ?? typography.headlineSmall,
    textAlign: TextAlign.center,
  );

  Widget subtitleWidget() => Text(
    subtitle!, 
    style: subtitleStyle ?? typography.bodyMedium,
    textAlign: TextAlign.center,
  );

  Widget footer() => const SizedBox.shrink();

  PreferredSizeWidget? header() => null;

  Widget bottomContent() => const SizedBox.shrink();

  Widget topContent() {
    if (title == null && subtitle == null) return const SizedBox.shrink();

    final crossAxisAlignment = switch (textAlign) {
      TextAlign.start => CrossAxisAlignment.start,
      TextAlign.end => CrossAxisAlignment.end,
      TextAlign.center => CrossAxisAlignment.center,
      TextAlign.left => CrossAxisAlignment.start,
      TextAlign.right => CrossAxisAlignment.end,
      _ => CrossAxisAlignment.center,
    };

    return Padding(
      padding: EdgeInsets.only(bottom: topContentSpacing),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          if (title != null) titleWidget(),
          if (subtitle != null) subtitleWidget(),
        ]
      )
    );
  }

  Widget build(BuildContext ctx, WidgetRef reference, {required List<Widget> children}) {
    initView(ctx, reference);

    return FxScrollableForm(
      key: ValueKey(key),
      header: header(),
      footer: footer(),
      // safeArea: safeArea,
      padding: padding,
      spacing: spacing,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        if(hasTopContent) topContent(),
        ...children,
        bottomContent(),
      ]
    );
  }
}