import 'package:solid/phakeBE/auth/auth.service.dart';
import 'package:solid/phakeBE/main.interface.dart';

import 'register_auth_data_source.dart';

class RegisterAuthDataSourceImpl implements RegisterAuthDataSource {
  const RegisterAuthDataSourceImpl({required PhakeBEInterface phakeBE})
    : _phakeBE = phakeBE;

  final PhakeBEInterface _phakeBE;

  @override
  Future<AuthSignUpResult> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) {
    return _phakeBE.signUpWithResult(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
    );
  }
}
