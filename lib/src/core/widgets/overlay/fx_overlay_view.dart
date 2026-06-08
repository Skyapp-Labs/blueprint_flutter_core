part of 'fx_overlay.dart';

/// Routes [FxOverlayData] to a list picker or custom body.
class FxOverlayView<T> extends StatelessWidget with FxUiToolkit {
  FxOverlayView({
    super.key,
    this.showTitle = true,
    this.isScrollable = true,
    required this.options,
    required this.scrollController,
  });

  final bool showTitle;
  final bool isScrollable;
  final ScrollController scrollController;
  final FxOverlayOptions<T> options;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    final body = _buildBodyContent(context);
    
    if (!showTitle || options.title == null) return body;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: sizes.sm,
      children: [
        _buildTitle(options.title!),
        Expanded(child: body),
      ]
    );
  }

  Widget _buildTitle(String text) {
    final closeButton = FxIconButton(
      icon: componentTheme.navigateBackIcon,
      onPressed: () => pop(),
      size: sizes.iconSm,
    );

    return Padding(
      padding: EdgeInsets.only(right: sizes.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            closeButton,
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.left,
                style: theme.appBarTheme.titleTextStyle?.copyWith(
                  height: 1
                ),
              )
            ),
          ]
        )
    );
  }

  Widget _buildBodyContent(BuildContext context) {
    if (options.mode != FxOverlayMode.builder) {
      return FxOverlayList<T>(
        options: options,
        scrollController: scrollController,
      );
    }

    return FxOverlayBody<T>(
      options: options,
      isScrollable: isScrollable,
      scrollController: scrollController,
    );
  }
}
