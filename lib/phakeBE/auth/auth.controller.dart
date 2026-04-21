export 'auth.service.dart' show AuthSignInResult, AuthSignUpResult;

import 'auth.service.dart';
import 'auth_repository.dart';

class AuthController implements AuthRepository {
  final AuthService authService;

  AuthController(this.authService);

  @override
  Future<AuthSignInResult> signInWithResult({
    required String email,
    required String password,
  }) async {
    return authService.signInWithResult(email: email, password: password);
  }

  @override
  Future<AuthSignUpResult> signUpWithResult({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    return authService.signUpWithResult(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
    );
  }
}
