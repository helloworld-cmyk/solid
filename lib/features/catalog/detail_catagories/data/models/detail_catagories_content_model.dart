import '../../domain/entities/detail_catagories_content.dart';
import 'detail_catagories_product_model.dart';

class DetailCatagoriesContentModel {
  const DetailCatagoriesContentModel({
    required this.categories,
    required this.products,
    required this.heroImagePath,
  });

  final List<String> categories;
  final List<DetailCatagoriesProductModel> products;
  final String heroImagePath;

  DetailCatagoriesContent toEntity() {
    return DetailCatagoriesContent(
      categories: categories,
      products: products
          .map((DetailCatagoriesProductModel e) => e.toEntity())
          .toList(growable: false),
      heroImagePath: heroImagePath,
    );
  }
}
