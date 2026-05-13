import 'dart:async';

import 'package:blueprint_flutter_core/src/core/network/firebase/fx_messaging.dart';

import 'package:blueprint_flutter_core/blueprint_network.dart';
import 'package:blueprint_flutter_core/src/core/config/firebase_config.dart';
import 'package:blueprint_flutter_core/src/core/data/fx_countries.dart';

export 'package:firebase_messaging/firebase_messaging.dart' show RemoteMessage;

abstract final class FxCore {
  static final _messageController = StreamController<RemoteMessage>.broadcast();
  static final _messageOpenedController = StreamController<RemoteMessage>.broadcast();

  static Stream<RemoteMessage> get onMessage => _messageController.stream;
  static Stream<RemoteMessage> get onMessageOpenedApp => _messageOpenedController.stream;

  static Future<void> init({
    FirebaseConfig? firebaseConfig,
    Future<void> Function(RemoteMessage)? backgroundMessageHandler,
  }) async {
    if (backgroundMessageHandler != null) {
      // Register the background message handler
      // This is called before Firebase.initializeApp()
      FxMessaging.registerBackgroundHandler(backgroundMessageHandler);
    }
    // Load the countries
    await FxCountries.load();
    // Initialize Firebase
    if (firebaseConfig != null) await FirebaseClient.initialize(firebaseConfig);
    // Initialize the notification listeners (must be after Firebase.initializeApp())
    if (FirebaseClient.isInitialized) FxMessaging.initListeners();
  }
}