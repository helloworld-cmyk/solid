import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/ui/widget/widgets.dart';

import 'home_colors.dart';

class HomeSectionTitle extends StatelessWidget {
  const HomeSectionTitle({
    super.key,
    required this.title,
    this.actionText,
    this.onActionTap,
    this.trailing,
  });

  final String title;
  final String? actionText;
  final VoidCallback? onActionTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return CommonSectionTitle(
      title: title,
      actionText: actionText,
      onActionTap: onActionTap,
      trailing: trailing,
      titleStyle: GoogleFonts.bebasNeue(
        color: HomeColors.black,
        fontSize: 30,
        letterSpacing: 1.2,
      ),
      actionStyle: GoogleFonts.poppins(
        color: HomeColors.mediumGray,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1,
        letterSpacing: 0,
      ),
      actionUnderlineColor: HomeColors.mediumGray,
      accentColor: HomeColors.primary,
    );
  }
}
