class WishlistItem {
  const WishlistItem({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    this.isAsset = true,
  });

  final String id;
  final String name;
  final String imagePath;
  final double price;
  final bool isAsset;

  String get priceText => '\$ ${price.toStringAsFixed(2)}';

  WishlistItem copyWith({
    String? id,
    String? name,
    String? imagePath,
    double? price,
    bool? isAsset,
  }) {
    return WishlistItem(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      price: price ?? this.price,
      isAsset: isAsset ?? this.isAsset,
    );
  }
}