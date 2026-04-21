import '../entities/category_item.dart';
import '../repositories/catagories_repository.dart';

class GetCatagoriesUseCase {
  const GetCatagoriesUseCase({required CatagoriesRepository repository})
    : _repository = repository;

  final CatagoriesRepository _repository;

  Future<List<CategoryItem>> call() {
    return _repository.getCatagories();
  }
}
