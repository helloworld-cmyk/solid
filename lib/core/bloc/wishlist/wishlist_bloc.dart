import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid/features/wishlist/wishlist/domain/entities/wishlist_item.dart';
import 'package:solid/features/wishlist/wishlist/domain/entities/wishlist_recommendation.dart';
import 'package:solid/features/wishlist/wishlist/domain/usecases/add_wishlist_item_usecase.dart';
import 'package:solid/features/wishlist/wishlist/domain/usecases/get_wishlist_items_usecase.dart';
import 'package:solid/features/wishlist/wishlist/domain/usecases/get_wishlist_recommendations_usecase.dart';
import 'package:solid/features/wishlist/wishlist/domain/usecases/remove_wishlist_item_usecase.dart';

import 'wishlist_event.dart';
import 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc({
    required GetWishlistItemsUseCase getWishlistItems,
    required GetWishlistRecommendationsUseCase getWishlistRecommendations,
    required AddWishlistItemUseCase addWishlistItem,
    required RemoveWishlistItemUseCase removeWishlistItem,
  }) : _getWishlistItems = getWishlistItems,
       _getWishlistRecommendations = getWishlistRecommendations,
       _addWishlistItem = addWishlistItem,
       _removeWishlistItem = removeWishlistItem,
       super(const WishlistState()) {
    on<WishlistStarted>(_onStarted);
    on<WishlistItemAdded>(_onItemAdded);
    on<WishlistItemRemoved>(_onItemRemoved);

    add(const WishlistStarted());
  }

  final GetWishlistItemsUseCase _getWishlistItems;
  final GetWishlistRecommendationsUseCase _getWishlistRecommendations;
  final AddWishlistItemUseCase _addWishlistItem;
  final RemoveWishlistItemUseCase _removeWishlistItem;

  Future<void> _onStarted(
    WishlistStarted event,
    Emitter<WishlistState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, clearErrorMessage: true));

    try {
      final List<WishlistItem> items = await _getWishlistItems();
      final List<WishlistRecommendation> recommendations =
          await _getWishlistRecommendations();

      emit(
        state.copyWith(
          isLoading: false,
          items: items,
          recommendations: recommendations,
          clearErrorMessage: true,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Unable to load wishlist. Please try again.',
        ),
      );
    }
  }

  Future<void> _onItemAdded(
    WishlistItemAdded event,
    Emitter<WishlistState> emit,
  ) async {
    final WishlistItem item = WishlistItem(
      id: event.id,
      name: event.name,
      imagePath: event.imagePath,
      price: event.price,
      isAsset: event.isAsset,
    );

    try {
      final List<WishlistItem> updatedItems = await _addWishlistItem(item);
      emit(state.copyWith(items: updatedItems, clearErrorMessage: true));
    } catch (_) {
      emit(
        state.copyWith(
          errorMessage: 'Unable to update wishlist. Please try again.',
        ),
      );
    }
  }

  Future<void> _onItemRemoved(
    WishlistItemRemoved event,
    Emitter<WishlistState> emit,
  ) async {
    try {
      final List<WishlistItem> updatedItems = await _removeWishlistItem(
        event.productId,
      );
      emit(state.copyWith(items: updatedItems, clearErrorMessage: true));
    } catch (_) {
      emit(
        state.copyWith(
          errorMessage: 'Unable to remove wishlist item. Please try again.',
        ),
      );
    }
  }
}