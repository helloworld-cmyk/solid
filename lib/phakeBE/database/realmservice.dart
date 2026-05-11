import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:realm/realm.dart';

import 'database.interface.dart';
import 'user/user.dart';

class RealmService implements AuthDatabase {
  late final Realm _realm;

  RealmService() {
    final config = Configuration.local([User.schema]);
    _realm = Realm(config);
  }

  @override
  DbUserRecord? findUserByEmail(String normalizedEmail) {
    final users = _realm.query<User>(r'email == $0', [normalizedEmail]);
    if (users.isEmpty) {
      return null;
    }

    final user = users.first;
    return DbUserRecord(
      id: user.id,
      email: user.email,
      passwordHash: user.passwordHash,
      firstName: user.firstName,
      lastName: user.lastName,
      phoneNumber: user.phoneNumber,
      avatarPath: user.avatarPath,
    );
  }

  @override
  void createUser(DbUserRecord user) {
    final realmUser = User(
      user.id,
      user.email,
      user.passwordHash,
      user.firstName,
      user.lastName,
      user.phoneNumber,
      avatarPath: user.avatarPath,
    );

    _realm.write(() {
      _realm.add(realmUser);
    });
  }

  void _persistAvatarPathToRealm({
    required String normalizedEmail,
    required String avatarPath,
  }) {
    final users = _realm.query<User>(r'email == $0', [normalizedEmail]);
    if (users.isEmpty) {
      return;
    }

    _realm.write(() {
      users.first.avatarPath = avatarPath;
    });
  }

  @override
  Future<String> saveAvatarBytes({
    required String normalizedEmail,
    required Uint8List imageBytes,
  }) async {
    final appDir = await getApplicationDocumentsDirectory();
    final avatarDir = Directory(p.join(appDir.path, 'avatars'));

    if (!await avatarDir.exists()) {
      await avatarDir.create(recursive: true);
    }

    final safeEmail = normalizedEmail.replaceAll(RegExp(r'[^a-z0-9]'), '_');
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final fileName = 'avatar_${safeEmail}_$timestamp.jpg';
    final fullPath = p.join(avatarDir.path, fileName);

    final savedFile = File(fullPath);
    await savedFile.writeAsBytes(imageBytes, flush: true);

    _persistAvatarPathToRealm(
      normalizedEmail: normalizedEmail,
      avatarPath: savedFile.path,
    );

    return savedFile.path;
  }

  @override
  Future<String?> getAvatarPath({required String normalizedEmail}) async {
    final user = findUserByEmail(normalizedEmail);
    final avatarPath = user?.avatarPath;

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

  @override
  String nextId() {
    return ObjectId().toString();
  }

  @override
  void dispose() {
    _realm.close();
  }
}
