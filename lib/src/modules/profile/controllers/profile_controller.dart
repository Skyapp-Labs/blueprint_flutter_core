import 'package:blueprint_flutter_core/src/core/controllers/fx_controller_mixin.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/controllers/auth_controller.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/enums/auth_status.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/user.dart';
import 'package:blueprint_flutter_core/src/modules/profile/models/profile_update.dart';
import 'package:blueprint_flutter_core/src/modules/profile/services/profile_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_controller.g.dart';

class ProfileState {
  const ProfileState({this.user, this.isLoading = false, this.error});

  final AuthUser? user;
  final bool isLoading;
  final String? error;

  ProfileState copyWith({AuthUser? user, bool? isLoading, String? error}) =>
      ProfileState(
        user: user ?? this.user,
        isLoading: isLoading ?? this.isLoading,
        error: error,
      );
}

@riverpod
class ProfileController extends _$ProfileController with FxControllerMixin {
  late final ProfileService _service;

  @override
  ProfileState build() {
    _service = ProfileService(serviceContext);

    // Seed with current user from auth state
    final authUser = ref.read(authControllerProvider).user;
    if (authUser != null) {
      return ProfileState(user: authUser);
    }

    // Auto-load when authenticated
    ref.listen(authControllerProvider, (_, next) {
      if (next.status == AuthStatus.authenticated && state.user == null) {
        loadProfile();
      }
    });

    return const ProfileState();
  }

  Future<void> loadProfile() async {
    state = state.copyWith(isLoading: true);
    try {
      final user = await _service.getMe();
      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<bool> updateProfile(ProfileUpdate update) async {
    state = state.copyWith(isLoading: true);
    try {
      final updated = await _service.updateMe(update);
      state = state.copyWith(user: updated, isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  void clearError() => state = state.copyWith(error: null);
}
