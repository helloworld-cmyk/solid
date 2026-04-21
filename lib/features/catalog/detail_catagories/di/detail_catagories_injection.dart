import 'package:get_it/get_it.dart';

import '../data/datasources/detail_catagories_data_source.dart';
import '../data/datasources/detail_catagories_data_source_impl.dart';
import '../data/repositories/detail_catagories_repository_impl.dart';
import '../domain/repositories/detail_catagories_repository.dart';
import '../domain/usecases/get_detail_catagories_content_usecase.dart';
import '../presentation/bloc/detail_catagories_bloc.dart';

class DetailCatagoriesInjection {
  const DetailCatagoriesInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<DetailCatagoriesDataSource>()) {
      getIt.registerLazySingleton<DetailCatagoriesDataSource>(
        DetailCatagoriesDataSourceImpl.new,
      );
    }

    if (!getIt.isRegistered<DetailCatagoriesRepository>()) {
      getIt.registerLazySingleton<DetailCatagoriesRepository>(
        () => DetailCatagoriesRepositoryImpl(
          dataSource: getIt<DetailCatagoriesDataSource>(),
        ),
      );
    }

    if (!getIt.isRegistered<GetDetailCatagoriesContentUseCase>()) {
      getIt.registerLazySingleton<GetDetailCatagoriesContentUseCase>(
        () => GetDetailCatagoriesContentUseCase(
          repository: getIt<DetailCatagoriesRepository>(),
        ),
      );
    }

    if (!getIt.isRegistered<DetailCatagoriesBloc>()) {
      getIt.registerFactory<DetailCatagoriesBloc>(
        () => DetailCatagoriesBloc(
          getContentUseCase: getIt<GetDetailCatagoriesContentUseCase>(),
        ),
      );
    }
  }
}
