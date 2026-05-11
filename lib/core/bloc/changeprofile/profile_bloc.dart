import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid/phakeBE/main.interface.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class GlobalProfileBloc extends Bloc<GlobalProfileEvent, GlobalProfileState> {
  GlobalProfileBloc({PhakeBEInterface? phakeBE})
    : _phakeBE = phakeBE,
      super(const GlobalProfileState()) {
    on<GlobalProfileSessionStarted>(_onSessionStarted);
    on<GlobalProfileAvatarRequested>(_onAvatarRequested);
    on<GlobalProfileFieldChanged>(_onFieldChanged);
    on<GlobalProfileAvatarChanged>(_onAvatarChanged);
  }

  final PhakeBEInterface? _phakeBE;

  Future<void> _onSessionStarted(
    GlobalProfileSessionStarted event,
    Emitter<GlobalProfileState> emit,
  ) async {
    final String normalizedEmail = event.email.trim().toLowerCase();
    emit(const GlobalProfileState().copyWith(email: normalizedEmail));

    if (normalizedEmail.isEmpty || _phakeBE == null) {
      return;
    }

    try {
      final String? avatarPath = await _getBackendAvatar(normalizedEmail);
      if (avatarPath == null || avatarPath.isEmpty) {
        return;
      }

      emit(state.copyWith(avatarPath: avatarPath));
    } catch (_) {
      // Keep the default profile if the fake backend cannot resolve an avatar.
    }
  }

  Future<void> _onAvatarRequested(
    GlobalProfileAvatarRequested event,
    Emitter<GlobalProfileState> emit,
  ) async {
    final String normalizedEmail = event.email.trim().toLowerCase();
    if (normalizedEmail.isEmpty) {
      return;
    }

    emit(state.copyWith(email: normalizedEmail));

    try {
      final String? avatarPath = await _getBackendAvatar(normalizedEmail);
      if (avatarPath == null || avatarPath.isEmpty) {
        return;
      }

      emit(state.copyWith(avatarPath: avatarPath));
    } catch (_) {
      // Keep the current avatar if the fake backend cannot resolve one.
    }
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

  void _onAvatarChanged(
    GlobalProfileAvatarChanged event,
    Emitter<GlobalProfileState> emit,
  ) {
    emit(state.copyWith(avatarPath: event.avatarPath));
  }

  Future<String?> _getBackendAvatar(String normalizedEmail) {
    if (_phakeBE == null) {
      return Future<String?>.value();
    }

    return _phakeBE.getAvatar(email: normalizedEmail);
  }
}
