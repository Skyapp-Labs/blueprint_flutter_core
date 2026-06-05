import 'package:freezed_annotation/freezed_annotation.dart';

part 'fx_error.freezed.dart';
part 'fx_error.g.dart';

@freezed
abstract class FxError with _$FxError {
  const factory FxError({
    required String message,
    String? code,
    int? statusCode,
  }) = _FxError;

  factory FxError.fromJson(
    Map<String, dynamic> json
  ) => _$FxErrorFromJson(json);
}