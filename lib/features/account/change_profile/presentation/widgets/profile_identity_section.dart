import 'package:flutter/material.dart';
import 'package:solid/core/ui/widget/widgets.dart';
import 'package:solid/core/utils/avatar_action_handler.dart';
import 'package:solid/core/utils/avatar_picker.dart';

import '../../change_profile_style.dart';

class ProfileIdentitySection extends StatelessWidget {
  const ProfileIdentitySection({
    super.key,
    required this.avatarPath,
    required this.name,
    required this.username,
  });

  final String avatarPath;
  final String name;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            showAvatarActionSheet(
              context,
              onCameraTap: () =>
                  handleAvatarPick(context, AvatarPickSource.camera),
              onGalleryTap: () =>
                  handleAvatarPick(context, AvatarPickSource.gallery),
            );
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              CommonAvatarImage(
                avatarPath: avatarPath,
                size: 62,
                fallbackIconColor: ChangeProfileColors.mediumGray,
                fallbackIconSize: 28,
              ),
              Positioned(
                right: -1,
                top: 2,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: ChangeProfileColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ChangeProfileColors.white,
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    size: 10,
                    color: ChangeProfileColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(name, style: ChangeProfileTypography.identityName),
              const SizedBox(height: 6),
              Text(username, style: ChangeProfileTypography.identityUsername),
            ],
          ),
        ),
      ],
    );
  }
}
