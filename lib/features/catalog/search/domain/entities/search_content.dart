import 'search_product_item.dart';

class SearchContent {
  const SearchContent({required this.filterCategories, required this.products});

  final List<String> filterCategories;
  final List<SearchProductItem> products;
}
