import 'package:realm/realm.dart';
part 'user.realm.dart';

@RealmModel()
class _User {
  @PrimaryKey()
  late String id;
  late String email;
  late String passwordHash;
  late String firstName;
  late String lastName;
  late String phoneNumber;
}