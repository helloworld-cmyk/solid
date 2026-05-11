import 'package:crop_image/crop_image.dart';

class CropAvatarState {
  const CropAvatarState({
    required this.imagePath,
    required this.controller,
    required this.email,
    this.isSaving = false,
    this.popResultPath,
    this.errorMessage,
  });

  factory CropAvatarState.initial() {
    return CropAvatarState(
      imagePath: '',
      controller: CropController(aspectRatio: 1),
      email: '',
    );
  }

  final String imagePath;
  final CropController controller;
  final String email;
  final bool isSaving;
  final String? popResultPath;
  final String? errorMessage;

  CropAvatarState copyWith({
    String? imagePath,
    CropController? controller,
    String? email,
    bool? isSaving,
    String? popResultPath,
    String? errorMessage,
    bool clearPopResultPath = false,
    bool clearErrorMessage = false,
  }) {
    return CropAvatarState(
      imagePath: imagePath ?? this.imagePath,
      controller: controller ?? this.controller,
      email: email ?? this.email,
      isSaving: isSaving ?? this.isSaving,
      popResultPath: clearPopResultPath
          ? null
          : (popResultPath ?? this.popResultPath),
      errorMessage: clearErrorMessage
          ? null
          : (errorMessage ?? this.errorMessage),
    );
  }
}
