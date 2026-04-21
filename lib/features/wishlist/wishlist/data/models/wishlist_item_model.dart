import '../../domain/entities/wishlist_item.dart';

class WishlistItemModel {
  const WishlistItemModel({
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

  WishlistItem toEntity() {
    return WishlistItem(
      id: id,
      name: name,
      imagePath: imagePath,
      price: price,
      isAsset: isAsset,
    );
  }

  factory WishlistItemModel.fromEntity(WishlistItem entity) {
    return WishlistItemModel(
      id: entity.id,
      name: entity.name,
      imagePath: entity.imagePath,
      price: entity.price,
      isAsset: entity.isAsset,
    );
  }
}