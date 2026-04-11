part of '_index.dart';

class FxBottomSheet<T> extends StatelessWidget {

  final FxOverlayData<T> data;
	final double maxChildSize;
	final double minChildSize;
	final ScrollController scrollController;
	final DraggableScrollableController sheetController;

  const FxBottomSheet._({
    super.key,
    required this.data,
    required this.maxChildSize,
    required this.minChildSize,
    required this.scrollController,
    required this.sheetController
  });

  static Future<T?> show<T>(
    BuildContext context,
    {
      /// Whether the bottom sheet can be dismissed by tapping outside.
      bool cancelable = true,
      /// Allows the sheet to expand to full screen height.
      /// Set to true when content needs more than half the screen (e.g. long lists, forms).
      bool allowFullHeight = true,
      /// The background color of the bottom sheet.
      Color backgroundColor = Colors.transparent,
      /// The maximum fraction of screen height the sheet can occupy.
      double maxChildSize = 0.9,
      /// The minimum fraction of screen height the sheet can occupy.
      double minChildSize = 0.25,
      /// The initial fraction of screen height the sheet occupies when opened.
      double initialChildSize = 0.5,
      /// The data for the bottom sheet.
      required FxOverlayData<T> data
    }
  ) {
    final sheetController = DraggableScrollableController();

    return showModalBottomSheet<T>(
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
          data: data,
          maxChildSize: maxChildSize,
          minChildSize: minChildSize,
          sheetController: sheetController,
          scrollController: scrollController
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) => FxBottomSheetContainer<T>(
    data: data,
    scrollController: scrollController,
    sheetController: sheetController,
    minChildSize: minChildSize,
    maxChildSize: maxChildSize,
  );
}
