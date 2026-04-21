class HomeProduct {
  const HomeProduct({
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
}
