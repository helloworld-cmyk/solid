import 'package:get_it/get_it.dart';

import '../login/di/login_injection.dart';
import '../register/di/register_injection.dart';

class AuthInjection {
  const AuthInjection._();

  static void register(GetIt getIt) {
    LoginInjection.register(getIt);
    RegisterInjection.register(getIt);
  }
}
