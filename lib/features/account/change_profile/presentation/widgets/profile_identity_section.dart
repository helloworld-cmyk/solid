import 'package:flutter/material.dart';

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
        Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Container(
              width: 62,
              height: 62,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: ClipOval(
                child: Image.asset(
                  avatarPath,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(
                    color: const Color(0xFFF0F0F0),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.person,
                      color: ChangeProfileColors.mediumGray,
                      size: 28,
                    ),
                  ),
                ),
              ),
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
                  border: Border.all(color: ChangeProfileColors.white, width: 1),
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