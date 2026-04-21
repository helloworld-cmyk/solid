import '../models/category_item_model.dart';

abstract class CatagoriesDataSource {
  Future<List<CategoryItemModel>> getCatagories();
}
