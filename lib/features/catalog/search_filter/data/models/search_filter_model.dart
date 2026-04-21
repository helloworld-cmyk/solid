import '../../domain/entities/search_filter.dart';

class SearchFilterModel {
  const SearchFilterModel({
    required this.categoryGroups,
    required this.colorValues,
    required this.sizes,
    required this.minPrice,
    required this.maxPrice,
  });

  final List<SearchFilterCategoryGroupModel> categoryGroups;
  final List<int> colorValues;
  final List<String> sizes;
  final double minPrice;
  final double maxPrice;

  SearchFilter toEntity() {
    return SearchFilter(
      categoryGroups: categoryGroups
          .map((SearchFilterCategoryGroupModel model) => model.toEntity())
          .toList(growable: false),
      colorValues: List<int>.from(colorValues),
      sizes: List<String>.from(sizes),
      minPrice: minPrice,
      maxPrice: maxPrice,
    );
  }
}

class SearchFilterCategoryGroupModel {
  const SearchFilterCategoryGroupModel({
    required this.title,
    required this.items,
  });

  final String title;
  final List<String> items;

  SearchFilterCategoryGroup toEntity() {
    return SearchFilterCategoryGroup(
      title: title,
      items: List<String>.from(items),
    );
  }
}