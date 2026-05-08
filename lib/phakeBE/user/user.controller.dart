import 'dart:io';

import 'package:flutter/widgets.dart';

import 'user.service.dart';
import 'user_repository.dart';

class UserController implements UserRepository {
  final UserService userService;

  UserController(this.userService);

  @override
  Future<String> saveAvatar({
    required String email,
    required File imageFile,
  }) {
    return userService.saveAvatar(email: email, imageFile: imageFile);
  }

  @override
  Future<Image?> getAvatar({required String email}) {
    return userService.getAvatar(email: email);
  }
}
