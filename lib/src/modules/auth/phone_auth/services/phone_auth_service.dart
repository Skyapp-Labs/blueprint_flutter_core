import 'package:blueprint_flutter_core/src/core/network/app_service.dart';
import 'package:blueprint_flutter_core/src/modules/auth/core/models/auth_tokens.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/models/otp_data.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/models/phone_lookup_result.dart';

/// Handles all OTP-specific API calls for the phone auth flow.
class PhoneAuthService extends AppService {
  PhoneAuthService(super.ctx);

  Future<OtpData> sendOtp(String phone) async {
    final res = await dio.post<Map<String, dynamic>>(
      endpoints.sendOtp,
      data: {'phone': phone},
    );
    return OtpData.fromJson(res.data!);
  }

  Future<PhoneLookupResult> verifyOtp({
    required String verificationId,
    required String code,
  }) async {
    final res = await dio.post<Map<String, dynamic>>(
      endpoints.verifyOtp,
      data: {'verificationId': verificationId, 'code': code},
    );
    return PhoneLookupResult.fromJson(res.data!);
  }

  Future<OtpData> resendOtp(String sessionToken) async {
    final res = await dio.post<Map<String, dynamic>>(
      endpoints.resendOtp,
      data: {'resendToken': sessionToken},
    );
    return OtpData.fromJson(res.data!);
  }

  /// Login step for existing users after OTP verification.
  Future<AuthTokens> loginWithToken(String phoneGrantToken) async {
    final res = await dio.post<Map<String, dynamic>>(
      endpoints.login,
      data: {'token': phoneGrantToken},
    );
    return AuthTokens.fromJson(res.data!);
  }
}
