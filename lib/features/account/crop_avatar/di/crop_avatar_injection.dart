import 'package:get_it/get_it.dart';
import 'package:solid/phakeBE/main.interface.dart';

import '../presentation/bloc/crop_avatar_bloc.dart';

class CropAvatarInjection {
  const CropAvatarInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<CropAvatarBloc>()) {
      getIt.registerFactory<CropAvatarBloc>(
        () => CropAvatarBloc(phakeBE: getIt<PhakeBEInterface>()),
      );
    }
  }
}
