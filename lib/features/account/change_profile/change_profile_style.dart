import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeProfileColors {
  const ChangeProfileColors._();

  static const Color primary = Color(0xFFFF6A2B);
  static const Color black = Color(0xFF000000);
  static const Color mediumGray = Color(0xFF666666);
  static const Color lightGray = Color(0xFFA6A6A6);
  static const Color divider = Color(0xFFE1E1E1);
  static const Color white = Color(0xFFFFFFFF);
}

class ChangeProfileTypography {
  const ChangeProfileTypography._();

  static TextStyle get title => GoogleFonts.bebasNeue(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    color: ChangeProfileColors.black,
    letterSpacing: 0.4,
  );

  static TextStyle get identityName => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: ChangeProfileColors.black,
    height: 1.2,
  );

  static TextStyle get identityUsername => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ChangeProfileColors.mediumGray,
    height: 1,
  );

  static TextStyle get rowLabel => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ChangeProfileColors.lightGray,
    height: 1,
  );

  static TextStyle get rowValue => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ChangeProfileColors.black,
    height: 1,
  );

  static TextStyle get actionLink => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ChangeProfileColors.primary,
    height: 1,
  );
}