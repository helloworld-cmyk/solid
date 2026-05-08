import 'package:image_picker/image_picker.dart';

enum AvatarPickSource { camera, gallery }

Future<String?> pickAvatarPath(AvatarPickSource source) async {
  final ImageSource imageSource = source == AvatarPickSource.camera
      ? ImageSource.camera
      : ImageSource.gallery;

  final XFile? image = await ImagePicker().pickImage(source: imageSource);
  return image?.path;
}
