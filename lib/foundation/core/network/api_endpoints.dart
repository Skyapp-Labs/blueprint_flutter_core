/// Foundation-provided endpoint paths.
/// Extend this in [app/config/] to add app-specific endpoints.
/// Override any getter to change a default path.
class ApiEndpoints {
  const ApiEndpoints();

  // Auth — OTP flow
  String get sendOtp       => '/auth/send-otp';
  String get verifyOtp     => '/auth/verify-otp';
  String get resendOtp     => '/auth/resend-otp';

  // Auth — shared
  String get login         => '/auth/login';
  String get register      => '/auth/register';
  String get refresh       => '/auth/refresh';
  String get logout        => '/auth/logout';
  String get acceptInvite  => '/auth/accept-invite';

  // Auth — password reset
  String get forgotPassword      => '/auth/forgot-password';
  String get resetPassword       => '/auth/reset-password';
  String get resetPasswordPhone  => '/auth/reset-password/phone';

  // Auth — account management
  String get changePassword => '/auth/account/change-password';
  String get deleteRequest  => '/auth/account/delete-request';
  String get deleteConfirm  => '/auth/account/delete-confirm';

  // Auth — sessions
  String get sessions => '/auth/sessions';
  String revokeSession(String id) => '/auth/sessions/$id/revoke';

  // Users
  String get me           => '/users/me';
  String get users        => '/users';
  String userById(String id)       => '/users/$id';
  String activateUser(String id)   => '/users/$id/activate';
  String deactivateUser(String id) => '/users/$id/deactivate';
  String get inviteUser            => '/users/invite';
  String resendInvite(String id)   => '/users/$id/resend-invite';
  String deleteInvite(String id)   => '/users/$id/invite';

  // Notifications
  String get notificationDevices => '/notifications/devices';
  String get notifications       => '/notifications';
  String get unreadCount         => '/notifications/unread/count';
  String get readAll             => '/notifications/read-all';
  String notificationById(String id) => '/notifications/$id';
  String markRead(String id)         => '/notifications/$id/read';

  /// Routes that skip the Authorization header.
  /// Override to add app-specific public endpoints.
  List<String> get publicEndpoints => [
    login, register, refresh,
    sendOtp, verifyOtp, resendOtp,
    forgotPassword, resetPassword, resetPasswordPhone,
    acceptInvite,
  ];
}
