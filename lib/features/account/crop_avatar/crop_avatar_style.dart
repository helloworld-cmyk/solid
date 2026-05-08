import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CropAvatarColors {
  const CropAvatarColors._();

  static const Color background = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFFFF6A2B);
  static const Color black = Color(0xFF000000);
  static const Color mediumGray = Color(0xFF666666);
  static const Color cropBackground = Color(0xFF101010);
  static const Color cropScrim = Color(0x88000000);
}

class CropAvatarTypography {
  const CropAvatarTypography._();

  static TextStyle get action => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: CropAvatarColors.primary,
        height: 1,
      );

  static TextStyle get caption => GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: CropAvatarColors.mediumGray,
        height: 1.2,
      );
}
