import 'package:get_it/get_it.dart';

import '../data/datasources/catagories_data_source.dart';
import '../data/datasources/catagories_data_source_impl.dart';
import '../data/repositories/catagories_repository_impl.dart';
import '../domain/repositories/catagories_repository.dart';
import '../domain/usecases/get_catagories_usecase.dart';
import '../presentation/bloc/catagories_bloc.dart';

class CatagoriesInjection {
  const CatagoriesInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<CatagoriesDataSource>()) {
      getIt.registerLazySingleton<CatagoriesDataSource>(
        CatagoriesDataSourceImpl.new,
      );
    }

    if (!getIt.isRegistered<CatagoriesRepository>()) {
      getIt.registerLazySingleton<CatagoriesRepository>(
        () =>
            CatagoriesRepositoryImpl(dataSource: getIt<CatagoriesDataSource>()),
      );
    }

    if (!getIt.isRegistered<GetCatagoriesUseCase>()) {
      getIt.registerLazySingleton<GetCatagoriesUseCase>(
        () => GetCatagoriesUseCase(repository: getIt<CatagoriesRepository>()),
      );
    }

    if (!getIt.isRegistered<CatagoriesBloc>()) {
      getIt.registerFactory<CatagoriesBloc>(
        () =>
            CatagoriesBloc(getCatagoriesUseCase: getIt<GetCatagoriesUseCase>()),
      );
    }
  }
}
