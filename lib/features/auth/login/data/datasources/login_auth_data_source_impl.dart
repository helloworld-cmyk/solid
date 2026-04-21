import 'package:solid/phakeBE/auth/auth.service.dart';
import 'package:solid/phakeBE/main.interface.dart';

import 'login_auth_data_source.dart';

class LoginAuthDataSourceImpl implements LoginAuthDataSource {
  const LoginAuthDataSourceImpl({required PhakeBEInterface phakeBE})
    : _phakeBE = phakeBE;

  final PhakeBEInterface _phakeBE;

  @override
  Future<AuthSignInResult> signIn({
    required String email,
    required String password,
  }) {
    return _phakeBE.signInWithResult(email: email, password: password);
  }
}
