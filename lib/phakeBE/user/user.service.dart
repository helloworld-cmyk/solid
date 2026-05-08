import 'dart:io';

import '../database/database.interface.dart';

class UserService {
  final AuthDatabase database;

  UserService({required this.database});

  Future<String> saveAvatar({required String email, required File imageFile}) {
    final normalizedEmail = email.trim().toLowerCase();
    return database.saveAvatarFile(
      normalizedEmail: normalizedEmail,
      imageFile: imageFile,
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
