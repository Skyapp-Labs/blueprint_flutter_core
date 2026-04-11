import 'package:firebase_core/firebase_core.dart';

/// Blueprint contract for Firebase platform options.
///
/// Implement this in [app/config/firebase_config.dart] using the output
/// of `flutterfire configure`. Never edit this file.
abstract class FirebaseConfig {
  FirebaseOptions get android;
  FirebaseOptions get ios;
  FirebaseOptions get web;
  FirebaseOptions get macos;
}
