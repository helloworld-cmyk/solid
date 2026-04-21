import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'product_colors.dart';

class ExpandableDescription extends StatefulWidget {
  const ExpandableDescription({
    super.key,
    required this.description,
    required this.detailImages,
  });

  final String description;
  final List<String> detailImages;

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'DESCRIPTION',
            style: GoogleFonts.bebasNeue(
              fontSize: 26,
              color: ProductColors.black,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            widget.description,
            maxLines: _isExpanded ? null : 4,
            overflow: _isExpanded ? null : TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              color: ProductColors.mediumGray,
              fontSize: 12,
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 24),
        ...widget.detailImages.map(
          (String image) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Image.asset(
              image,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              errorBuilder: (_, _, _) => const SizedBox.shrink(),
            ),
          ),
        ),
        Center(
          child: TextButton.icon(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            icon: Icon(
              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: ProductColors.mediumGray,
            ),
            label: Text(
              _isExpanded ? 'Show Less' : 'Show More',
              style: GoogleFonts.poppins(
                color: ProductColors.mediumGray,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
