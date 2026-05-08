enum ProfileField {
  fullName,
  username,
  dateOfBirth,
  phoneNumber,
  gender,
  email,
  region,
}

sealed class GlobalProfileEvent {
  const GlobalProfileEvent();
}

final class GlobalProfileFieldChanged extends GlobalProfileEvent {
  const GlobalProfileFieldChanged({required this.field, required this.value});

  final ProfileField field;
  final String value;
}

final class GlobalProfileAvatarChanged extends GlobalProfileEvent {
  const GlobalProfileAvatarChanged({required this.avatarPath});

  final String avatarPath;
}
