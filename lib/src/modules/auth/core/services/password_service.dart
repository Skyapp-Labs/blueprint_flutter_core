// import 'package:blueprint_flutter_core/src/core/network/fx_service.dart';
// import 'package:blueprint_flutter_core/src/modules/auth/core/models/dto/payload/_payload.dart';

// /// Handles all OTP-specific API calls for the phone auth flow.
// class PasswordService extends FxService {
//   PasswordService(super.ctx);

//   // --- Password reset ---
//   FxResponse<void> forgotPassword(ForgotPasswordPayload request) => execute(() async {
//     await dio.post<dynamic>(
//       endpoints.forgotPassword,
//       data: request.toJson(),
//     );
//   });

//   FxResponse<void> resetPassword(ResetPasswordPayload request) => execute(() async {
//     await dio.post<dynamic>(
//       endpoints.resetPassword,
//       data: request.toJson(),
//     );
//   });

//   FxResponse<void> resetPasswordViaPhone(ResetPasswordViaPhonePayload request) => execute(() async {
//     await dio.post<dynamic>(
//       endpoints.resetPasswordPhone,
//       data: request.toJson(),
//     );
//   });
// }
