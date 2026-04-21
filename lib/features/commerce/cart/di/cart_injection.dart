import 'package:get_it/get_it.dart';

import '../data/datasources/cart_suggestions_data_source.dart';
import '../data/datasources/cart_suggestions_data_source_impl.dart';
import '../data/repositories/cart_suggestions_repository_impl.dart';
import '../domain/repositories/cart_suggestions_repository.dart';
import '../domain/usecases/get_cart_suggestions_usecase.dart';

class CartInjection {
  const CartInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<CartSuggestionsDataSource>()) {
      getIt.registerLazySingleton<CartSuggestionsDataSource>(
        CartSuggestionsDataSourceImpl.new,
      );
    }

    if (!getIt.isRegistered<CartSuggestionsRepository>()) {
      getIt.registerLazySingleton<CartSuggestionsRepository>(
        () => CartSuggestionsRepositoryImpl(
          dataSource: getIt<CartSuggestionsDataSource>(),
        ),
      );
    }

    if (!getIt.isRegistered<GetCartSuggestionsUseCase>()) {
      getIt.registerLazySingleton<GetCartSuggestionsUseCase>(
        () => GetCartSuggestionsUseCase(
          repository: getIt<CartSuggestionsRepository>(),
        ),
      );
    }
  }
}
