import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileColors {
  const ProfileColors._();

  static const Color primary = Color(0xFFFF6A2B);
  static const Color black = Color(0xFF000000);
  static const Color mediumGray = Color(0xFF666666);
  static const Color border = Color(0xFFD7D7D7);
  static const Color white = Color(0xFFFFFFFF);
}

class ProfileTypography {
  const ProfileTypography._();

  static TextStyle get title => GoogleFonts.bebasNeue(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    color: ProfileColors.black,
    letterSpacing: 0.4,
  );

  static TextStyle get name => GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ProfileColors.black,
  );

  static TextStyle get username => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ProfileColors.mediumGray,
  );

  static TextStyle get actionLabel => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ProfileColors.black,
  );

  static TextStyle get menuItem => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ProfileColors.black,
  );

  static TextStyle get signOut => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.red,
  );
}
