import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid/core/bloc/changeprofile/profile_bloc.dart';
import 'package:solid/core/bloc/changeprofile/profile_event.dart';

void requestProfileAvatarFromBackend(BuildContext context) {
  final String email = context.read<GlobalProfileBloc>().state.email;
  final String normalizedEmail = email.trim().toLowerCase();

  if (normalizedEmail.isEmpty) {
    return;
  }

  context.read<GlobalProfileBloc>().add(
    GlobalProfileAvatarRequested(email: normalizedEmail),
  );
}
