import 'dart:typed_data';

abstract class UserRepository {
  Future<String> saveAvatar({
    required String email,
    required Uint8List imageBytes,
  });

  Future<String?> getAvatar({required String email});
}
