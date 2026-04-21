import 'package:solid/core/bloc/di/bloc_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:solid/features/account/di/account_injection.dart';
import 'package:solid/features/auth/di/auth_injection.dart';
import 'package:solid/features/catalog/di/catalog_injection.dart';
import 'package:solid/features/commerce/di/commerce_injection.dart';
import 'package:solid/features/notifications/di/notifications_injection.dart';
import 'package:solid/features/onboarding/di/onboarding_injection.dart';
import 'package:solid/features/wishlist/di/wishlist_injection.dart';
import 'package:solid/phakeBE/di/phakebe_injection.dart';

final GetIt sl = GetIt.instance;

Future<void> initDependencies() async {
  OnboardingInjection.register(sl);

  // Register dependencies for the PhakeBE module
  registerPhakeBEDependencies(sl);

  AccountInjection.register(sl);
  AuthInjection.register(sl);
  CatalogInjection.register(sl);
  CommerceInjection.register(sl);
  NotificationsInjection.register(sl);
  WishlistInjection.register(sl);

  BlocInjection.register(sl);
}

Future<void> resetDependencies() {
  return sl.reset();
}
