import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.unauthenticated()) {
    on<AuthStatusRequested>(_onStatusRequested);
    on<AuthLoggedIn>(_onLoggedIn);
    on<AuthLoggedOut>(_onLoggedOut);
  }

  void _onStatusRequested(AuthStatusRequested event, Emitter<AuthState> emit) {
    emit(state);
  }

  void _onLoggedIn(AuthLoggedIn event, Emitter<AuthState> emit) {
    if (state.isAuthenticated) {
      return;
    }

    emit(const AuthState.authenticated());
  }

  void _onLoggedOut(AuthLoggedOut event, Emitter<AuthState> emit) {
    if (!state.isAuthenticated) {
      return;
    }

    emit(const AuthState.unauthenticated());
  }
}
