import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'search_filter_colors.dart';

class FilterHeader extends StatelessWidget {
  const FilterHeader({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            'FILTER',
            style: GoogleFonts.bebasNeue(
              fontSize: 29,
              fontWeight: FontWeight.w400,
              color: SearchFilterColors.black,
              height: 1,
            ),
          ),
        ),
        InkWell(
          onTap: onClose,
          borderRadius: BorderRadius.circular(14),
          child: const Padding(
            padding: EdgeInsets.all(4),
            child: Icon(
              Icons.close,
              size: 20,
              color: SearchFilterColors.black,
            ),
          ),
        ),
      ],
    );
  }
}