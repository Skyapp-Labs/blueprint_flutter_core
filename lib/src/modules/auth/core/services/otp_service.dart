import 'package:blueprint_flutter_core/src/core/network/fx_service.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/dto/payload/_payload.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/dto/responses/send_otp_response.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/dto/responses/verify_otp_response.dart';

/// Handles all OTP-specific API calls for the phone auth flow.
class OtpService extends FxService {
  OtpService(super.ctx);

  FxResponse<SendOtpResponse> sendOtp(SendOtpPayload request) => execute(() async {
    final response = await dio.post<Map<String, dynamic>>(
      endpoints.sendOtp,
      data: request.toJson(),
    );
    return SendOtpResponse.fromJson(response.data!);
  });

  FxResponse<VerifyOtpResponse> verifyOtp(VerifyOtpPayload request) => execute(() async {
    final response = await dio.post<Map<String, dynamic>>(
      endpoints.verifyOtp,
      data: request.toJson(),
    );
    return VerifyOtpResponse.fromJson(response.data!);
  });

  FxResponse<SendOtpResponse> resendOtp(RefreshTokenPayload request) => execute(() async {
    final response = await dio.post<Map<String, dynamic>>(
      endpoints.resendOtp,
      data: request.toJson(),
    );
    return SendOtpResponse.fromJson(response.data!);
  });
}
