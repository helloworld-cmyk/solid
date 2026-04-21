import 'package:get_it/get_it.dart';

import 'package:solid/core/bloc/address/address_bloc.dart';
import '../domain/usecases/save_address_usecase.dart';
import '../presentation/bloc/add_address_bloc.dart';

class AddAddressInjection {
  const AddAddressInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<SaveAddressUseCase>()) {
      getIt.registerFactory<SaveAddressUseCase>(
        () => SaveAddressUseCase(addressBloc: getIt<AddressBloc>()),
      );
    }
    if (!getIt.isRegistered<AddAddressBloc>()) {
      getIt.registerFactory<AddAddressBloc>(
        () => AddAddressBloc(getIt<SaveAddressUseCase>()),
      );
    }
  }
}
