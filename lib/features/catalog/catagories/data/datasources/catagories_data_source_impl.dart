import '../models/category_item_model.dart';
import 'catagories_data_source.dart';

class CatagoriesDataSourceImpl implements CatagoriesDataSource {
  const CatagoriesDataSourceImpl();

  @override
  Future<List<CategoryItemModel>> getCatagories() async {
    return const <CategoryItemModel>[
      CategoryItemModel(
        title: 'MEN',
        imagePath: 'assets/catagories/men.png',
        lineWidth: 58,
      ),
      CategoryItemModel(
        title: 'WOMEN',
        imagePath: 'assets/catagories/women.png',
        lineWidth: 60,
      ),
      CategoryItemModel(
        title: 'KIDS',
        imagePath: 'assets/catagories/kids.png',
        lineWidth: 58,
      ),
      CategoryItemModel(
        title: 'BAGS',
        imagePath: 'assets/catagories/bags.png',
        lineWidth: 62,
      ),
      CategoryItemModel(
        title: 'SHOES',
        imagePath: 'assets/catagories/shoes.png',
        lineWidth: 76,
      ),
      CategoryItemModel(
        title: 'ACCESSORIES',
        imagePath: 'assets/catagories/accessories.png',
        lineWidth: 160,
      ),
    ];
  }
}
