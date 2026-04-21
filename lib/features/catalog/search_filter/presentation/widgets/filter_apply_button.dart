import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'search_filter_colors.dart';

class FilterApplyButton extends StatelessWidget {
  const FilterApplyButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: SearchFilterColors.primary,
          foregroundColor: SearchFilterColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Text(
          'Apply Filter',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: SearchFilterColors.white,
            height: 1,
          ),
        ),
      ),
    );
  }
}