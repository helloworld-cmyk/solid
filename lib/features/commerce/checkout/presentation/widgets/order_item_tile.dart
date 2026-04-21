import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderItemTile extends StatelessWidget {
  const OrderItemTile({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.quantity,
  });

  final String image;
  final String title;
  final double price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              image,
              width: 40,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) {
                return Container(
                  width: 40,
                  height: 50,
                  color: const Color(0xFFF5F5F5),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.image,
                    size: 16,
                    color: Color(0xFFAAAAAA),
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF000000),
                    height: 1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$ ${price.toStringAsFixed(2)}',
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
          Text(
            quantity.toString(),
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF000000),
            ),
          ),
        ],
      ),
    );
  }
}
