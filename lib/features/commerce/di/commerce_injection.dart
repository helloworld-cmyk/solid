import 'package:get_it/get_it.dart';

import '../cart/di/cart_injection.dart';
import '../checkout/di/checkout_injection.dart';
import '../checkout_success/di/checkout_success_injection.dart';

class CommerceInjection {
  const CommerceInjection._();

  static void register(GetIt getIt) {
    CartInjection.register(getIt);
    CheckoutInjection.register(getIt);
    CheckoutSuccessInjection.register(getIt);
  }
}
