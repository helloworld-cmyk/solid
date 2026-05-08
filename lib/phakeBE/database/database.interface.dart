import 'dart:io';

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

  Future<String> saveAvatarFile({
    required String normalizedEmail,
    required File imageFile,
  });

  Future<String?> getAvatarPath({required String normalizedEmail});

  String nextId();

  void dispose();
}
