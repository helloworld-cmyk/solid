import 'splash_delay_data_source.dart';

class SplashDelayDataSourceImpl implements SplashDelayDataSource {
  SplashDelayDataSourceImpl({Duration? delay})
    : _delay = delay ?? const Duration(seconds: 3);

  final Duration _delay;

  @override
  Future<void> waitDuration() {
    return Future<void>.delayed(_delay);
  }
}
