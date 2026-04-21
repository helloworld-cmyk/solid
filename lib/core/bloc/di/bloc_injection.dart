import 'package:get_it/get_it.dart';
import 'package:solid/features/wishlist/wishlist/domain/usecases/add_wishlist_item_usecase.dart';
import 'package:solid/features/wishlist/wishlist/domain/usecases/get_wishlist_items_usecase.dart';
import 'package:solid/features/wishlist/wishlist/domain/usecases/get_wishlist_recommendations_usecase.dart';
import 'package:solid/features/wishlist/wishlist/domain/usecases/remove_wishlist_item_usecase.dart';

import '../changeprofile/profile_bloc.dart';
import '../auth/auth_bloc.dart';
import '../cart/cart_bloc.dart';
import '../wishlist/wishlist_bloc.dart';

class BlocInjection {
  const BlocInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<AuthBloc>()) {
      getIt.registerLazySingleton<AuthBloc>(AuthBloc.new);
    }

    if (!getIt.isRegistered<CartBloc>()) {
      getIt.registerLazySingleton<CartBloc>(CartBloc.new);
    }

    if (!getIt.isRegistered<GlobalProfileBloc>()) {
      getIt.registerLazySingleton<GlobalProfileBloc>(GlobalProfileBloc.new);
    }

    if (!getIt.isRegistered<WishlistBloc>()) {
      getIt.registerLazySingleton<WishlistBloc>(
        () => WishlistBloc(
          getWishlistItems: getIt<GetWishlistItemsUseCase>(),
          getWishlistRecommendations: getIt<GetWishlistRecommendationsUseCase>(),
          addWishlistItem: getIt<AddWishlistItemUseCase>(),
          removeWishlistItem: getIt<RemoveWishlistItemUseCase>(),
        ),
      );
    }
  }
}
