import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid/core/bloc/changeprofile/profile_bloc.dart';
import 'package:solid/core/bloc/changeprofile/profile_state.dart';
import 'package:solid/core/ui/widget/widgets.dart';
import 'package:solid/core/utils/avatar_action_handler.dart';
import 'package:solid/core/utils/avatar_picker.dart';

import '../../profile_typography.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalProfileBloc, GlobalProfileState>(
      builder: (BuildContext context, GlobalProfileState state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Row(
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
                  children: <Widget>[
                    CommonAvatarImage(
                      avatarPath: state.avatarPath,
                      size: 80,
                      fallbackIconColor: ProfileColors.mediumGray,
                      fallbackIconSize: 36,
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: ProfileColors.white,
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 2,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 16,
                          color: ProfileColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      state.fullName,
                      style: ProfileTypography.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      state.previewUsername,
                      style: ProfileTypography.username,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
