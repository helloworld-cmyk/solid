import '../../domain/entities/detail_catagories_content.dart';
import '../../domain/repositories/detail_catagories_repository.dart';
import '../datasources/detail_catagories_data_source.dart';

class DetailCatagoriesRepositoryImpl implements DetailCatagoriesRepository {
  const DetailCatagoriesRepositoryImpl({
    required DetailCatagoriesDataSource dataSource,
  }) : _dataSource = dataSource;

  final DetailCatagoriesDataSource _dataSource;

  @override
  Future<DetailCatagoriesContent> getContent(String categoryTitle) async {
    final model = await _dataSource.getContent(categoryTitle);
    return model.toEntity();
  }
}
