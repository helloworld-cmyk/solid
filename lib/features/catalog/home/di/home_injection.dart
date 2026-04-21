import 'package:get_it/get_it.dart';

import '../data/datasources/home_feed_data_source.dart';
import '../data/datasources/home_feed_data_source_impl.dart';
import '../data/repositories/home_repository_impl.dart';
import '../domain/repositories/home_repository.dart';
import '../domain/usecases/get_home_feed_usecase.dart';
import '../presentation/bloc/home_bloc.dart';

class HomeInjection {
  const HomeInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<HomeFeedDataSource>()) {
      getIt.registerLazySingleton<HomeFeedDataSource>(
        HomeFeedDataSourceImpl.new,
      );
    }

    if (!getIt.isRegistered<HomeRepository>()) {
      getIt.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(dataSource: getIt<HomeFeedDataSource>()),
      );
    }

    if (!getIt.isRegistered<GetHomeFeedUseCase>()) {
      getIt.registerLazySingleton<GetHomeFeedUseCase>(
        () => GetHomeFeedUseCase(repository: getIt<HomeRepository>()),
      );
    }

    if (!getIt.isRegistered<HomeBloc>()) {
      getIt.registerFactory<HomeBloc>(
        () => HomeBloc(getHomeFeedUseCase: getIt<GetHomeFeedUseCase>()),
      );
    }
  }
}
