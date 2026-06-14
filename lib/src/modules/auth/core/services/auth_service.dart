import 'package:blueprint_flutter_core/src/core/network/fx_service.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/entities/_entities.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/dto/payload/_payload.dart';

/// Handles all shared /auth/* and /users/* API calls.
class AuthService extends FxService {
  AuthService(super.ctx);

  // --- Login ---
  FxResponse<AuthTokens> loginWithToken(LoginWithTokenPayload request) => execute(() async {
    final response = await dio.post<Map<String, dynamic>>(
      endpoints.login,
      data: request.toJson(),
    );

    return AuthTokens.fromJson(response.data!);
  });

  FxResponse<AuthTokens> loginWithEmail(LoginWithEmailPayload request) => execute(() async {
    final response = await dio.post<Map<String, dynamic>>(
      endpoints.login,
      data: request.toJson(),
    );
    return AuthTokens.fromJson(response.data!);
  });

  // --- Register (both flows) ---
  FxResponse<AuthTokens> signup(SignupPayload request) => execute(() async {
    final body = request.toJson();
    body.removeWhere((key, value) => value == null || value == '');
    final response = await dio.post<Map<String, dynamic>>(
      endpoints.register,
      data: body,
    );
    return AuthTokens.fromJson(response.data!);
  });
  // --- Token refresh ---
  FxResponse<AuthTokens> refresh(RefreshTokenPayload request) => execute(() async {
    final response = await dio.post<Map<String, dynamic>>(
      endpoints.refresh,
      data: request.toJson()
    );

    return AuthTokens.fromJson(response.data!);
  });

  // --- Logout ---
  FxResponse<String> logout() => execute(() async {
    final response = await dio.post<dynamic>(endpoints.logout);
    return response.data as String;
  });
}
