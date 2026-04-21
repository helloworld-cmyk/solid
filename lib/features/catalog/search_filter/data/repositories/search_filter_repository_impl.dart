import '../../domain/entities/search_filter.dart';
import '../../domain/repositories/search_filter_repository.dart';
import '../datasources/search_filter_data_source.dart';

class SearchFilterRepositoryImpl implements SearchFilterRepository {
  const SearchFilterRepositoryImpl({required SearchFilterDataSource dataSource})
    : _dataSource = dataSource;

  final SearchFilterDataSource _dataSource;

  @override
  Future<SearchFilter> getSearchFilter() async {
    final model = await _dataSource.getSearchFilter();
    return model.toEntity();
  }
}