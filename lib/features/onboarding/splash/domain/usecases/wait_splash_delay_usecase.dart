import '../../data/repositories/splash_repository.dart';

class WaitSplashDelayUseCase {
  WaitSplashDelayUseCase({required SplashRepository repository})
    : _repository = repository;

  final SplashRepository _repository;

  Future<void> call() {
    return _repository.waitForInitialNavigation();
  }
}
