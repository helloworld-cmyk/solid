import 'dart:typed_data';

import 'user.service.dart';
import 'user_repository.dart';

class UserController implements UserRepository {
  final UserService userService;

  UserController(this.userService);

  @override
  Future<String> saveAvatar({
    required String email,
    required Uint8List imageBytes,
  }) {
    return userService.saveAvatar(email: email, imageBytes: imageBytes);
  }

  @override
  Future<String?> getAvatar({required String email}) {
    return userService.getAvatar(email: email);
  }
}
