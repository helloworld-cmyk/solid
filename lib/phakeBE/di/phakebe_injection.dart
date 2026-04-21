import 'package:get_it/get_it.dart';
import 'package:solid/phakeBE/auth/auth.controller.dart';
import 'package:solid/phakeBE/auth/auth_repository.dart';
import 'package:solid/phakeBE/auth/auth.service.dart';
import 'package:solid/phakeBE/crypto/bcrypt_password_crypto.dart';
import 'package:solid/phakeBE/crypto/crypto.interface.dart';
import 'package:solid/phakeBE/database/database.interface.dart';
import 'package:solid/phakeBE/database/realmservice.dart';
import 'package:solid/phakeBE/main.dart';
import 'package:solid/phakeBE/main.interface.dart';

void registerPhakeBEDependencies(GetIt getIt) {
  if (getIt.isRegistered<PhakeBEInterface>()) {
    return;
  }

  getIt.registerLazySingleton<AuthDatabase>(
    RealmService.new,
    dispose: (database) => database.dispose(),
  );
  getIt.registerLazySingleton<PasswordCrypto>(BcryptPasswordCrypto.new);
  getIt.registerLazySingleton<AuthService>(
    () => AuthService(
      database: getIt<AuthDatabase>(),
      crypto: getIt<PasswordCrypto>(),
    ),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthController(getIt<AuthService>()),
  );
  getIt.registerLazySingleton<PhakeBEInterface>(
    () =>
        PhakeBE(database: getIt<AuthDatabase>(), auth: getIt<AuthRepository>()),
  );
}
