import 'package:get_it/get_it.dart';

import '../data/datasources/search_data_source.dart';
import '../data/datasources/search_data_source_impl.dart';
import '../data/repositories/search_repository_impl.dart';
import '../domain/repositories/search_repository.dart';
import '../domain/usecases/get_search_content_usecase.dart';

class SearchInjection {
  const SearchInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<SearchDataSource>()) {
      getIt.registerLazySingleton<SearchDataSource>(SearchDataSourceImpl.new);
    }

    if (!getIt.isRegistered<SearchRepository>()) {
      getIt.registerLazySingleton<SearchRepository>(
        () => SearchRepositoryImpl(dataSource: getIt<SearchDataSource>()),
      );
    }

    if (!getIt.isRegistered<GetSearchContentUseCase>()) {
      getIt.registerLazySingleton<GetSearchContentUseCase>(
        () => GetSearchContentUseCase(repository: getIt<SearchRepository>()),
      );
    }
  }
}
