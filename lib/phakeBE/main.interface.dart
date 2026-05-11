import 'dart:typed_data';

import 'auth/auth_repository.dart';
import 'auth/auth.service.dart' show AuthSignInResult, AuthSignUpResult;
import 'user/user_repository.dart';

abstract class PhakeBEInterface {
  AuthRepository get auth;
  UserRepository get user;

  Future<AuthSignInResult> signInWithResult({
    required String email,
    required String password,
  });

  Future<AuthSignUpResult> signUpWithResult({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  });

  Future<String> saveAvatar({
    required String email,
    required Uint8List imageBytes,
  });

  Future<String?> getAvatar({required String email});

  void dispose();
}
