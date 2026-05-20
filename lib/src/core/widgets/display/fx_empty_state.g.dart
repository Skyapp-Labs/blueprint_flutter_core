// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_empty_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

typedef FxStateDataCopyWithFn =
    FxStateData Function({
      Widget icon,
      String title,
      String description,
      FxStateStyle? style,
      String? actionLabel,
    });

const Object _fxStateDataCopyWithPlaceholder = Object();

extension FxStateDataCopyWith on FxStateData {
  FxStateDataCopyWithFn get copyWith {
    final instance = this;
    FxStateData copyWithFn({
      Object icon = _fxStateDataCopyWithPlaceholder,
      Object title = _fxStateDataCopyWithPlaceholder,
      Object description = _fxStateDataCopyWithPlaceholder,
      Object? style = _fxStateDataCopyWithPlaceholder,
      Object? actionLabel = _fxStateDataCopyWithPlaceholder,
    }) {
      return FxStateData(
        icon: identical(icon, _fxStateDataCopyWithPlaceholder)
            ? instance.icon
            : icon as Widget,
        title: identical(title, _fxStateDataCopyWithPlaceholder)
            ? instance.title
            : title as String,
        description: identical(description, _fxStateDataCopyWithPlaceholder)
            ? instance.description
            : description as String,
        style: identical(style, _fxStateDataCopyWithPlaceholder)
            ? instance.style
            : style as FxStateStyle?,
        actionLabel: identical(actionLabel, _fxStateDataCopyWithPlaceholder)
            ? instance.actionLabel
            : actionLabel as String?,
      );
    }

    return copyWithFn as FxStateDataCopyWithFn;
  }
}
