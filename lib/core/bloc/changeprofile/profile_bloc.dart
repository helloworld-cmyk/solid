import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class GlobalProfileBloc extends Bloc<GlobalProfileEvent, GlobalProfileState> {
  GlobalProfileBloc() : super(const GlobalProfileState()) {
    on<GlobalProfileFieldChanged>(_onFieldChanged);
  }

  void _onFieldChanged(
    GlobalProfileFieldChanged event,
    Emitter<GlobalProfileState> emit,
  ) {
    final String value = event.value;

    switch (event.field) {
      case ProfileField.fullName:
        emit(state.copyWith(fullName: value));
        return;
      case ProfileField.username:
        final String trimmed = value.trim();
        final String normalizedUsername = trimmed.isEmpty
            ? ''
            : trimmed.startsWith('@')
            ? trimmed
            : '@$trimmed';
        emit(state.copyWith(username: normalizedUsername));
        return;
      case ProfileField.dateOfBirth:
        emit(state.copyWith(dateOfBirth: value));
        return;
      case ProfileField.phoneNumber:
        emit(state.copyWith(phoneNumber: value));
        return;
      case ProfileField.gender:
        emit(state.copyWith(gender: value));
        return;
      case ProfileField.email:
        emit(state.copyWith(email: value));
        return;
      case ProfileField.region:
        emit(state.copyWith(region: value));
        return;
    }
  }
}