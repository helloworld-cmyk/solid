import '../entities/onboard_page.dart';
import '../repositories/onboard_pages_repository.dart';

class GetOnboardPagesUseCase {
  const GetOnboardPagesUseCase({required OnboardPagesRepository repository})
    : _repository = repository;

  final OnboardPagesRepository _repository;

  List<OnboardPage> call() {
    return _repository.getPages();
  }
}
