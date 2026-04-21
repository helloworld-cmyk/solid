import 'package:get_it/get_it.dart';

import '../domain/usecases/get_success_message_usecase.dart';

class CheckoutSuccessInjection {
  const CheckoutSuccessInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<GetSuccessMessageUseCase>()) {
      getIt.registerLazySingleton<GetSuccessMessageUseCase>(
        GetSuccessMessageUseCase.new,
      );
    }
  }
}
