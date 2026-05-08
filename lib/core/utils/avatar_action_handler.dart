import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
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

  if (source == AvatarPickSource.gallery) {
    final String? croppedPath = await context.router.push<String>(
      CropAvatarRoute(imagePath: path),
    );
    if (croppedPath == null || croppedPath.isEmpty || !context.mounted) {
      return;
    }

    context.read<GlobalProfileBloc>().add(
      GlobalProfileAvatarChanged(avatarPath: croppedPath),
    );
    return;
  }

  context.read<GlobalProfileBloc>().add(
    GlobalProfileAvatarChanged(avatarPath: path),
  );
}
