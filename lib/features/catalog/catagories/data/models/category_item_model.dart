import '../../domain/entities/category_item.dart';

class CategoryItemModel {
  const CategoryItemModel({
    required this.title,
    required this.imagePath,
    required this.lineWidth,
  });

  final String title;
  final String imagePath;
  final double lineWidth;

  CategoryItem toEntity() {
    return CategoryItem(
      title: title,
      imagePath: imagePath,
      lineWidth: lineWidth,
    );
  }
}
