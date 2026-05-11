import 'dart:typed_data';
import 'package:solid/phakeBE/auth/auth_repository.dart';
import 'package:solid/phakeBE/auth/auth.service.dart';
import 'package:solid/phakeBE/database/database.interface.dart';
import 'package:solid/phakeBE/main.interface.dart';
import 'package:solid/phakeBE/user/user_repository.dart';

class PhakeBE implements PhakeBEInterface {
  PhakeBE({
    required AuthDatabase database,
    required this.auth,
    required this.user,
  }) : _database = database;

  @override
  final AuthRepository auth;

  @override
  final UserRepository user;

  final AuthDatabase _database;

  @override
  void dispose() {
    _database.dispose();
  }

  @override
  Future<AuthSignInResult> signInWithResult({
    required String email,
    required String password,
  }) {
    return auth.signInWithResult(email: email, password: password);
  }

  @override
  Future<AuthSignUpResult> signUpWithResult({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) {
    return auth.signUpWithResult(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
    );
  }

  @override
  Future<String> saveAvatar({
    required String email,
    required Uint8List imageBytes,
  }) {
    return user.saveAvatar(email: email, imageBytes: imageBytes);
  }

  @override
  Future<String?> getAvatar({required String email}) {
    return user.getAvatar(email: email);
  }
}
