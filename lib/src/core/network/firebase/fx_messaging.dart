import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:blueprint_flutter_core/src/core/utils/logger.dart';

export 'package:firebase_messaging/firebase_messaging.dart' show RemoteMessage;

abstract final class FxMessaging {

  // ─── Streams (app listens to these) ───────────────────────────────────────

  static final _onMessageController =
      StreamController<RemoteMessage>.broadcast();
  static final _onMessageOpenedController =
      StreamController<RemoteMessage>.broadcast();

  static Stream<RemoteMessage> get onMessage => _onMessageController.stream;
  static Stream<RemoteMessage> get onMessageOpenedApp =>
      _onMessageOpenedController.stream;

  // ─── Startup (called from FxCore.init before runApp) ──────────────────────

  static void registerBackgroundHandler(Future<void> Function(RemoteMessage) handler) {
      // Must be called before Firebase.initializeApp()
      FirebaseMessaging.onBackgroundMessage(handler);
  }

  static void initListeners() {
    FirebaseMessaging.onMessage
        .listen((msg) => _onMessageController.add(msg));
    FirebaseMessaging.onMessageOpenedApp
        .listen((msg) => _onMessageOpenedController.add(msg));
    FxLogger.i('[FxMessaging] Foreground listeners initialized.');
  }

  // ─── Called once after login (per user) ───────────────────────────────────

  static Future<String?> requestPermissionAndGetToken() async {
    final settings = await FirebaseMessaging.instance.requestPermission();
    if (settings.authorizationStatus != AuthorizationStatus.authorized) {
      return null;
    }
    final token = await FirebaseMessaging.instance.getToken();
    return token;
  }

  // ─── Token refresh stream (consumed by AuthController) ────────────────────

  static Stream<String> get onTokenRefresh =>
      FirebaseMessaging.instance.onTokenRefresh;

  // ─── App launched from terminated state (called after navigator is ready) ─

  static Future<RemoteMessage?> getInitialMessage() =>
      FirebaseMessaging.instance.getInitialMessage();
}