import 'package:get_it/get_it.dart';

import '../change_profile/di/change_profile_injection.dart';
import '../profile/di/profile_injection.dart';

class AccountInjection {
  const AccountInjection._();

  static void register(GetIt getIt) {
    ChangeProfileInjection.register(getIt);
    ProfileInjection.register(getIt);
  }
}
