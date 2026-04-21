import '../models/search_filter_model.dart';
import 'search_filter_data_source.dart';

class SearchFilterDataSourceImpl implements SearchFilterDataSource {
  const SearchFilterDataSourceImpl();

  @override
  Future<SearchFilterModel> getSearchFilter() async {
    return const SearchFilterModel(
      categoryGroups: <SearchFilterCategoryGroupModel>[
        SearchFilterCategoryGroupModel(
          title: 'Men',
          items: <String>[
            'Shirts',
            'Polos',
            'Jeans',
            'Trousers',
            'Jackets',
            'Shoes',
            'Accessories',
          ],
        ),
        SearchFilterCategoryGroupModel(
          title: 'Women',
          items: <String>['Dresses', 'Tops', 'Skirts', 'Shoes'],
        ),
        SearchFilterCategoryGroupModel(
          title: 'Kids',
          items: <String>['T-Shirts', 'Shorts', 'Sneakers'],
        ),
      ],
      colorValues: <int>[
        0xFFE8C89E,
        0xFF9B9B9B,
        0xFF79A8E4,
        0xFFE4B2B5,
        0xFFA8C0B6,
        0xFFF5DE4F,
      ],
      sizes: <String>['S', 'M', 'L', 'XL'],
      minPrice: 0,
      maxPrice: 39,
    );
  }
}