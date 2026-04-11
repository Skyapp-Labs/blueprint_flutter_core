part of 'fx_controller_mixin.dart';

abstract class FxState<T extends FxState<T>> {
  /// Whether the controller is currently loading.
  bool get isLoading => false;

  /// The error message to display to the user.
  String? get error => null;

  /// Returns a new state with the loading flag set.
  T copyWithLoading(bool loading);

  /// Returns a new state with the error message set.
  T copyWithError(String? error);
}
