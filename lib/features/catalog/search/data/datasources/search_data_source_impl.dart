import '../models/search_content_model.dart';
import '../models/search_product_item_model.dart';
import 'search_data_source.dart';

class SearchDataSourceImpl implements SearchDataSource {
  const SearchDataSourceImpl();

  @override
  Future<SearchContentModel> getSearchContent() async {
    return const SearchContentModel(
      filterCategories: <String>[
        'Shoes',
        'Dresses',
        'Shirts',
        'Polos',
        'Jeans',
        'Blazers',
        'Coats',
        'Trousers',
        'Skirts',
        'Bag',
        'Jacket',
        'Top',
      ],
      products: <SearchProductItemModel>[
        SearchProductItemModel(
          name: 'Printed Cotton Shirt',
          soldLabel: 'Sold (50 Products)',
          price: 45,
          imagePath: 'assets/catagories/women/women1.jpg',
          type: 'Shirts',
        ),
        SearchProductItemModel(
          name: 'Cotton T-shirt',
          soldLabel: 'Sold (50 Products)',
          price: 49,
          imagePath: 'assets/catagories/men/men6.png',
          type: 'Shirts',
        ),
        SearchProductItemModel(
          name: 'Cotton Polo Shirt',
          soldLabel: 'Sold (50 Products)',
          price: 39,
          imagePath: 'assets/catagories/men/men4.png',
          type: 'Polos',
        ),
        SearchProductItemModel(
          name: 'Ankle Boots',
          soldLabel: 'Sold (50 Products)',
          price: 219,
          displayPrice: '\$ 219.00 - 180.00',
          imagePath: 'assets/catagories/shoes/shoes1.jpeg',
          type: 'Shoes',
        ),
        SearchProductItemModel(
          name: 'Long-sleeved tT-shirt',
          soldLabel: 'Sold (50 Products)',
          price: 49,
          imagePath: 'assets/catagories/women/women2.jpg',
          type: 'Shirts',
        ),
        SearchProductItemModel(
          name: 'Embroidered T-shirt',
          soldLabel: 'Sold (50 Products)',
          price: 39,
          imagePath: 'assets/catagories/kids/kid1.jpeg',
          type: 'Shirts',
        ),
      ],
    );
  }
}
