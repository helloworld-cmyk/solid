class AuthState {
  const AuthState({required this.isAuthenticated});

  const AuthState.unauthenticated() : isAuthenticated = false;

  const AuthState.authenticated() : isAuthenticated = true;

  final bool isAuthenticated;

  AuthState copyWith({bool? isAuthenticated}) {
    return AuthState(isAuthenticated: isAuthenticated ?? this.isAuthenticated);
  }
}
