import 'package:get_it/get_it.dart';

import '../add_payment_card/di/add_payment_card_injection.dart';
import '../add_address/di/add_address_injection.dart';
import '../change_profile/di/change_profile_injection.dart';
import '../crop_avatar/di/crop_avatar_injection.dart';
import '../my_order/di/my_order_injection.dart';
import '../profile/di/profile_injection.dart';

class AccountInjection {
  const AccountInjection._();

  static void register(GetIt getIt) {
    AddAddressInjection.register(getIt);
    AddPaymentCardInjection.register(getIt);
    CropAvatarInjection.register(getIt);
    MyOrderInjection.register(getIt);
    ChangeProfileInjection.register(getIt);
    ProfileInjection.register(getIt);
  }
}
