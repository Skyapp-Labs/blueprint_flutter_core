part of 'fx_overlay.dart';

enum FxDialogStyle {
  center,
  fullPage,
}

class FxDialog<T> extends StatefulWidget {
  const FxDialog._({
    super.key,
    required this.data,
    required this.style,
  });

  final FxOverlayData<T> data;
  final FxDialogStyle style;

  static Future<R?> show<R, I>(
    BuildContext context, {
    bool cancelable = true,
    FxDialogStyle style = FxDialogStyle.center,
    required FxOverlayData<I> data,
  }) {
    return switch (style) {
      FxDialogStyle.center =>
        _showCenter<R, I>(context, cancelable: cancelable, data: data),
      FxDialogStyle.fullPage =>
        _showFullPage<R, I>(context, cancelable: cancelable, data: data),
    };
  }

  static Future<R?> _showCenter<R, I>(
    BuildContext context, {
    required bool cancelable,
    required FxOverlayData<I> data,
  }) {
    return showDialog<R>(
      context: context,
      barrierDismissible: cancelable,
      useSafeArea: false,
      builder: (context) => FxDialog._(data: data, style: FxDialogStyle.center),
    );
  }

  static Future<R?> _showFullPage<R, I>(
    BuildContext context, {
    required bool cancelable,
    required FxOverlayData<I> data,
  }) {
    return showGeneralDialog<R>(
      context: context,
      barrierDismissible: cancelable,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 280),
      transitionBuilder: (context, animation, _, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          )),
          child: child,
        );
      },
      pageBuilder: (context, _, _) =>
          FxDialog._(data: data, style: FxDialogStyle.fullPage),
    );
  }

  @override
  State<FxDialog<T>> createState() => _FxDialogState<T>();
}

class _FxDialogState<T> extends State<FxDialog<T>> with FxUiToolkit {
  late final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return switch (widget.style) {
      FxDialogStyle.center => _buildCenterContent(),
      FxDialogStyle.fullPage => _buildFullPageContent(),
    };
  }

  Widget _buildCenterContent() {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: isTablet ? 300 : screenWidth * .5,
          maxWidth: isTablet ? 520 : screenWidth * .8,
          minHeight: screenHeight * 0.2,
          maxHeight: screenHeight * 0.85,
        ),
        child: Material(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(sizes.radiusLg),
          clipBehavior: Clip.antiAlias,
          child: FxOverlayView<T>(
            data: widget.data,
            scrollController: _scrollController,
          ),
        ),
      ),
    );
  }

  Widget _buildFullPageContent() {
    return Material(
      color: colorScheme.surface,
      child: SafeArea(
        child: FxOverlayView<T>(
          data: widget.data,
          scrollController: _scrollController
        ),
      ),
    );
  }
}
