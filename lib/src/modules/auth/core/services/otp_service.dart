import 'package:blueprint_flutter_core/src/core/network/fx_service.dart';
import 'package:blueprint_flutter_core/src/core/network/interceptors/fx_headers_interceptor.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/dto/payload/_payload.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/dto/responses/send_otp_response.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/dto/responses/verify_otp_response.dart';

/// Handles all OTP-specific API calls for the phone auth flow.
class OtpService extends FxService {
  OtpService(super.ctx);

  FxResponse<SendOtpResponse> sendOtp(
    SendOtpPayload request, {
    required int otpLength,
  }) =>
      execute(() async {
        final response = await dio.post<Map<String, dynamic>>(
          endpoints.sendOtp,
          data: request.toJson(),
          options: FxRequestHeaders.otpLengthOptions(otpLength),
        );
        return SendOtpResponse.fromJson(response.data!);
      });

  FxResponse<VerifyOtpResponse> verifyOtp(
    VerifyOtpPayload request, {
    required int otpLength,
  }) =>
      execute(() async {
        final response = await dio.post<Map<String, dynamic>>(
          endpoints.verifyOtp,
          data: request.toJson(),
          options: FxRequestHeaders.otpLengthOptions(otpLength),
        );
        return VerifyOtpResponse.fromJson(response.data!);
      });

  FxResponse<SendOtpResponse> resendOtp(
    RefreshOtpPayload request, {
    required int otpLength,
  }) =>
      execute(() async {
        final response = await dio.post<Map<String, dynamic>>(
          endpoints.resendOtp,
          data: request.toJson(),
          options: FxRequestHeaders.otpLengthOptions(otpLength),
        );
        return SendOtpResponse.fromJson(response.data!);
      });
}
