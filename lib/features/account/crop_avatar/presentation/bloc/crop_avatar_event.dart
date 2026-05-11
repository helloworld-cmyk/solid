sealed class CropAvatarEvent {
  const CropAvatarEvent();
}

final class CropAvatarInitialized extends CropAvatarEvent {
  const CropAvatarInitialized({required this.imagePath, required this.email});

  final String imagePath;
  final String email;
}

final class CropAvatarSavePressed extends CropAvatarEvent {
  const CropAvatarSavePressed();
}

final class CropAvatarPopHandled extends CropAvatarEvent {
  const CropAvatarPopHandled();
}
