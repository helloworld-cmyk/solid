import 'package:solid/phakeBE/auth/auth.service.dart';

abstract class RegisterAuthDataSource {
  Future<AuthSignUpResult> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  });
}
