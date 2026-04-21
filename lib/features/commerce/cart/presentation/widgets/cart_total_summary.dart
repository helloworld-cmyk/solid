import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartTotalSummary extends StatelessWidget {
  const CartTotalSummary({super.key, required this.totalAmount});

  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Total',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF000000),
            ),
          ),
          Text(
            '\$ ${totalAmount.toStringAsFixed(2)}',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFFF6A2B),
            ),
          ),
        ],
      ),
    );
  }
}
