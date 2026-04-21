abstract class PasswordCrypto {
  String hashPassword(String plainTextPassword);

  bool verifyPassword({
    required String plainTextPassword,
    required String passwordHash,
  });
}
