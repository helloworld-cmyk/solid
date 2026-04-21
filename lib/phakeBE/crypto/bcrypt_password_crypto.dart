import 'package:bcrypt/bcrypt.dart';

import 'crypto.interface.dart';

class BcryptPasswordCrypto implements PasswordCrypto {
  @override
  String hashPassword(String plainTextPassword) {
    return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
  }

  @override
  bool verifyPassword({
    required String plainTextPassword,
    required String passwordHash,
  }) {
    return BCrypt.checkpw(plainTextPassword, passwordHash);
  }
}
