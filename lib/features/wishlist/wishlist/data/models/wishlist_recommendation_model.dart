import '../../domain/entities/wishlist_recommendation.dart';

class WishlistRecommendationModel {
  const WishlistRecommendationModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.soldLabel,
    this.originalPrice,
    this.isAsset = true,
  });

  final String id;
  final String name;
  final String imagePath;
  final double price;
  final String soldLabel;
  final double? originalPrice;
  final bool isAsset;

  WishlistRecommendation toEntity() {
    return WishlistRecommendation(
      id: id,
      name: name,
      imagePath: imagePath,
      price: price,
      soldLabel: soldLabel,
      originalPrice: originalPrice,
      isAsset: isAsset,
    );
  }
}