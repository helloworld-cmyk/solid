import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, this.onNotificationTap});

  final VoidCallback? onNotificationTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: HomeColors.white,
      elevation: 0,
      centerTitle: false,
      titleSpacing: 24,
      toolbarHeight: 80,
      title: SvgPicture.asset('assets/icon/Logo.svg', height: 24),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.notifications_none_outlined,
                  color: HomeColors.mediumGray,
                  size: 28,
                ),
                onPressed: onNotificationTap,
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: HomeColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
