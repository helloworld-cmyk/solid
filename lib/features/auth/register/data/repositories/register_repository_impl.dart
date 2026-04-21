import 'package:solid/phakeBE/auth/auth.service.dart';

import '../../domain/entities/register_result.dart';
import '../../domain/repositories/register_repository.dart';
import '../datasources/register_auth_data_source.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  const RegisterRepositoryImpl({
    required RegisterAuthDataSource authDataSource,
  }) : _authDataSource = authDataSource;

  final RegisterAuthDataSource _authDataSource;

  @override
  Future<RegisterResult> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    final AuthSignUpResult response = await _authDataSource.signUp(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
    );

    if (response.isSuccess) {
      return RegisterResult.success(message: response.message);
    }

    return RegisterResult.failure(
      message: response.message,
      failure: _mapFailure(response.failure),
    );
  }

  RegisterFailureType _mapFailure(AuthSignUpFailure? failure) {
    switch (failure) {
      case AuthSignUpFailure.emailAlreadyInUse:
        return RegisterFailureType.emailAlreadyInUse;
      case AuthSignUpFailure.unknown:
      case null:
        return RegisterFailureType.unknown;
    }
  }
}
