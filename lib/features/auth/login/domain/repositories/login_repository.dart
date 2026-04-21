import '../entities/login_result.dart';

abstract class LoginRepository {
  Future<LoginResult> signIn({required String email, required String password});
}
