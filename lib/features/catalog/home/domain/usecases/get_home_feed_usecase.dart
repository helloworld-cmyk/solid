import '../entities/home_feed.dart';
import '../repositories/home_repository.dart';

class GetHomeFeedUseCase {
  const GetHomeFeedUseCase({required HomeRepository repository})
    : _repository = repository;

  final HomeRepository _repository;

  Future<HomeFeed> call() {
    return _repository.getHomeFeed();
  }
}
