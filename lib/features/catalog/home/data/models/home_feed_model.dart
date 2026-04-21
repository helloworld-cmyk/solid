import '../../domain/entities/home_feed.dart';
import 'home_category_model.dart';
import 'home_product_model.dart';

class HomeFeedModel {
  const HomeFeedModel({
    required this.categories,
    required this.hotDeals,
    required this.newArrivals,
    required this.onSale,
  });

  final List<HomeCategoryModel> categories;
  final List<HomeProductModel> hotDeals;
  final List<HomeProductModel> newArrivals;
  final List<HomeProductModel> onSale;

  HomeFeed toEntity() {
    return HomeFeed(
      categories: categories
          .map((HomeCategoryModel model) => model.toEntity())
          .toList(growable: false),
      hotDeals: hotDeals
          .map((HomeProductModel model) => model.toEntity())
          .toList(growable: false),
      newArrivals: newArrivals
          .map((HomeProductModel model) => model.toEntity())
          .toList(growable: false),
      onSale: onSale
          .map((HomeProductModel model) => model.toEntity())
          .toList(growable: false),
    );
  }
}
