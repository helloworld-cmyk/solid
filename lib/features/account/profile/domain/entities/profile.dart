class Profile {
  const Profile({
    required this.fullName,
    required this.username,
    required this.avatarPath,
  });

  static const Profile empty = Profile(
    fullName: 'Savannah Robertson',
    username: '@alexander02',
    avatarPath: 'assets/home/maskgroup2.png',
  );

  final String fullName;
  final String username;
  final String avatarPath;
}
