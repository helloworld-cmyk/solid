import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:solid/phakeBE/main.interface.dart';

import 'crop_avatar_event.dart';
import 'crop_avatar_state.dart';

class CropAvatarBloc extends Bloc<CropAvatarEvent, CropAvatarState> {
  CropAvatarBloc({required PhakeBEInterface phakeBE})
    : _phakeBE = phakeBE,
      super(CropAvatarState.initial()) {
    on<CropAvatarInitialized>(_onInitialized);
    on<CropAvatarSavePressed>(_onSavePressed);
    on<CropAvatarPopHandled>(_onPopHandled);
  }

  final PhakeBEInterface _phakeBE;

  void _onInitialized(
    CropAvatarInitialized event,
    Emitter<CropAvatarState> emit,
  ) {
    emit(
      state.copyWith(
        imagePath: event.imagePath.trim(),
        email: event.email.trim(),
      ),
    );
  }

  Future<void> _onSavePressed(
    CropAvatarSavePressed event,
    Emitter<CropAvatarState> emit,
  ) async {
    final String sourcePath = state.imagePath.trim();
    if (sourcePath.isEmpty) {
      emit(
        state.copyWith(
          errorMessage: 'No image selected.',
          clearPopResultPath: true,
        ),
      );
      return;
    }

    final String normalizedEmail = state.email.trim().toLowerCase();
    if (normalizedEmail.isEmpty) {
      emit(
        state.copyWith(
          errorMessage: 'Could not find the current user email.',
          clearPopResultPath: true,
        ),
      );
      return;
    }

    if (state.controller.getImage() == null) {
      emit(
        state.copyWith(
          errorMessage: 'Image is still loading.',
          clearPopResultPath: true,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        isSaving: true,
        clearErrorMessage: true,
        clearPopResultPath: true,
      ),
    );

    try {
      final String savedPath = await _saveCroppedAvatar(normalizedEmail);
      emit(
        state.copyWith(
          isSaving: false,
          popResultPath: savedPath,
          clearErrorMessage: true,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isSaving: false,
          errorMessage: 'Could not save this image.',
          clearPopResultPath: true,
        ),
      );
    }
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

  Future<String> _saveCroppedAvatar(String normalizedEmail) async {
    final ui.Image croppedBitmap = await state.controller.croppedBitmap(
      maxSize: 1024,
    );

    try {
      final byteData = await croppedBitmap.toByteData(
        format: ui.ImageByteFormat.png,
      );
      if (byteData == null) {
        throw StateError('Unable to encode cropped avatar.');
      }

      final Uint8List pngBytes = byteData.buffer.asUint8List();
      final Uint8List jpegBytes = await FlutterImageCompress.compressWithList(
        pngBytes,
        quality: 85,
        format: CompressFormat.jpeg,
      );
      if (jpegBytes.isEmpty) {
        throw StateError('Unable to compress cropped avatar.');
      }

      return _phakeBE.saveAvatar(email: normalizedEmail, imageBytes: jpegBytes);
    } finally {
      croppedBitmap.dispose();
    }
  }
}
