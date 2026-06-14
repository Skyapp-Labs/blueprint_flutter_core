part of 'fx_overlay.dart';

class FxBottomSheet<T> extends StatelessWidget {
  const FxBottomSheet._({
    super.key,
    required this.options,
    required this.maxChildSize,
    required this.minChildSize,
    required this.scrollController,
    required this.sheetController,
  });

  final double maxChildSize;
  final double minChildSize;
  final ScrollController scrollController;
  final FxOverlayOptions<T> options;
  final DraggableScrollableController sheetController;

  static Future<R?> show<R, T>(
    BuildContext context, {
    bool cancelable = true,
    bool allowFullHeight = true,
    Color backgroundColor = Colors.transparent,
    double maxChildSize = 0.9,
    double minChildSize = 0.25,
    double initialChildSize = 0.5,
    required FxOverlayOptions<T> options,
  }) {
    final sheetController = DraggableScrollableController();

    return showModalBottomSheet<R>(
      context: context,
      isDismissible: cancelable,
      backgroundColor: backgroundColor,
      isScrollControlled: allowFullHeight,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        maxChildSize: maxChildSize,
        minChildSize: minChildSize,
        controller: sheetController,
        initialChildSize: initialChildSize,
        builder: (context, scrollController) => FxBottomSheet._(
          options: options,
          maxChildSize: maxChildSize,
          minChildSize: minChildSize,
          sheetController: sheetController,
          scrollController: scrollController,
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) => FxBottomSheetShell<T>(
    options: options,
    scrollController: scrollController,
    sheetController: sheetController,
    minChildSize: minChildSize,
    maxChildSize: maxChildSize,
  );
}
