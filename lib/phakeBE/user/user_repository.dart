import 'dart:io';

import 'package:flutter/widgets.dart';

abstract class UserRepository {
  Future<String> saveAvatar({
    required String email,
    required File imageFile,
  });

  Future<Image?> getAvatar({required String email});
}
