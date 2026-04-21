import 'detail_catagories_product.dart';

class DetailCatagoriesContent {
  const DetailCatagoriesContent({
    required this.categories,
    required this.products,
    required this.heroImagePath,
  });

  final List<String> categories;
  final List<DetailCatagoriesProduct> products;
  final String heroImagePath;
}
