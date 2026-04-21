import '../../domain/entities/search_product_item.dart';

class SearchProductItemModel {
  const SearchProductItemModel({
    required this.name,
    required this.soldLabel,
    required this.price,
    required this.imagePath,
    required this.type,
    this.displayPrice,
  });

  final String name;
  final String soldLabel;
  final double price;
  final String imagePath;
  final String type;
  final String? displayPrice;

  SearchProductItem toEntity() {
    return SearchProductItem(
      name: name,
      soldLabel: soldLabel,
      price: price,
      imagePath: imagePath,
      type: type,
      displayPrice: displayPrice,
    );
  }
}
