import '../../domain/entities/home_category.dart';

class HomeCategoryModel {
  const HomeCategoryModel({
    required this.name,
    required this.imagePath,
    this.isAsset = true,
  });

  final String name;
  final String imagePath;
  final bool isAsset;

  HomeCategory toEntity() {
    return HomeCategory(name: name, imagePath: imagePath, isAsset: isAsset);
  }
}
