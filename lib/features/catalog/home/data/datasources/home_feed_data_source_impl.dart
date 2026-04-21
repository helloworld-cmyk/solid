import '../models/home_category_model.dart';
import '../models/home_feed_model.dart';
import '../models/home_product_model.dart';
import 'home_feed_data_source.dart';

class HomeFeedDataSourceImpl implements HomeFeedDataSource {
  const HomeFeedDataSourceImpl();

  @override
  Future<HomeFeedModel> getHomeFeed() async {
    return const HomeFeedModel(
      categories: <HomeCategoryModel>[
        HomeCategoryModel(name: 'Men', imagePath: 'assets/home/maskgroup1.png'),
        HomeCategoryModel(
          name: 'Women',
          imagePath: 'assets/home/maskgroup2.png',
        ),
        HomeCategoryModel(
          name: 'Kids',
          imagePath: 'assets/home/maskgroup3.png',
        ),
        HomeCategoryModel(
          name: 'Bags',
          imagePath: 'assets/home/maskgroup4.png',
        ),
        HomeCategoryModel(
          name: 'Shoes',
          imagePath: 'assets/catagories/shoes.png',
        ),
        HomeCategoryModel(
          name: 'Accessories',
          imagePath: 'assets/catagories/accessories.png',
        ),
      ],
      hotDeals: <HomeProductModel>[
        HomeProductModel(
          imagePath: 'assets/home/hotdeal1.png',
          name: 'Long-Sleeved T-shirt',
          price: 49,
          soldCount: 358,
        ),
        HomeProductModel(
          imagePath: 'assets/home/hotdeal2.png',
          name: 'Printed Cotton Shirt',
          price: 45,
          soldCount: 358,
        ),
        HomeProductModel(
          imagePath: 'assets/home/hotdeal3.png',
          name: 'Cotton T-shirt',
          price: 49,
          soldCount: 358,
        ),
        HomeProductModel(
          imagePath: 'assets/home/hotdeal4.png',
          name: 'Embroidered T-shirt',
          price: 39,
          soldCount: 358,
        ),
      ],
      newArrivals: <HomeProductModel>[
        HomeProductModel(
          imagePath: 'assets/home/arrival1.png',
          name: 'Cotton T-shirt Text',
          price: 49,
          soldCount: 50,
        ),
        HomeProductModel(
          imagePath: 'assets/home/arrival2.png',
          name: 'Women\'s Day T-shirt',
          price: 49,
          soldCount: 50,
        ),
      ],
      onSale: <HomeProductModel>[
        HomeProductModel(
          imagePath: 'assets/home/onsale1.png',
          name: 'Ankle Boots',
          price: 180,
          soldCount: 358,
        ),
        HomeProductModel(
          imagePath: 'assets/home/onsale2.png',
          name: 'Coat With Belt',
          price: 19,
          soldCount: 358,
        ),
      ],
    );
  }
}
