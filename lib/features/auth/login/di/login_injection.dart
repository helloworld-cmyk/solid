import 'package:get_it/get_it.dart';
import 'package:solid/phakeBE/main.interface.dart';

import '../data/datasources/login_auth_data_source.dart';
import '../data/datasources/login_auth_data_source_impl.dart';
import '../data/repositories/login_repository_impl.dart';
import '../domain/repositories/login_repository.dart';
import '../domain/usecases/sign_in_with_email_usecase.dart';
import '../presentation/bloc/login_bloc.dart';

class LoginInjection {
  const LoginInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<LoginAuthDataSource>()) {
      getIt.registerLazySingleton<LoginAuthDataSource>(
        () => LoginAuthDataSourceImpl(phakeBE: getIt<PhakeBEInterface>()),
      );
    }

    if (!getIt.isRegistered<LoginRepository>()) {
      getIt.registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImpl(authDataSource: getIt<LoginAuthDataSource>()),
      );
    }

    if (!getIt.isRegistered<SignInWithEmailUseCase>()) {
      getIt.registerLazySingleton<SignInWithEmailUseCase>(
        () => SignInWithEmailUseCase(repository: getIt<LoginRepository>()),
      );
    }

    if (!getIt.isRegistered<LoginBloc>()) {
      getIt.registerFactory<LoginBloc>(
        () => LoginBloc(signInWithEmailUseCase: getIt<SignInWithEmailUseCase>()),
      );
    }
  }
}
