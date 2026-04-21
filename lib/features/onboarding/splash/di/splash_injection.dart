import 'package:get_it/get_it.dart';

import '../data/datasources/splash_delay_data_source.dart';
import '../data/datasources/splash_delay_data_source_impl.dart';
import '../data/repositories/splash_repository_impl.dart';
import '../data/repositories/splash_repository.dart';
import '../domain/usecases/wait_splash_delay_usecase.dart';
import '../presentation/bloc/splash_bloc.dart';

class SplashInjection {
  const SplashInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<SplashDelayDataSource>()) {
      getIt.registerLazySingleton<SplashDelayDataSource>(
        SplashDelayDataSourceImpl.new,
      );
    }

    if (!getIt.isRegistered<SplashRepository>()) {
      getIt.registerLazySingleton<SplashRepository>(
        () => SplashRepositoryImpl(
          delayDataSource: getIt<SplashDelayDataSource>(),
        ),
      );
    }

    if (!getIt.isRegistered<WaitSplashDelayUseCase>()) {
      getIt.registerLazySingleton<WaitSplashDelayUseCase>(
        () => WaitSplashDelayUseCase(repository: getIt<SplashRepository>()),
      );
    }

    if (!getIt.isRegistered<SplashBloc>()) {
      getIt.registerFactory<SplashBloc>(
        () =>
            SplashBloc(waitSplashDelayUseCase: getIt<WaitSplashDelayUseCase>()),
      );
    }
  }
}
