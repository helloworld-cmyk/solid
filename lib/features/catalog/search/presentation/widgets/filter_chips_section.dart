import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'search_colors.dart';

class FilterChipsSection extends StatelessWidget {
  const FilterChipsSection({super.key, required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Center(
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: categories
              .map((String category) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: SearchColors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: SearchColors.subtleLine,
                      width: 1,
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.02),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Text(
                    category,
                    style: GoogleFonts.poppins(
                      color: SearchColors.mediumGray,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                  ),
                );
              })
              .toList(growable: false),
        ),
      ),
    );
  }
}
