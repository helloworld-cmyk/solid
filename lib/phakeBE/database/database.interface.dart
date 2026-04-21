class DbUserRecord {
  const DbUserRecord({
    required this.id,
    required this.email,
    required this.passwordHash,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  final String id;
  final String email;
  final String passwordHash;
  final String firstName;
  final String lastName;
  final String phoneNumber;
}

abstract class AuthDatabase {
  DbUserRecord? findUserByEmail(String normalizedEmail);

  void createUser(DbUserRecord user);

  String nextId();

  void dispose();
}
