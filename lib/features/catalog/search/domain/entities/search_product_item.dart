class SearchProductItem {
  const SearchProductItem({
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
}
