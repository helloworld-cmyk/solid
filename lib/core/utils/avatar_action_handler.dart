import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid/core/bloc/changeprofile/profile_bloc.dart';
import 'package:solid/core/bloc/changeprofile/profile_event.dart';
import 'package:solid/core/router/app.router.gr.dart';

import 'avatar_picker.dart';

Future<void> handleAvatarPick(
  BuildContext context,
  AvatarPickSource source,
) async {
  final String? path = await pickAvatarPath(source);
  if (path == null || !context.mounted) {
    return;
  }

  final String? savedPath = await context.router.push<String>(
    CropAvatarRoute(imagePath: path),
  );
  if (savedPath == null || savedPath.isEmpty || !context.mounted) {
    return;
  }

  try {
    context.read<GlobalProfileBloc>().add(
      GlobalProfileAvatarChanged(avatarPath: savedPath),
    );
    _showAvatarMessage(context, 'Avatar updated successfully.');
  } catch (_) {
    if (!context.mounted) {
      return;
    }

    _showAvatarMessage(context, 'Could not update avatar.');
  }
}

void _showAvatarMessage(BuildContext context, String message) {
  final messenger = ScaffoldMessenger.maybeOf(context);
  if (messenger == null) {
    return;
  }

  messenger
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
}
