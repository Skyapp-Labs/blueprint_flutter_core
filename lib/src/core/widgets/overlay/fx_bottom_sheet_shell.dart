part of 'fx_overlay.dart';

/// Bottom sheet chrome: handle, title, and [FxOverlayView] body.
class FxBottomSheetShell<T> extends StatefulWidget with FxUiToolkit {
  FxBottomSheetShell({
    super.key,
    required this.type,
    required this.options,
    this.useSafeArea = true,
    this.scrollController,
    this.sheetController,
    this.bottomSheetOptions,
  });

  final FxOverlayType type;
  final bool useSafeArea;
  final ScrollController? scrollController;
  final FxOverlayOptions<T> options;
  final FxBottomSheetOptions? bottomSheetOptions;
  final DraggableScrollableController? sheetController;

  @override
  State<FxBottomSheetShell<T>> createState() => _FxBottomSheetShellState<T>();
}

class _FxBottomSheetShellState<T> extends State<FxBottomSheetShell<T>> with FxUiToolkit {
  late ScrollController _scrollController;

  bool get showHandle => (
    widget.type == FxOverlayType.bottomSheet &&
    widget.sheetController != null &&
    widget.sheetController!.isAttached &&
    widget.bottomSheetOptions != null
  );

  FxOverlayThemeData get overlayTheme => themeData.overlayTheme;

  BoxConstraints? get constraints {
    if (widget.type != FxOverlayType.dialog) return null;
    return BoxConstraints(
      minWidth: isTablet ? 300 : screenWidth * .5,
      maxWidth: isTablet ? 520 : screenWidth * .85,
      minHeight: screenHeight * 0.2,
      maxHeight: screenHeight * 0.7,
    );
  }

  BoxDecoration get decoration => switch (widget.type) {
    FxOverlayType.dialog => overlayTheme.dialogDecoration,
    FxOverlayType.modal => overlayTheme.modalDecoration,
    FxOverlayType.bottomSheet => overlayTheme.bottomSheetDecoration,
  };

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
  }

  @override
  void dispose() {
    if(widget.type != FxOverlayType.bottomSheet) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    if (!showHandle) {
      return _buildContainer(
        context, 
        child: _buildBody(context)
      );
    }
    
    return _buildContainer(
      context, 
      child: Stack(
        children: [
          _buildBody(context),
          _buildHandle(context),
        ],
      )
    );
  }

  Widget _buildContainer(BuildContext context, {required Widget child}) => Container(
    width: (constraints?.maxWidth ?? double.infinity),
    height: (constraints?.maxHeight ?? double.infinity),
    decoration: decoration,
    constraints: constraints ?? BoxConstraints.expand(),
    child: ClipRRect(
      borderRadius: decoration.borderRadius ?? BorderRadius.zero,
      child: widget.useSafeArea ? SafeArea(child: child) : child
    ),
  );

  Positioned _buildHandle(BuildContext context) => Positioned(
    top: overlayTheme.handleMargin,
    left: 0,
    right: 0,
    child: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragUpdate: (details) => _onHandleDrag(context, details),
      child: Center(
        child: Container(
          width: overlayTheme.handleSize.width,
          height: overlayTheme.handleSize.height,
          decoration: overlayTheme.handleDecoration,
        )
      )
    )
  );

  Widget _buildBody(BuildContext context) {
    final body = FxOverlayView<T>(
      options: widget.options,
      scrollController: _scrollController,
      showTitle: false
    );

    if (widget.options.title == null) return body;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: showHandle 
            ? overlayTheme.handleHeight 
            : overlayTheme.horizontalTitleGap
        ),
        Text(
          widget.options.title!,
          textAlign: overlayTheme.titleAlignment,
          style: overlayTheme.titleStyle,
        ),
        SizedBox(height: overlayTheme.horizontalTitleGap),
        Expanded( child: body )
      ]
    );
  }

  void _onHandleDrag(BuildContext context, DragUpdateDetails details) {
    if (widget.sheetController == null || widget.bottomSheetOptions == null) return;
    if (!widget.sheetController!.isAttached) return;
    final delta = -(details.primaryDelta ?? 0) / screenHeight;
    final newSize = (widget.sheetController!.size + delta)
        .clamp(widget.bottomSheetOptions!.minChildSize, widget.bottomSheetOptions!.maxChildSize);
    widget.sheetController!.jumpTo(newSize);
  }
}
