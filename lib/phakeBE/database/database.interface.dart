import 'dart:typed_data';

class DbUserRecord {
  const DbUserRecord({
    required this.id,
    required this.email,
    required this.passwordHash,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    this.avatarPath,
  });

  final String id;
  final String email;
  final String passwordHash;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String? avatarPath;
}

abstract class AuthDatabase {
  DbUserRecord? findUserByEmail(String normalizedEmail);

  void createUser(DbUserRecord user);

  Future<String> saveAvatarBytes({
    required String normalizedEmail,
    required Uint8List imageBytes,
  });

  Future<String?> getAvatarPath({required String normalizedEmail});

  String nextId();

  void dispose();
}
