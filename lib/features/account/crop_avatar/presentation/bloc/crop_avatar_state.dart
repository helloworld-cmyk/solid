import 'package:crop_image/crop_image.dart';

class CropAvatarState {
  const CropAvatarState({
    required this.imagePath,
    required this.controller,
    this.popResultPath,
  });

  factory CropAvatarState.initial() {
    return CropAvatarState(
      imagePath: '',
      controller: CropController(aspectRatio: 1),
    );
  }

  final String imagePath;
  final CropController controller;
  final String? popResultPath;

  CropAvatarState copyWith({
    String? imagePath,
    CropController? controller,
    String? popResultPath,
    bool clearPopResultPath = false,
  }) {
    return CropAvatarState(
      imagePath: imagePath ?? this.imagePath,
      controller: controller ?? this.controller,
      popResultPath: clearPopResultPath
          ? null
          : (popResultPath ?? this.popResultPath),
    );
  }
}
