import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:blueprint_flutter_core/src/core/config/firebase_config.dart';
import 'package:blueprint_flutter_core/src/core/utils/logger.dart';

/// Initialises Firebase using the platform-appropriate [FirebaseOptions].
class FirebaseClient {
  FirebaseClient._();

  static bool _initialized = false;
  static bool get isInitialized => _initialized;

  static Future<void> initialize(FirebaseConfig config) async {
    final options = switch (defaultTargetPlatform) {
      TargetPlatform.android => config.android,
      TargetPlatform.iOS => config.ios,
      TargetPlatform.macOS => config.macos,
      _ => config.web,
    };

    // Guard: detect unconfigured placeholder values
    if (_isUnconfigured(options)) {
      FxLogger.w(
        '[FirebaseClient] Firebase options appear unconfigured (placeholder values detected). \n'
        'Run `flutterfire configure` or set enableFirebase: false in AppConfig. \n'
        'Skipping Firebase initialization — app will continue without Firebase.',
      );
      return;
    }

    try {
      await Firebase.initializeApp(options: options);
      _initialized = true;
      FxLogger.i('[FirebaseClient] Firebase initialized successfully.');
    } catch (e, st) {
      FxLogger.e(
        '[FirebaseClient] Firebase initialization failed. App will continue without Firebase.',
        e,
        st,
      );
      // Never rethrow — a Firebase failure must never crash the app.
    }
  }

  static bool _isUnconfigured(FirebaseOptions options) {
    return options.apiKey.startsWith('YOUR_') ||
        options.appId.startsWith('YOUR_') ||
        options.projectId.startsWith('YOUR_');
  }
}
