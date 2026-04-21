import '../../domain/entities/category_item.dart';
import '../../domain/repositories/catagories_repository.dart';
import '../datasources/catagories_data_source.dart';
import '../models/category_item_model.dart';

class CatagoriesRepositoryImpl implements CatagoriesRepository {
  const CatagoriesRepositoryImpl({required CatagoriesDataSource dataSource})
    : _dataSource = dataSource;

  final CatagoriesDataSource _dataSource;

  @override
  Future<List<CategoryItem>> getCatagories() async {
    final List<CategoryItemModel> models = await _dataSource.getCatagories();
    return models
        .map((CategoryItemModel model) => model.toEntity())
        .toList(growable: false);
  }
}
