part of 'fx_overlay.dart';

/// Bottom sheet chrome: handle, title, and [FxOverlayView] body.
class FxBottomSheetShell<T> extends StatelessWidget with FxUiToolkit {
  FxBottomSheetShell({
    super.key,
    required this.options,
    required this.scrollController,
    required this.sheetController,
    required this.minChildSize,
    required this.maxChildSize,
  });

  final double minChildSize;
  final double maxChildSize;
  final ScrollController scrollController;
  final FxOverlayOptions<T> options;
  final DraggableScrollableController sheetController;

  double get _radius => sizes.overlayRadius;
  double get _borderWidth => sizes.overlayBorderWidth;

  BorderRadius get _borderRadius => BorderRadius.only(
        topLeft: Radius.circular(_radius),
        topRight: Radius.circular(_radius),
      );

  BoxBorder get _border {
    final borderSide = BorderSide(color: colors.outline, width: _borderWidth);
    return Border(top: borderSide, left: borderSide, right: borderSide);
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: safePadding.bottom),
      decoration: BoxDecoration(
        color: colors.surface,
        border: _border,
        borderRadius: _borderRadius,
      ),
      child: ClipRRect(
        borderRadius: _borderRadius.copyWith(
          topLeft: Radius.circular(_radius - _borderWidth),
          topRight: Radius.circular(_radius - _borderWidth),
        ),
        child: Stack(
          children: [
            _buildBody(context),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: _buildHandle(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final handleArea = sizes.overlayHandleHeight + sizes.overlayHandleMargin;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: handleArea),
        if (options.title != null) _buildTitle(options.title!),
        Expanded(
          child: FxOverlayView<T>(
            options: options,
            scrollController: scrollController,
            showTitle: false,
          )
        )
      ]
    );
  }

  Widget _buildTitle(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizes.md, vertical: sizes.xs),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: typography.titleMedium.copyWith(
          color: colors.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragUpdate: (details) => _onHandleDrag(context, details),
      child: Center(
        child: Container(
          width: sizes.overlayHandleWidth,
          height: sizes.overlayHandleHeight,
          margin: EdgeInsets.only(top: sizes.overlayHandleMargin),
          decoration: BoxDecoration(
            color: colors.outline,
            borderRadius: BorderRadius.circular(sizes.radiusMd),
          ),
        ),
      ),
    );
  }

  void _onHandleDrag(BuildContext context, DragUpdateDetails details) {
    if (!sheetController.isAttached) return;
    final delta = -(details.primaryDelta ?? 0) / screenHeight;
    final newSize =
        (sheetController.size + delta).clamp(minChildSize, maxChildSize);
    sheetController.jumpTo(newSize);
  }
}
