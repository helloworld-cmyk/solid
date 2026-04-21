import 'package:get_it/get_it.dart';

import '../data/datasources/profile_data_source.dart';
import '../data/datasources/profile_data_source_impl.dart';
import '../data/repositories/profile_repository_impl.dart';
import '../domain/repositories/profile_repository.dart';
import '../domain/usecases/get_profile_usecase.dart';

class ProfileInjection {
  const ProfileInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<ProfileDataSource>()) {
      getIt.registerLazySingleton<ProfileDataSource>(
        ProfileDataSourceImpl.new,
      );
    }

    if (!getIt.isRegistered<ProfileRepository>()) {
      getIt.registerLazySingleton<ProfileRepository>(
        () => ProfileRepositoryImpl(dataSource: getIt<ProfileDataSource>()),
      );
    }

    if (!getIt.isRegistered<GetProfileUseCase>()) {
      getIt.registerLazySingleton<GetProfileUseCase>(
        () => GetProfileUseCase(repository: getIt<ProfileRepository>()),
      );
    }
  }
}
