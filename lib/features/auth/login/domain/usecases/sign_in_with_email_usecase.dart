import '../entities/login_result.dart';
import '../repositories/login_repository.dart';

class SignInWithEmailUseCase {
  const SignInWithEmailUseCase({required LoginRepository repository})
    : _repository = repository;

  final LoginRepository _repository;

  Future<LoginResult> call({
    required String email,
    required String password,
  }) {
    return _repository.signIn(email: email, password: password);
  }
}
