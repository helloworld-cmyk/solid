import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detail_catagories_colors.dart';

class CategoryFilterField extends StatelessWidget {
  const CategoryFilterField({
    super.key,
    required this.title,
    required this.isExpanded,
    required this.onTap,
  });

  final String title;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 46,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: DetailCatagoriesColors.lightGray),
          color: DetailCatagoriesColors.white,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  color: DetailCatagoriesColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1,
                  letterSpacing: 0,
                ),
              ),
            ),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              size: 19,
              color: DetailCatagoriesColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
