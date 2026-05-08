sealed class CropAvatarEvent {
  const CropAvatarEvent();
}

final class CropAvatarInitialized extends CropAvatarEvent {
  const CropAvatarInitialized({required this.imagePath});

  final String imagePath;
}

final class CropAvatarSavePressed extends CropAvatarEvent {
  const CropAvatarSavePressed();
}

final class CropAvatarPopHandled extends CropAvatarEvent {
  const CropAvatarPopHandled();
}
