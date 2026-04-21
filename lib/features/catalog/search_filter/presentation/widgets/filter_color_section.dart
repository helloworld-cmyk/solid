import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'search_filter_colors.dart';

class FilterColorSection extends StatelessWidget {
  const FilterColorSection({
    super.key,
    required this.colorValues,
    required this.selectedColorValue,
    required this.onColorSelected,
  });

  final List<int> colorValues;
  final int selectedColorValue;
  final ValueChanged<int> onColorSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'COLOR',
          style: GoogleFonts.bebasNeue(
            fontSize: 26,
            fontWeight: FontWeight.w400,
            color: SearchFilterColors.black,
            height: 1,
          ),
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 14,
          runSpacing: 12,
          children: colorValues.map((int colorValue) {
            final Color color = Color(colorValue);
            final bool isSelected = colorValue == selectedColorValue;

            return InkWell(
              onTap: () => onColorSelected(colorValue),
              borderRadius: BorderRadius.circular(18),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: SearchFilterColors.black, width: 1.5)
                      : null,
                ),
              ),
            );
          }).toList(growable: false),
        ),
      ],
    );
  }
}