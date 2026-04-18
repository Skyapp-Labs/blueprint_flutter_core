part of '_overlay.dart';

class FxOverlayView<T> extends StatelessWidget with FxUiToolkit {

	final bool isScrollable;
	final ScrollController scrollController;
	final FxOverlayData<T> data;
	/// When false, suppresses the title rendering — used by [FxBottomSheetContainer]
	/// which owns the title area above the handle separately.
	final bool showTitle;

	FxOverlayView({
		super.key,
		this.isScrollable = true,
		this.showTitle = true,
		required this.data,
		required this.scrollController,
	});

	@override
	Widget build(BuildContext context) {
		setToolkitContext(context);

		final hasTitle = showTitle && data.title != null;

		if(!hasTitle) return _buildBodyContent(context);

		return Column(
			spacing: sizes.sm,
			crossAxisAlignment: CrossAxisAlignment.stretch,
			children: [
				_buildTitle(data.title!),
				Expanded(child: _buildBodyContent(context)),
			]
		);
	}

  Widget _buildTitle(String text) => Padding(
		padding: EdgeInsets.only(
			top: sizes.sm,
		),
		child: Text(
			text,
			textAlign: TextAlign.center,
			style: typography.titleMedium.copyWith(
				color: colors.onSurface,
				fontWeight: FontWeight.w600,
			)
		)
	);


  Widget _buildBodyContent(BuildContext context) {
		if(data.list != null) {
			return FxOverlayListView(
				data: data.list!,
				scrollController: scrollController,
			);
		}

		return FxOverlayContainer(
			data: data,
			isScrollable: isScrollable,
			scrollController: scrollController
		);
	}
}
