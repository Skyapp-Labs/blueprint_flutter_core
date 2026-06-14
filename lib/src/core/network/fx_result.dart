import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:blueprint_flutter_core/src/core/network/fx_error.dart';

part 'fx_result.freezed.dart';

@freezed
sealed class FxResult<T> with _$FxResult<T> {
  const factory FxResult.success(T data) = FxSuccess<T>;

  const factory FxResult.failure(FxError error) = FxFailure<T>;
}