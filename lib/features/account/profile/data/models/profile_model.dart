import '../../domain/entities/profile.dart';

class ProfileModel {
  const ProfileModel({
    required this.fullName,
    required this.username,
    required this.avatarPath,
  });

  final String fullName;
  final String username;
  final String avatarPath;

  Profile toEntity() {
    return Profile(
      fullName: fullName,
      username: username,
      avatarPath: avatarPath,
    );
  }
}
