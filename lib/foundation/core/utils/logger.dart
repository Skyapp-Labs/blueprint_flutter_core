import 'package:logger/logger.dart';

/// Application-wide structured logger.
///
/// Automatically silenced in production builds.
/// Use [FxLogger.d], [FxLogger.i], [FxLogger.w], [FxLogger.e].
abstract final class FxLogger {
  static final _logger = Logger(
    printer: _ShortPathPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 80,
    colors: false,
    dateTimeFormat: DateTimeFormat.dateAndTime,
  ),
    level: _resolveLevel(),
  );

  static Level _resolveLevel() {
    bool isProduction = bool.fromEnvironment('dart.vm.product');
    return isProduction ? Level.off : Level.debug;
  }

  static void d(String message, [Object? error]) =>
      _logger.d(message, error: error);

  static void i(String message, [Object? error]) =>
      _logger.i(message, error: error);

  static void w(String message, [Object? error]) =>
      _logger.w(message, error: error);

  static void e(String message, [Object? error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);
}

class _ShortPathPrinter extends PrettyPrinter {
  _ShortPathPrinter({
    super.methodCount,
    super.errorMethodCount,
    super.lineLength,
    super.colors,
    super.dateTimeFormat,
  });

  @override
  String? formatStackTrace(StackTrace? stackTrace, int? methodCount) {
    final formatted = super.formatStackTrace(stackTrace, methodCount);
    if (formatted == null) return null;
    // Replace full package path with just the relative path
    return formatted.replaceAll(RegExp(r'package:[^/]+/'), '');
  }
}
