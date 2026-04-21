import '../entities/register_result.dart';

abstract class RegisterRepository {
  Future<RegisterResult> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  });
}
