import '../entities/detail_catagories_content.dart';
import '../repositories/detail_catagories_repository.dart';

class GetDetailCatagoriesContentUseCase {
  const GetDetailCatagoriesContentUseCase({
    required DetailCatagoriesRepository repository,
  }) : _repository = repository;

  final DetailCatagoriesRepository _repository;

  Future<DetailCatagoriesContent> call(String categoryTitle) {
    return _repository.getContent(categoryTitle);
  }
}
