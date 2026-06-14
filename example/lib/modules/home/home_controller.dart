import 'package:blueprint_flutter_core/blueprint_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

// ─────────────────────────────────────────────
// DEV ZONE — Add home-screen logic here.
// e.g. bottom nav index, tab state, banners.
// ─────────────────────────────────────────────
@riverpod
class HomeController extends _$HomeController {
  @override
  void build() {}

  /// Delegates logout to the foundation auth controller.
  Future<void> logout() => ref.read(authControllerProvider.notifier).logout();
}
