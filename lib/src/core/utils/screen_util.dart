import 'package:flutter/widgets.dart';

/// Responsive sizing utility.
///
/// Initialise once in your root widget:
/// ```dart
/// ScreenUtil.init(context, designWidth: 390, designHeight: 844);
/// ```
/// Then use anywhere:
/// ```dart
/// SizedBox(width: 16.w, height: 24.h)
/// Text('Hello', style: TextStyle(fontSize: 14.sp))
/// BorderRadius.circular(8.r)
/// ```
class ScreenUtil {
  ScreenUtil._();

  static late double _screenWidth;
  static late double _screenHeight;
  static late double _designWidth;
  static late double _designHeight;
  static late double _pixelRatio;
  static bool _initialized = false;

  static void init(
    BuildContext context, {
    double designWidth = 390,
    double designHeight = 844,
  }) {
    final media = MediaQuery.of(context);
    _screenWidth = media.size.width;
    _screenHeight = media.size.height;
    _pixelRatio = media.devicePixelRatio;
    _designWidth = designWidth;
    _designHeight = designHeight;
    _initialized = true;
  }

  static double get screenWidth => _screenWidth;
  static double get screenHeight => _screenHeight;

  /// Scales a width value relative to the design width.
  static double w(double value) {
    assert(_initialized, 'Call ScreenUtil.init(context) first.');
    return value * (_screenWidth / _designWidth);
  }

  /// Scales a height value relative to the design height.
  static double h(double value) {
    assert(_initialized, 'Call ScreenUtil.init(context) first.');
    return value * (_screenHeight / _designHeight);
  }

  /// Scales a font size using the smaller of width/height ratios.
  static double sp(double value) {
    assert(_initialized, 'Call ScreenUtil.init(context) first.');
    final scale =
        (_screenWidth / _designWidth + _screenHeight / _designHeight) / 2;
    return value * scale;
  }

  /// Scales a radius value (same as [w]).
  static double r(double value) => w(value);

  static double get pixelRatio => _pixelRatio;
}

extension ScreenUtilExtension on num {
  double get w => ScreenUtil.w(toDouble());
  double get h => ScreenUtil.h(toDouble());
  double get sp => ScreenUtil.sp(toDouble());
  double get r => ScreenUtil.r(toDouble());
}
