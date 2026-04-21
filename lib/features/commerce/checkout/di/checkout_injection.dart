import 'package:get_it/get_it.dart';

import '../data/datasources/checkout_data_source.dart';
import '../data/datasources/checkout_data_source_impl.dart';
import '../data/repositories/checkout_repository_impl.dart';
import '../domain/repositories/checkout_repository.dart';
import '../domain/usecases/apply_coupon_usecase.dart';
import '../domain/usecases/get_checkout_order_usecase.dart';
import '../domain/usecases/place_order_usecase.dart';
import '../presentation/bloc/checkout_bloc.dart';

class CheckoutInjection {
  const CheckoutInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<CheckoutDataSource>()) {
      getIt.registerLazySingleton<CheckoutDataSource>(
        CheckoutDataSourceImpl.new,
      );
    }

    if (!getIt.isRegistered<CheckoutRepository>()) {
      getIt.registerLazySingleton<CheckoutRepository>(
        () => CheckoutRepositoryImpl(dataSource: getIt<CheckoutDataSource>()),
      );
    }

    if (!getIt.isRegistered<GetCheckoutOrderUseCase>()) {
      getIt.registerLazySingleton<GetCheckoutOrderUseCase>(
        () => GetCheckoutOrderUseCase(repository: getIt<CheckoutRepository>()),
      );
    }

    if (!getIt.isRegistered<ApplyCouponUseCase>()) {
      getIt.registerLazySingleton<ApplyCouponUseCase>(
        () => ApplyCouponUseCase(repository: getIt<CheckoutRepository>()),
      );
    }

    if (!getIt.isRegistered<PlaceOrderUseCase>()) {
      getIt.registerLazySingleton<PlaceOrderUseCase>(
        () => PlaceOrderUseCase(repository: getIt<CheckoutRepository>()),
      );
    }

    if (!getIt.isRegistered<CheckoutBloc>()) {
      getIt.registerFactory<CheckoutBloc>(
        () => CheckoutBloc(
          getCheckoutOrderUseCase: getIt<GetCheckoutOrderUseCase>(),
          applyCouponUseCase: getIt<ApplyCouponUseCase>(),
          placeOrderUseCase: getIt<PlaceOrderUseCase>(),
        ),
      );
    }
  }
}
