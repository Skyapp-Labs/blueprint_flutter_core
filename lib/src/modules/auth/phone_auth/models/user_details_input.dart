
class UserDetailsInput {
  const UserDetailsInput({
    required this.firstName,
    required this.lastName,
    this.email,
  });

  /// The first name input.
  final String firstName;
  /// The last name input.
  final String lastName;
  /// The email input.
  final String? email;
}
