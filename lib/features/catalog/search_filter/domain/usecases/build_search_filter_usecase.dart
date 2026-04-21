import '../entities/search_filter.dart';
import '../repositories/search_filter_repository.dart';

class BuildSearchFilterUseCase {
  const BuildSearchFilterUseCase({required SearchFilterRepository repository})
    : _repository = repository;

  final SearchFilterRepository _repository;

  Future<SearchFilter> call() {
    return _repository.getSearchFilter();
  }
}