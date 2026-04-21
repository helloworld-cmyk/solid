import 'package:get_it/get_it.dart';

import '../data/datasources/wishlist_data_source.dart';
import '../data/datasources/wishlist_data_source_impl.dart';
import '../data/repositories/wishlist_repository_impl.dart';
import '../domain/repositories/wishlist_repository.dart';
import '../domain/usecases/add_wishlist_item_usecase.dart';
import '../domain/usecases/get_wishlist_items_usecase.dart';
import '../domain/usecases/get_wishlist_recommendations_usecase.dart';
import '../domain/usecases/remove_wishlist_item_usecase.dart';

class WishlistScreenInjection {
  const WishlistScreenInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<WishlistDataSource>()) {
      getIt.registerLazySingleton<WishlistDataSource>(WishlistDataSourceImpl.new);
    }

    if (!getIt.isRegistered<WishlistRepository>()) {
      getIt.registerLazySingleton<WishlistRepository>(
        () => WishlistRepositoryImpl(dataSource: getIt<WishlistDataSource>()),
      );
    }

    if (!getIt.isRegistered<GetWishlistItemsUseCase>()) {
      getIt.registerLazySingleton<GetWishlistItemsUseCase>(
        () => GetWishlistItemsUseCase(repository: getIt<WishlistRepository>()),
      );
    }

    if (!getIt.isRegistered<GetWishlistRecommendationsUseCase>()) {
      getIt.registerLazySingleton<GetWishlistRecommendationsUseCase>(
        () => GetWishlistRecommendationsUseCase(
          repository: getIt<WishlistRepository>(),
        ),
      );
    }

    if (!getIt.isRegistered<AddWishlistItemUseCase>()) {
      getIt.registerLazySingleton<AddWishlistItemUseCase>(
        () => AddWishlistItemUseCase(repository: getIt<WishlistRepository>()),
      );
    }

    if (!getIt.isRegistered<RemoveWishlistItemUseCase>()) {
      getIt.registerLazySingleton<RemoveWishlistItemUseCase>(
        () =>
            RemoveWishlistItemUseCase(repository: getIt<WishlistRepository>()),
      );
    }
  }
}