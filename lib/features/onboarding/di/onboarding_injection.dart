import 'package:get_it/get_it.dart';
import 'package:solid/features/onboarding/onboard/di/onboard_injection.dart';
import 'package:solid/features/onboarding/splash/di/splash_injection.dart';

class OnboardingInjection {
  const OnboardingInjection._();

  static void register(GetIt getIt) {
    OnboardInjection.register(getIt);
    SplashInjection.register(getIt);
  }
}
