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
    );

    _realm.write(() {
      _realm.add(realmUser);
    });
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
