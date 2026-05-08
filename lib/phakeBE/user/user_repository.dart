import 'dart:io';

abstract class UserRepository {
  Future<String> saveAvatar({required String email, required File imageFile});

  Future<String?> getAvatar({required String email});
}
