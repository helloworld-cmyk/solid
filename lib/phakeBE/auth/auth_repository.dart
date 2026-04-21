import 'auth.service.dart' show AuthSignInResult, AuthSignUpResult;


abstract class AuthRepository {
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


}
