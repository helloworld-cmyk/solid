sealed class LoginEvent {
  const LoginEvent();
}

final class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged(this.value);

  final String value;
}

final class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.value);

  final String value;
}

final class LoginRememberMeToggled extends LoginEvent {
  const LoginRememberMeToggled();
}

final class LoginPasswordVisibilityToggled extends LoginEvent {
  const LoginPasswordVisibilityToggled();
}

final class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

final class LoginFeedbackConsumed extends LoginEvent {
  const LoginFeedbackConsumed();
}
