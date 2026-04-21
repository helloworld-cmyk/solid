import '../models/wishlist_item_model.dart';
import '../models/wishlist_recommendation_model.dart';

abstract class WishlistDataSource {
  Future<List<WishlistItemModel>> getWishlistItems();

  Future<List<WishlistItemModel>> addWishlistItem(WishlistItemModel item);

  Future<List<WishlistItemModel>> removeWishlistItem(String productId);

  Future<List<WishlistRecommendationModel>> getWishlistRecommendations();
}