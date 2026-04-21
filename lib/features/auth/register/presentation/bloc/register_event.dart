sealed class RegisterEvent {
  const RegisterEvent();
}

final class RegisterFirstNameChanged extends RegisterEvent {
  const RegisterFirstNameChanged(this.value);

  final String value;
}

final class RegisterLastNameChanged extends RegisterEvent {
  const RegisterLastNameChanged(this.value);

  final String value;
}

final class RegisterEmailChanged extends RegisterEvent {
  const RegisterEmailChanged(this.value);

  final String value;
}

final class RegisterPhoneNumberChanged extends RegisterEvent {
  const RegisterPhoneNumberChanged(this.value);

  final String value;
}

final class RegisterPasswordChanged extends RegisterEvent {
  const RegisterPasswordChanged(this.value);

  final String value;
}

final class RegisterConfirmPasswordChanged extends RegisterEvent {
  const RegisterConfirmPasswordChanged(this.value);

  final String value;
}

final class RegisterPasswordVisibilityToggled extends RegisterEvent {
  const RegisterPasswordVisibilityToggled();
}

final class RegisterConfirmPasswordVisibilityToggled extends RegisterEvent {
  const RegisterConfirmPasswordVisibilityToggled();
}

final class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted();
}

final class RegisterFeedbackConsumed extends RegisterEvent {
  const RegisterFeedbackConsumed();
}
