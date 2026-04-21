sealed class AddAddressEvent {
  const AddAddressEvent();
}

enum AddAddressFormField { firstName, lastName, street, city, phone, email }

final class AddAddressFormStarted extends AddAddressEvent {
  const AddAddressFormStarted();
}

final class AddAddressFormFieldChanged extends AddAddressEvent {
  const AddAddressFormFieldChanged({required this.field, required this.value});

  final AddAddressFormField field;
  final String value;
}

final class AddAddressCountryChanged extends AddAddressEvent {
  const AddAddressCountryChanged(this.country);

  final String country;
}

final class AddAddressPhoneCodeChanged extends AddAddressEvent {
  const AddAddressPhoneCodeChanged(this.phoneCode);

  final String phoneCode;
}

final class AddAddressDefaultChanged extends AddAddressEvent {
  const AddAddressDefaultChanged(this.isDefault);

  final bool isDefault;
}

final class AddAddressFormSubmitted extends AddAddressEvent {
  const AddAddressFormSubmitted();
}

final class AddAddressFormFeedbackCleared extends AddAddressEvent {
  const AddAddressFormFeedbackCleared();
}
