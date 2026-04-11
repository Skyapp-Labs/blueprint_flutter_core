/// Status of the current authentication session.
enum AuthStatus {
  /// No session exists — user must log in.
  unauthenticated,

  /// Auth operation in progress (login, OTP verify, etc.).
  authenticating,

  /// User is fully authenticated.
  authenticated,

  /// An auth error occurred.
  error,
}
