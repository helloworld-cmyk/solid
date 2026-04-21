import '../entities/register_result.dart';
import '../repositories/register_repository.dart';

class SignUpWithEmailUseCase {
  const SignUpWithEmailUseCase({required RegisterRepository repository})
    : _repository = repository;

  final RegisterRepository _repository;

  Future<RegisterResult> call({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) {
    return _repository.signUp(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
    );
  }
}
