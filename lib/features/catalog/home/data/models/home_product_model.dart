import '../../domain/entities/home_product.dart';

class HomeProductModel {
  const HomeProductModel({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.soldCount,
    this.isAsset = true,
  });

  final String imagePath;
  final String name;
  final double price;
  final int soldCount;
  final bool isAsset;

  HomeProduct toEntity() {
    return HomeProduct(
      imagePath: imagePath,
      name: name,
      price: price,
      soldCount: soldCount,
      isAsset: isAsset,
    );
  }
}
