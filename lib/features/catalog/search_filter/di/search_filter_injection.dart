import 'package:get_it/get_it.dart';

import '../data/datasources/search_filter_data_source.dart';
import '../data/datasources/search_filter_data_source_impl.dart';
import '../data/repositories/search_filter_repository_impl.dart';
import '../domain/repositories/search_filter_repository.dart';
import '../domain/usecases/build_search_filter_usecase.dart';
import '../presentation/bloc/search_filter_bloc.dart';

class SearchFilterInjection {
  const SearchFilterInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<SearchFilterDataSource>()) {
      getIt.registerLazySingleton<SearchFilterDataSource>(
        SearchFilterDataSourceImpl.new,
      );
    }

    if (!getIt.isRegistered<SearchFilterRepository>()) {
      getIt.registerLazySingleton<SearchFilterRepository>(
        () => SearchFilterRepositoryImpl(
          dataSource: getIt<SearchFilterDataSource>(),
        ),
      );
    }

    if (!getIt.isRegistered<BuildSearchFilterUseCase>()) {
      getIt.registerLazySingleton<BuildSearchFilterUseCase>(
        () => BuildSearchFilterUseCase(
          repository: getIt<SearchFilterRepository>(),
        ),
      );
    }

    if (!getIt.isRegistered<SearchFilterBloc>()) {
      getIt.registerFactory<SearchFilterBloc>(
        () => SearchFilterBloc(
          buildSearchFilterUseCase: getIt<BuildSearchFilterUseCase>(),
        ),
      );
    }
  }
}