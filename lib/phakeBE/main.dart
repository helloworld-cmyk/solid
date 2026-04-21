import 'package:solid/phakeBE/auth/auth_repository.dart';
import 'package:solid/phakeBE/auth/auth.service.dart';
import 'package:solid/phakeBE/database/database.interface.dart';
import 'package:solid/phakeBE/main.interface.dart';

class PhakeBE implements PhakeBEInterface {
  PhakeBE({required AuthDatabase database, required this.auth})
    : _database = database;

  @override
  final AuthRepository auth;

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
}
