import 'splash_repository.dart';
import '../datasources/splash_delay_data_source.dart';

class SplashRepositoryImpl implements SplashRepository {
  SplashRepositoryImpl({required SplashDelayDataSource delayDataSource})
    : _delayDataSource = delayDataSource;

  final SplashDelayDataSource _delayDataSource;

  @override
  Future<void> waitForInitialNavigation() {
    return _delayDataSource.waitDuration();
  }
}
