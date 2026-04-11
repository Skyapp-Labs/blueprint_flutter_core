import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  static const _key = 'theme_mode';

  late final FlutterSecureStorage _storage;

  @override
  ThemeMode build() {
    _storage = const FlutterSecureStorage();

    _loadSaved(); // async load on init

    return ThemeMode.system; // default while loading
  }

  Future<void> _loadSaved() async {
    final saved = await _storage.read(key: _key);

    if (saved == null) return;

    state = ThemeMode.values.firstWhere(
      (m) => m.name == saved,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await _storage.write(key: _key, value: mode.name);
    state = mode;
  }

  Future<void> toggleDark() async {
    final next = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await setThemeMode(next);
  }
}
