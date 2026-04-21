import '../../domain/entities/order.dart';

class OrderModel {
  const OrderModel({
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

  Order toEntity() {
    return Order(
      id: id,
      name: name,
      imagePath: imagePath,
      price: price,
      quantity: quantity,
      isAsset: isAsset,
    );
  }

  factory OrderModel.fromEntity(Order entity) {
    return OrderModel(
      id: entity.id,
      name: entity.name,
      imagePath: entity.imagePath,
      price: entity.price,
      quantity: entity.quantity,
      isAsset: entity.isAsset,
    );
  }
}
