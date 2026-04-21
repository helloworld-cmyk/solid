import 'package:get_it/get_it.dart';

import '../data/datasources/onboard_pages_data_source.dart';
import '../data/datasources/onboard_pages_data_source_impl.dart';
import '../data/repositories/onboard_pages_repository_impl.dart';
import '../domain/repositories/onboard_pages_repository.dart';
import '../domain/usecases/get_onboard_pages_usecase.dart';
import '../domain/usecases/resolve_onboard_next_action_usecase.dart';
import '../presentation/bloc/onboard_bloc.dart';

class OnboardInjection {
  const OnboardInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<OnboardPagesDataSource>()) {
      getIt.registerLazySingleton<OnboardPagesDataSource>(
        OnboardPagesDataSourceImpl.new,
      );
    }

    if (!getIt.isRegistered<OnboardPagesRepository>()) {
      getIt.registerLazySingleton<OnboardPagesRepository>(
        () => OnboardPagesRepositoryImpl(
          dataSource: getIt<OnboardPagesDataSource>(),
        ),
      );
    }

    if (!getIt.isRegistered<GetOnboardPagesUseCase>()) {
      getIt.registerLazySingleton<GetOnboardPagesUseCase>(
        () => GetOnboardPagesUseCase(
          repository: getIt<OnboardPagesRepository>(),
        ),
      );
    }

    if (!getIt.isRegistered<ResolveOnboardNextActionUseCase>()) {
      getIt.registerLazySingleton<ResolveOnboardNextActionUseCase>(
        ResolveOnboardNextActionUseCase.new,
      );
    }

    if (!getIt.isRegistered<OnboardBloc>()) {
      getIt.registerFactory<OnboardBloc>(
        () => OnboardBloc(
          getOnboardPagesUseCase: getIt<GetOnboardPagesUseCase>(),
          resolveOnboardNextActionUseCase:
              getIt<ResolveOnboardNextActionUseCase>(),
        ),
      );
    }
  }
}
