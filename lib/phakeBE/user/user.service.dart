import 'dart:io';
import 'dart:typed_data';

import '../database/database.interface.dart';

class UserService {
  final AuthDatabase database;

  UserService({required this.database});

  Future<String> saveAvatar({
    required String email,
    required Uint8List imageBytes,
  }) {
    final normalizedEmail = email.trim().toLowerCase();
    if (normalizedEmail.isEmpty) {
      throw ArgumentError.value(email, 'email', 'Email is required');
    }

    final user = database.findUserByEmail(normalizedEmail);
    if (user == null) {
      throw StateError('User not found for avatar update');
    }

    return database.saveAvatarBytes(
      normalizedEmail: normalizedEmail,
      imageBytes: imageBytes,
    );
  }

  Future<String?> getAvatar({required String email}) async {
    final normalizedEmail = email.trim().toLowerCase();
    final avatarPath = await database.getAvatarPath(
      normalizedEmail: normalizedEmail,
    );

    if (avatarPath == null || avatarPath.isEmpty) {
      return null;
    }

    if (avatarPath.startsWith('assets/')) {
      return avatarPath;
    }

    final file = File(avatarPath);
    if (!await file.exists()) {
      return null;
    }

    return avatarPath;
  }
}
