import '../../domain/entities/search_content.dart';
import '../../domain/repositories/search_repository.dart';
import '../datasources/search_data_source.dart';

class SearchRepositoryImpl implements SearchRepository {
  const SearchRepositoryImpl({required SearchDataSource dataSource})
    : _dataSource = dataSource;

  final SearchDataSource _dataSource;

  @override
  Future<SearchContent> getSearchContent() async {
    final content = await _dataSource.getSearchContent();
    return content.toEntity();
  }
}
