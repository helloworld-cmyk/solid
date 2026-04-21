import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'search_filter_colors.dart';

class FilterSizeSection extends StatelessWidget {
  const FilterSizeSection({
    super.key,
    required this.sizes,
    required this.selectedSize,
    required this.onSizeSelected,
  });

  final List<String> sizes;
  final String selectedSize;
  final ValueChanged<String> onSizeSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'SIZE',
          style: GoogleFonts.bebasNeue(
            fontSize: 26,
            fontWeight: FontWeight.w400,
            color: SearchFilterColors.black,
            height: 1,
          ),
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: sizes.map((String size) {
            final bool isSelected = size == selectedSize;

            return InkWell(
              onTap: () => onSizeSelected(size),
              borderRadius: BorderRadius.circular(4),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                alignment: Alignment.center,
                width: 42,
                height: 30,
                decoration: BoxDecoration(
                  color: isSelected
                      ? SearchFilterColors.black
                      : SearchFilterColors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: isSelected
                        ? SearchFilterColors.black
                        : SearchFilterColors.extraLightGray,
                  ),
                ),
                child: Text(
                  size,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isSelected
                        ? SearchFilterColors.white
                        : SearchFilterColors.darkGray,
                    height: 1,
                  ),
                ),
              ),
            );
          }).toList(growable: false),
        ),
      ],
    );
  }
}