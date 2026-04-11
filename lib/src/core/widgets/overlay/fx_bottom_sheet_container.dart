part of '_index.dart';

class FxBottomSheetContainer<T> extends StatelessWidget with FxUiToolkit {

  FxBottomSheetContainer({
    super.key,
    required this.data,
    required this.scrollController,
    required this.sheetController,
    required this.minChildSize,
    required this.maxChildSize,
  });

  final FxOverlayData<T> data;
	final ScrollController scrollController;
	final DraggableScrollableController sheetController;
  final double minChildSize;
  final double maxChildSize;

  double get _radius => sizes.overlayRadius;
	double get _borderWidth => sizes.overlayBorderWidth;

	BorderRadius get _borderRadius => BorderRadius.only(
		topLeft: Radius.circular(_radius),
		topRight: Radius.circular(_radius),
		bottomLeft: Radius.zero,
		bottomRight: Radius.zero,
	);

	BoxBorder get _border {
    final borderSide = BorderSide(color: colors.outline, width: _borderWidth);
    return Border( top: borderSide, left: borderSide, right: borderSide );
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
					topRight: Radius.circular(_radius - _borderWidth)
				),
				child: Stack(
					children: [
						_buildBody(context),
						Positioned(
							top: 0,
							left: 0,
							right: 0,
							child: _buildHandle(context)
						)
					]
				)
			)
		);
	}

	Widget _buildBody(BuildContext context) {
    final handleArea = sizes.overlayHandleHeight + sizes.overlayHandleMargin;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Reserve space for the handle — always present
        SizedBox(height: handleArea),
        // Title rendered here, not inside FxOverlayView, to avoid overlap with handle
        if(data.title != null) _buildTitle(data.title!),
        Expanded(
          child: FxOverlayView(
            data: data,
            scrollController: scrollController,
            isScrollable: true,
            showTitle: false,  // title already rendered above
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(String text) => Padding(
    padding: EdgeInsets.symmetric(
      horizontal: sizes.md,
      vertical: sizes.xs,
    ),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: typography.titleMedium.copyWith(
        color: colors.onSurface,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

	Widget _buildHandle(BuildContext context) => GestureDetector(
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
				)
			)
		),
	);

  void _onHandleDrag(BuildContext context, DragUpdateDetails details) {
    if (!sheetController.isAttached) return;
    final delta = -(details.primaryDelta ?? 0) / screenHeight;
    final newSize = (sheetController.size + delta).clamp(minChildSize, maxChildSize);
    sheetController.jumpTo(newSize);
  }
}
