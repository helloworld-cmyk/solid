import 'package:get_it/get_it.dart';
import 'package:solid/phakeBE/main.interface.dart';

import '../data/datasources/register_auth_data_source.dart';
import '../data/datasources/register_auth_data_source_impl.dart';
import '../data/repositories/register_repository_impl.dart';
import '../domain/repositories/register_repository.dart';
import '../domain/usecases/sign_up_with_email_usecase.dart';
import '../presentation/bloc/register_bloc.dart';

class RegisterInjection {
  const RegisterInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<RegisterAuthDataSource>()) {
      getIt.registerLazySingleton<RegisterAuthDataSource>(
        () => RegisterAuthDataSourceImpl(phakeBE: getIt<PhakeBEInterface>()),
      );
    }

    if (!getIt.isRegistered<RegisterRepository>()) {
      getIt.registerLazySingleton<RegisterRepository>(
        () => RegisterRepositoryImpl(
          authDataSource: getIt<RegisterAuthDataSource>(),
        ),
      );
    }

    if (!getIt.isRegistered<SignUpWithEmailUseCase>()) {
      getIt.registerLazySingleton<SignUpWithEmailUseCase>(
        () => SignUpWithEmailUseCase(repository: getIt<RegisterRepository>()),
      );
    }

    if (!getIt.isRegistered<RegisterBloc>()) {
      getIt.registerFactory<RegisterBloc>(
        () =>
            RegisterBloc(signUpWithEmailUseCase: getIt<SignUpWithEmailUseCase>()),
      );
    }
  }
}
