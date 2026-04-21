import 'package:get_it/get_it.dart';

import '../wishlist/di/wishlist_injection.dart';

class WishlistInjection {
  const WishlistInjection._();

  static void register(GetIt getIt) {
    WishlistScreenInjection.register(getIt);
  }
}