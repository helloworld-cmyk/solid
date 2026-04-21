import 'package:get_it/get_it.dart';
import 'package:solid/core/bloc/card/card_bloc.dart';

import '../domain/usecases/add_payment_card_usecase.dart';
import '../presentation/bloc/add_payment_card_bloc.dart';

class AddPaymentCardInjection {
  const AddPaymentCardInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<AddPaymentCardUseCase>()) {
      getIt.registerFactory<AddPaymentCardUseCase>(
        () => AddPaymentCardUseCase(cardBloc: getIt<CardBloc>()),
      );
    }

    if (!getIt.isRegistered<AddPaymentCardBloc>()) {
      getIt.registerFactory<AddPaymentCardBloc>(
        () => AddPaymentCardBloc(getIt<AddPaymentCardUseCase>()),
      );
    }
  }
}
