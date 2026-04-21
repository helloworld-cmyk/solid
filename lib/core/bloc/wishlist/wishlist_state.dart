import 'package:solid/features/wishlist/wishlist/domain/entities/wishlist_item.dart';
import 'package:solid/features/wishlist/wishlist/domain/entities/wishlist_recommendation.dart';

class WishlistState {
  const WishlistState({
    this.isLoading = false,
    this.items = const <WishlistItem>[],
    this.recommendations = const <WishlistRecommendation>[],
    this.errorMessage,
  });

  final bool isLoading;
  final List<WishlistItem> items;
  final List<WishlistRecommendation> recommendations;
  final String? errorMessage;

  bool contains(String productId) {
    return items.any((WishlistItem item) => item.id == productId);
  }

  WishlistState copyWith({
    bool? isLoading,
    List<WishlistItem>? items,
    List<WishlistRecommendation>? recommendations,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return WishlistState(
      isLoading: isLoading ?? this.isLoading,
      items: items ?? this.items,
      recommendations: recommendations ?? this.recommendations,
      errorMessage: clearErrorMessage
          ? null
          : (errorMessage ?? this.errorMessage),
    );
  }
}