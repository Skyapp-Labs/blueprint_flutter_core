import 'package:easy_copy_with_annotation/easy_copy_with_annotation.dart';
import 'package:flutter/cupertino.dart';

import 'package:blueprint_flutter_core/src/core/utils/screen_util.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/buttons/_buttons.dart';

part 'fx_empty_state.g.dart';

class FxStateStyle {
  const FxStateStyle({
    this.iconColor,
    this.iconSize,
    this.titleStyle,
    this.descriptionStyle,
    this.actionForegroundColor,
    this.actionBorderColor,
  });

  final Color? iconColor;
  final double? iconSize;

  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;

  final Color? actionForegroundColor;
  final Color? actionBorderColor;
}

@CopyWith()
class FxStateData {
  const FxStateData({
    this.icon = const Icon(CupertinoIcons.info),
    required this.title,
    required this.description,
    this.style,
    this.actionLabel,
  });

  final Widget icon;
  final String title;
  final String description;
  final String? actionLabel;
  final FxStateStyle? style;
}

abstract final class FxStates {
  static const empty = FxStateData(
    icon: Icon(CupertinoIcons.cube_box),
    title: 'No data available',
    description: "There's nothing here yet.",
    actionLabel: 'Refresh',
  );

  static const error = FxStateData(
    icon: Icon(CupertinoIcons.exclamationmark_circle),
    title: 'Oops! Something went wrong',
    description: 'Something went wrong. Please try again.',
    actionLabel: 'Retry',
  );

  static const offline = FxStateData(
    icon: Icon(CupertinoIcons.wifi),
    title: 'You are offline',
    description: 'Please check your internet connection and try again.',
    actionLabel: 'Retry',
  );

  static const maintenance = FxStateData(
    icon: Icon(CupertinoIcons.wrench),
    title: 'Maintenance mode',
    description: 'We are currently performing maintenance on the system. Please try again later.',
    actionLabel: 'Retry',
  );

  static const unauthorized = FxStateData(
    icon: Icon(CupertinoIcons.lock),
    title: 'Unauthorized',
    description: 'You are not authorized to access this resource.',
    actionLabel: 'Retry',
  );
}

/// Generic state display widget.
///
/// Used for:
/// - Empty states
/// - Error states
/// - Offline states
/// - Unauthorized states
/// - Maintenance states
@immutable
class FxStateView extends StatelessWidget with FxUiToolkit {
  FxStateView._({
    super.key,
    required this.title,
    required this.description,
    this.icon = const Icon(CupertinoIcons.info),
    this.actionLabel,
    this.onAction,
    this.style,
  });

  factory FxStateView.fromData(
    FxStateData data, {
    VoidCallback? onAction,
    Key? key,
  }) => FxStateView._(
    key: key,
    icon: data.icon,
    title: data.title,
    description: data.description,
    actionLabel: data.actionLabel,
    onAction: onAction,
    style: data.style,
  );

  final Widget icon;
  final String title;
  final String description;
  final String? actionLabel;
  final VoidCallback? onAction;
  final FxStateStyle? style;

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    return Center(
      child: Padding(
        padding: EdgeInsets.all(sizes.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconTheme(
              data: IconThemeData(
                size: (style?.iconSize ?? 64.sp),
                color: (style?.iconColor ?? colorScheme.onSurface.withValues(alpha: 0.3)),
              ),
              child: icon,
            ),

            SizedBox(height: sizes.lg),

            Text(
              title,
              style: (style?.titleStyle ?? typography.titleMedium),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: sizes.sm),

            Text(
              description,
              style: (style?.descriptionStyle ?? typography.bodyMedium),
              textAlign: TextAlign.center,
            ),

            if (actionLabel != null &&
                onAction != null) ...[
              SizedBox(height: sizes.lg),

              FxButton(
                label: actionLabel!,
                onPressed: onAction,
                variant:  FxButtonVariant.text,
                foregroundColor: style?.actionForegroundColor ?? theme.colorScheme.primary,
                borderColor: style?.actionBorderColor,
                isFullWidth: false,
              ),
            ],
          ],
        ),
      ),
    );
  }
}