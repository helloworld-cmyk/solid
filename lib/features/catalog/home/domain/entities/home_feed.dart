import 'home_category.dart';
import 'home_product.dart';

class HomeFeed {
  const HomeFeed({
    required this.categories,
    required this.hotDeals,
    required this.newArrivals,
    required this.onSale,
  });

  static const HomeFeed empty = HomeFeed(
    categories: <HomeCategory>[],
    hotDeals: <HomeProduct>[],
    newArrivals: <HomeProduct>[],
    onSale: <HomeProduct>[],
  );

  final List<HomeCategory> categories;
  final List<HomeProduct> hotDeals;
  final List<HomeProduct> newArrivals;
  final List<HomeProduct> onSale;
}
