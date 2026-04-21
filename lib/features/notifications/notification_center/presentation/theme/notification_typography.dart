import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'notification_colors.dart';

class NotificationTypography {
  const NotificationTypography._();

  static TextStyle get title => GoogleFonts.bebasNeue(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    color: NotificationColors.black,
    letterSpacing: 0.4,
  );

  static TextStyle get itemTitle => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: NotificationColors.black,
    height: 1.5,
  );

  static TextStyle get timestamp => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: NotificationColors.lightGray,
  );
}
