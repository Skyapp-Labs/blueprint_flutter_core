/// The authentication method the server is configured to use.
/// Set this once in [app/config/app_config.dart].
enum AuthMethod {
  /// Phone number + OTP flow (AUTH_METHOD=phone on the server).
  phone,

  /// Email + password flow (AUTH_METHOD=email on the server).
  email,
}
