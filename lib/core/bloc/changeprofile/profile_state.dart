class GlobalProfileState {
  const GlobalProfileState({
    this.fullName = 'Savannah Robertson',
    this.username = '@alexander02',
    this.avatarPath = 'assets/home/maskgroup2.png',
    this.dateOfBirth = 'Aug 21, 1992',
    this.phoneNumber = '(214) 429 0123',
    this.gender = 'Female',
    this.email = 'Bill.sanders@example.com',
    this.region = 'United States',
  });

  final String fullName;
  final String username;
  final String avatarPath;
  final String dateOfBirth;
  final String phoneNumber;
  final String gender;
  final String email;
  final String region;

  String get editableUsername {
    if (username.startsWith('@')) {
      return username.substring(1);
    }

    return username;
  }

  String get previewUsername {
    final String trimmed = username.trim();
    if (trimmed.isEmpty) {
      return '@';
    }

    if (trimmed.startsWith('@')) {
      return trimmed;
    }

    return '@$trimmed';
  }

  GlobalProfileState copyWith({
    String? fullName,
    String? username,
    String? avatarPath,
    String? dateOfBirth,
    String? phoneNumber,
    String? gender,
    String? email,
    String? region,
  }) {
    return GlobalProfileState(
      fullName: fullName ?? this.fullName,
      username: username ?? this.username,
      avatarPath: avatarPath ?? this.avatarPath,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      region: region ?? this.region,
    );
  }
}