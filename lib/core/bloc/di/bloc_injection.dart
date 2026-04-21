import 'package:get_it/get_it.dart';
import 'package:solid/features/account/my_order/domain/usecases/get_my_order_recommendations_usecase.dart';
import 'package:solid/features/account/my_order/domain/usecases/get_my_orders_usecase.dart';
import 'package:solid/features/account/my_order/domain/usecases/prepend_my_orders_usecase.dart';
import 'package:solid/features/wishlist/wishlist/domain/usecases/add_wishlist_item_usecase.dart';
import 'package:solid/features/wishlist/wishlist/domain/usecases/get_wishlist_items_usecase.dart';
import 'package:solid/features/wishlist/wishlist/domain/usecases/get_wishlist_recommendations_usecase.dart';
import 'package:solid/features/wishlist/wishlist/domain/usecases/remove_wishlist_item_usecase.dart';

import '../changeprofile/profile_bloc.dart';
import '../auth/auth_bloc.dart';
import '../cart/cart_bloc.dart';
import '../wishlist/wishlist_bloc.dart';
import '../address/address_bloc.dart';
import '../card/card_bloc.dart';
import '../my_order/my_order_bloc.dart';

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

    if (!getIt.isRegistered<AddressBloc>()) {
      getIt.registerLazySingleton<AddressBloc>(AddressBloc.new);
    }

    if (!getIt.isRegistered<CardBloc>()) {
      getIt.registerLazySingleton<CardBloc>(CardBloc.new);
    }

    if (!getIt.isRegistered<MyOrderBloc>()) {
      getIt.registerLazySingleton<MyOrderBloc>(
        () => MyOrderBloc(
          getMyOrders: getIt<GetMyOrdersUseCase>(),
          getRecommendations: getIt<GetMyOrderRecommendationsUseCase>(),
          prependMyOrders: getIt<PrependMyOrdersUseCase>(),
        ),
      );
    }

    if (!getIt.isRegistered<WishlistBloc>()) {
      getIt.registerLazySingleton<WishlistBloc>(
        () => WishlistBloc(
          getWishlistItems: getIt<GetWishlistItemsUseCase>(),
          getWishlistRecommendations:
              getIt<GetWishlistRecommendationsUseCase>(),
          addWishlistItem: getIt<AddWishlistItemUseCase>(),
          removeWishlistItem: getIt<RemoveWishlistItemUseCase>(),
        ),
      );
    }
  }
}
