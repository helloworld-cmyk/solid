import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartEmptyState extends StatelessWidget {
  const CartEmptyState({super.key, required this.onGoShopping});

  final VoidCallback onGoShopping;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.shopping_cart_outlined,
            size: 80,
            color: Color(0xFFE0E0E0),
          ),
          const SizedBox(height: 16),
          Text(
            'Your cart is empty',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: const Color(0xFF8A8A8A),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onGoShopping,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF6A2B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text('Go Shopping'),
          ),
        ],
      ),
    );
  }
}
