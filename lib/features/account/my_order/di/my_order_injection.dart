import 'package:get_it/get_it.dart';

import '../data/datasources/my_order_data_source.dart';
import '../data/datasources/my_order_data_source_impl.dart';
import '../data/repositories/my_order_repository_impl.dart';
import '../domain/repositories/my_order_repository.dart';
import '../domain/usecases/get_my_order_recommendations_usecase.dart';
import '../domain/usecases/get_my_orders_usecase.dart';
import '../domain/usecases/prepend_my_orders_usecase.dart';

class MyOrderInjection {
  const MyOrderInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<MyOrderDataSource>()) {
      getIt.registerLazySingleton<MyOrderDataSource>(MyOrderDataSourceImpl.new);
    }

    if (!getIt.isRegistered<MyOrderRepository>()) {
      getIt.registerLazySingleton<MyOrderRepository>(
        () => MyOrderRepositoryImpl(dataSource: getIt<MyOrderDataSource>()),
      );
    }

    if (!getIt.isRegistered<GetMyOrdersUseCase>()) {
      getIt.registerLazySingleton<GetMyOrdersUseCase>(
        () => GetMyOrdersUseCase(repository: getIt<MyOrderRepository>()),
      );
    }

    if (!getIt.isRegistered<PrependMyOrdersUseCase>()) {
      getIt.registerLazySingleton<PrependMyOrdersUseCase>(
        () => PrependMyOrdersUseCase(repository: getIt<MyOrderRepository>()),
      );
    }

    if (!getIt.isRegistered<GetMyOrderRecommendationsUseCase>()) {
      getIt.registerLazySingleton<GetMyOrderRecommendationsUseCase>(
        () => GetMyOrderRecommendationsUseCase(
          repository: getIt<MyOrderRepository>(),
        ),
      );
    }
  }
}
