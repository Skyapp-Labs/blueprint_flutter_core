part of '_overlay.dart';

enum FxDialogStyle {
  /// Standard centered modal — for confirmations, alerts, short forms
  center,
  /// Covers the full screen — for complex forms, detail views
  fullPage
}

class FxDialog<T> extends StatefulWidget {

  final FxOverlayData<T> data;
  final FxDialogStyle style;

  const FxDialog._({
    super.key,
    required this.data,
    required this.style
  });

  static Future<T?> show<T>(
    BuildContext context,
    {
      /// Whether the dialog can be dismissed by tapping outside the dialog.
      bool cancelable = true,
      /// The style of the dialog: centered or full page. Default is centered.
      FxDialogStyle style = FxDialogStyle.center,
      /// The data for the dialog.
      required FxOverlayData<T> data,
    }
  ) => switch(style) {
    FxDialogStyle.center   => _showCenter(context, cancelable: cancelable, data: data),
    FxDialogStyle.fullPage => _showFullPage(context, cancelable: cancelable, data: data),
  };

  static Future<T?> _showCenter<T>(
    BuildContext context, {
    required bool cancelable,
    required FxOverlayData<T> data,
  }) => showDialog<T>(
    context: context,
    barrierDismissible: cancelable,
    useSafeArea: false,
    builder: (context) => FxDialog._(
      data: data,
      style: FxDialogStyle.center
    )
  );

  static Future<T?> _showFullPage<T>(
    BuildContext context, {
    required bool cancelable,
    required FxOverlayData<T> data,
  }) => showGeneralDialog<T>(
    context: context,
    barrierDismissible: cancelable,
    barrierLabel: 'Dismiss',
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 280),
    transitionBuilder: (context, animation, _, child) => SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),   // slides in from right — page-level navigation feel
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      )),
      child: child,
    ),
    pageBuilder: (context, _, _) => FxDialog._(
      data: data,
      style: FxDialogStyle.fullPage,
    ),
  );

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
      FxDialogStyle.center   => _buildCenterContent(),
      FxDialogStyle.fullPage => _buildFullPageContent(),
    };
  }

  Widget _buildCenterContent() => Center(
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
        child: IntrinsicHeight(
          child: FxOverlayView<T>(
            data: widget.data,
            scrollController: _scrollController,
          ),
        ),
      ),
    ),
  );

  Widget _buildFullPageContent() => Material(
    color: colorScheme.surface,
    child: SafeArea(
      child: FxOverlayView<T>(
        data: widget.data,
        scrollController: _scrollController,
      ),
    ),
  );
}
