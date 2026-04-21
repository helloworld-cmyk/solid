import '../entities/wishlist_item.dart';
import '../entities/wishlist_recommendation.dart';

abstract class WishlistRepository {
  Future<List<WishlistItem>> getWishlistItems();

  Future<List<WishlistItem>> addWishlistItem(WishlistItem item);

  Future<List<WishlistItem>> removeWishlistItem(String productId);

  Future<List<WishlistRecommendation>> getWishlistRecommendations();
}