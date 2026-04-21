class HomeCategory {
  const HomeCategory({
    required this.name,
    required this.imagePath,
    this.isAsset = true,
  });

  final String name;
  final String imagePath;
  final bool isAsset;
}
