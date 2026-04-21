import '../entities/search_content.dart';
import '../repositories/search_repository.dart';

class GetSearchContentUseCase {
  const GetSearchContentUseCase({required SearchRepository repository})
    : _repository = repository;

  final SearchRepository _repository;

  Future<SearchContent> call() {
    return _repository.getSearchContent();
  }
}
