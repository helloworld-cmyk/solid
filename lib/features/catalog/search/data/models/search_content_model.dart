import '../../domain/entities/search_content.dart';
import 'search_product_item_model.dart';

class SearchContentModel {
  const SearchContentModel({
    required this.filterCategories,
    required this.products,
  });

  final List<String> filterCategories;
  final List<SearchProductItemModel> products;

  SearchContent toEntity() {
    return SearchContent(
      filterCategories: filterCategories,
      products: products
          .map((SearchProductItemModel model) => model.toEntity())
          .toList(growable: false),
    );
  }
}
