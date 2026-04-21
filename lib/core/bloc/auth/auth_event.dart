sealed class AuthEvent {
  const AuthEvent();
}

final class AuthStatusRequested extends AuthEvent {
  const AuthStatusRequested();
}

final class AuthLoggedIn extends AuthEvent {
  const AuthLoggedIn();
}

final class AuthLoggedOut extends AuthEvent {
  const AuthLoggedOut();
}
