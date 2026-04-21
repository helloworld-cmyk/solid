class Order {
  const Order({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    this.quantity = 1,
    this.isAsset = true,
  });

  final String id;
  final String name;
  final String imagePath;
  final double price;
  final int quantity;
  final bool isAsset;

  String get priceLabel => '\$ ${price.toStringAsFixed(2)}';

  Order copyWith({
    String? id,
    String? name,
    String? imagePath,
    double? price,
    int? quantity,
    bool? isAsset,
  }) {
    return Order(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      isAsset: isAsset ?? this.isAsset,
    );
  }
}
