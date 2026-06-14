part of 'fx_overlay.dart';

enum FxDialogType {
  center,
  fullPage,
}

class FxDialog<T> extends StatefulWidget {
  const FxDialog._({
    super.key,
    required this.type,
    required this.options,
  });

  final FxDialogType type;
  final FxOverlayOptions<T> options;

  static Future<Result?> show<Result, T>(
    BuildContext context, {
    bool cancelable = true,
    FxDialogType type = FxDialogType.center,
    required FxOverlayOptions<T> options,
  }) => switch (type) {
    FxDialogType.center => _showCenter<Result, T>(
      context, 
      cancelable: cancelable, 
      options: options
    ),
    FxDialogType.fullPage => _showFullPage<Result, T>(
      context, 
      cancelable: cancelable, 
      options: options
    )
  };

  static Future<Result?> _showCenter<Result, T>(
    BuildContext context, {
    required bool cancelable,
    required FxOverlayOptions<T> options,
  })  => showDialog<Result>(
        context: context,
        useSafeArea: false,
        barrierDismissible: cancelable,
        builder: (context) => FxDialog._(
          type: FxDialogType.center,
          options: options,
        )
      );

  static Future<Result?> _showFullPage<Result, T>(
    BuildContext context, {
    required bool cancelable,
    required FxOverlayOptions<T> options,
  })  => showGeneralDialog<Result>(
          context: context,
          barrierColor: Colors.black54,
          barrierDismissible: cancelable,
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
          pageBuilder: (context, _, _) => FxDialog._(
            type: FxDialogType.fullPage,
            options: options,
          )
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

    return switch (widget.type) {
      FxDialogType.center => _buildCenterContent(),
      FxDialogType.fullPage => _buildFullPageContent(),
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
        child: FxOverlayView<T>(
          options: widget.options,
          scrollController: _scrollController,
        ),
      ),
    ),
  );

  Widget _buildFullPageContent() => Material(
    color: colorScheme.surface,
    child: SafeArea(
      child: FxOverlayView<T>(
        options: widget.options,
        scrollController: _scrollController
      )
    )
  );
}
