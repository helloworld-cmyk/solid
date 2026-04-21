import '../../domain/entities/detail_catagories_product.dart';

class DetailCatagoriesProductModel {
  const DetailCatagoriesProductModel({
    required this.name,
    required this.soldLabel,
    required this.price,
    required this.imagePath,
    required this.type,
  });

  final String name;
  final String soldLabel;
  final double price;
  final String imagePath;
  final String type;

  DetailCatagoriesProduct toEntity() {
    return DetailCatagoriesProduct(
      name: name,
      soldLabel: soldLabel,
      price: price,
      imagePath: imagePath,
      type: type,
    );
  }
}
