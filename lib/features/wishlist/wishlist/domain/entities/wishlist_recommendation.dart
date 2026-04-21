class WishlistRecommendation {
  const WishlistRecommendation({
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

  String get priceText => '\$ ${price.toStringAsFixed(2)}';

  String? get originalPriceText =>
      originalPrice == null ? null : '\$ ${originalPrice!.toStringAsFixed(2)}';
}