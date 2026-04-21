import '../entities/category_item.dart';

abstract class CatagoriesRepository {
  Future<List<CategoryItem>> getCatagories();
}
