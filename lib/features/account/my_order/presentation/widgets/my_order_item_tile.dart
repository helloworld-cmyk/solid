import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrderItemTile extends StatelessWidget {
  const MyOrderItemTile({
    super.key,
    required this.name,
    required this.imagePath,
    required this.priceText,
    required this.quantity,
    this.isAsset = true,
  });

  final String name;
  final String imagePath;
  final String priceText;
  final int quantity;
  final bool isAsset;

  @override
  Widget build(BuildContext context) {
    final Widget imageWidget = isAsset
        ? Image.asset(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) {
              return const ColoredBox(
                color: Color(0xFFF5F5F5),
                child: Icon(
                  Icons.image_outlined,
                  size: 18,
                  color: Color(0xFFB8B8B8),
                ),
              );
            },
          )
        : Image.network(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) {
              return const ColoredBox(
                color: Color(0xFFF5F5F5),
                child: Icon(
                  Icons.image_outlined,
                  size: 18,
                  color: Color(0xFFB8B8B8),
                ),
              );
            },
          );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 42,
          height: 52,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: imageWidget,
          ),
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF000000),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                priceText,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFFF6A2B),
                  height: 1,
                ),
              ),
            ],
          ),
        ),
        if (quantity > 1)
          Text(
            'x$quantity',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF000000),
            ),
          ),
      ],
    );
  }
}
