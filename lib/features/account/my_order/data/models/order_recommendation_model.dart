import '../../domain/entities/order_recommendation.dart';

class OrderRecommendationModel {
  const OrderRecommendationModel({
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

  OrderRecommendation toEntity() {
    return OrderRecommendation(
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
