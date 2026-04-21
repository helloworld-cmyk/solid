class SearchFilter {
  const SearchFilter({
    required this.categoryGroups,
    required this.colorValues,
    required this.sizes,
    required this.minPrice,
    required this.maxPrice,
  });

  final List<SearchFilterCategoryGroup> categoryGroups;
  final List<int> colorValues;
  final List<String> sizes;
  final double minPrice;
  final double maxPrice;
}

class SearchFilterCategoryGroup {
  const SearchFilterCategoryGroup({required this.title, required this.items});

  final String title;
  final List<String> items;
}