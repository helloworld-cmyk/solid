import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'product_colors.dart';

class SelectionOptions extends StatefulWidget {
  const SelectionOptions({
    super.key,
    required this.colorHexCodes,
    required this.sizes,
  });

  final List<int> colorHexCodes;
  final List<String> sizes;

  @override
  State<SelectionOptions> createState() => _SelectionOptionsState();
}

class _SelectionOptionsState extends State<SelectionOptions> {
  int? _selectedColorHex;
  String? _selectedSize;

  @override
  void initState() {
    super.initState();
    if (widget.colorHexCodes.isNotEmpty) {
      _selectedColorHex = widget.colorHexCodes.first;
    }
    if (widget.sizes.isNotEmpty) {
      _selectedSize = widget.sizes.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Color:',
            style: GoogleFonts.bebasNeue(
              fontSize: 20,
              color: ProductColors.black,
            ),
          ),
          const SizedBox(height: 12),
          if (widget.colorHexCodes.isEmpty)
            Text(
              'No color options available.',
              style: GoogleFonts.poppins(
                color: ProductColors.mediumGray,
                fontSize: 12,
              ),
            )
          else
            Row(
              children: widget.colorHexCodes
                  .map((int hex) {
                    final bool isSelected = _selectedColorHex == hex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedColorHex = hex;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Color(hex),
                          shape: BoxShape.circle,
                          border: isSelected
                              ? Border.all(
                                  color: ProductColors.primary,
                                  width: 2,
                                )
                              : null,
                        ),
                      ),
                    );
                  })
                  .toList(growable: false),
            ),
          const SizedBox(height: 24),
          Text(
            'Size:',
            style: GoogleFonts.bebasNeue(
              fontSize: 20,
              color: ProductColors.black,
            ),
          ),
          const SizedBox(height: 12),
          if (widget.sizes.isEmpty)
            Text(
              'No size options available.',
              style: GoogleFonts.poppins(
                color: ProductColors.mediumGray,
                fontSize: 12,
              ),
            )
          else
            Row(
              children: widget.sizes
                  .map((String size) {
                    final bool isSelected = _selectedSize == size;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedSize = size;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        width: 45,
                        height: 35,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? ProductColors.black
                              : ProductColors.white,
                          border: Border.all(color: const Color(0xFFE8E8E8)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          size,
                          style: GoogleFonts.poppins(
                            color: isSelected
                                ? ProductColors.white
                                : ProductColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  })
                  .toList(growable: false),
            ),
        ],
      ),
    );
  }
}
