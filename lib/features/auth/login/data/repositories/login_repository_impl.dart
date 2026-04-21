import 'package:solid/phakeBE/auth/auth.service.dart';

import '../../domain/entities/login_result.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_auth_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  const LoginRepositoryImpl({required LoginAuthDataSource authDataSource})
    : _authDataSource = authDataSource;

  final LoginAuthDataSource _authDataSource;

  @override
  Future<LoginResult> signIn({
    required String email,
    required String password,
  }) async {
    final AuthSignInResult response = await _authDataSource.signIn(
      email: email,
      password: password,
    );

    if (response.isSuccess) {
      return LoginResult.success(message: response.message);
    }

    return LoginResult.failure(
      message: response.message,
      failure: _mapFailure(response.failure),
    );
  }

  LoginFailureType _mapFailure(AuthSignInFailure? failure) {
    switch (failure) {
      case AuthSignInFailure.userNotFound:
        return LoginFailureType.userNotFound;
      case AuthSignInFailure.invalidPassword:
        return LoginFailureType.invalidPassword;
      case AuthSignInFailure.unknown:
      case null:
        return LoginFailureType.unknown;
    }
  }
}
