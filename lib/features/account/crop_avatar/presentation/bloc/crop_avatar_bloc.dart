import 'package:flutter_bloc/flutter_bloc.dart';

import 'crop_avatar_event.dart';
import 'crop_avatar_state.dart';

class CropAvatarBloc extends Bloc<CropAvatarEvent, CropAvatarState> {
  CropAvatarBloc() : super(CropAvatarState.initial()) {
    on<CropAvatarInitialized>(_onInitialized);
    on<CropAvatarSavePressed>(_onSavePressed);
    on<CropAvatarPopHandled>(_onPopHandled);
  }

  void _onInitialized(
    CropAvatarInitialized event,
    Emitter<CropAvatarState> emit,
  ) {
    emit(state.copyWith(imagePath: event.imagePath.trim()));
  }

  void _onSavePressed(
    CropAvatarSavePressed event,
    Emitter<CropAvatarState> emit,
  ) {
    emit(state.copyWith(popResultPath: state.imagePath));
  }

  void _onPopHandled(
    CropAvatarPopHandled event,
    Emitter<CropAvatarState> emit,
  ) {
    emit(state.copyWith(clearPopResultPath: true));
  }

  @override
  Future<void> close() {
    state.controller.dispose();
    return super.close();
  }
}
