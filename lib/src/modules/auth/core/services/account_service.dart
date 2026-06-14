import 'package:blueprint_flutter_core/src/core/network/fx_service.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/dto/payload/_payload.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/entities/_entities.dart';

/// Handles all shared /auth/* and /users/* API calls.
class AuthService extends FxService {
  AuthService(super.ctx);

  // --- Account management ---
  FxResponse<void> changePassword(ChangePasswordPayload request) => execute(() async {
    await dio.post<dynamic>(
      endpoints.changePassword, 
      data: request.toJson()
    );
  });

  Future<Map<String, dynamic>> requestAccountDeletion() async {
    final res = await dio.post<Map<String, dynamic>>(
      endpoints.deleteRequest,
    );
    return res.data!;
  }

  FxResponse<void> confirmAccountDeletion(Map<String, dynamic> body) => execute(() async {
    final response = await dio.post<dynamic>(endpoints.deleteConfirm, data: body);
    return response.data!;
  });

  // --- Sessions ---
  FxResponse<List<Session>> getSessions() => execute(() async {
    final response = await dio.get<List<dynamic>>(endpoints.sessions);
    return response.data!
        .cast<Map<String, dynamic>>()
        .map(Session.fromJson)
        .toList();
  });

  FxResponse<void> revokeSession(String sessionId) => execute(() async {
    await dio.post<dynamic>(endpoints.revokeSession(sessionId));
  });

  // --- Current user ---
  FxResponse<User> getMe() => execute(() async {
    final response = await dio.get<Map<String, dynamic>>(endpoints.me);
    return User.fromJson(response.data!);
  });
}
