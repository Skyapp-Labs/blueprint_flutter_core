import 'package:blueprint_flutter_core/blueprint_flutter_core.dart' show FxApiEndpoints;

class ApiEndpoints extends FxApiEndpoints {

  const ApiEndpoints();

  @override
  String get sendOtp => '/auth/send-otp';

  @override
  String get verifyOtp => '/auth/verify-otp';

  @override
  String get resendOtp => '/auth/resend-otp';

  @override
  String get login => '/auth/login';

  @override
  String get register => '/auth/register';

  @override
  String get refresh => '/auth/refresh';

  @override
  String get logout => '/auth/logout';

  @override
  String get acceptInvite => '/auth/accept-invite';

  @override
  String get forgotPassword => '/auth/forgot-password';
}