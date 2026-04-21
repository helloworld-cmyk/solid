import 'package:solid/phakeBE/auth/auth.service.dart';

abstract class LoginAuthDataSource {
  Future<AuthSignInResult> signIn({required String email, required String password});
}
