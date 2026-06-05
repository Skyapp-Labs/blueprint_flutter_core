part of 'fx_overlay.dart';

/// Routes [FxOverlayData] to a list picker or custom body.
class FxOverlayView<T> extends StatelessWidget with FxUiToolkit {
  FxOverlayView({
    super.key,
    this.isScrollable = true,
    this.showTitle = true,
    required this.data,
    required this.scrollController,
  });

  final bool isScrollable;
  final ScrollController scrollController;
  final FxOverlayData<T> data;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    final body = _buildBodyContent(context);
    if (!showTitle || data.title == null) return body;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: sizes.sm,
      children: [
        _buildTitle(data.title!),
        Expanded(child: body),
      ],
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
    if (data.list != null) {
      final list = FxOverlayList<T>(
        data: data.list!,
        scrollController: scrollController,
        showMultiSelectFooter: data.footer == null,
      );

      final footer = data.footer?.call(context);
      if (footer == null) return list;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: list),
          footer,
        ],
      );
    }

    return FxOverlayBody<T>(
      data: data,
      isScrollable: isScrollable,
      scrollController: scrollController,
    );
  }
}
