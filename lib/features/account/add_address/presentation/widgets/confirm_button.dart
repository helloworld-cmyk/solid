import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF6A2B),
          foregroundColor: const Color(0xFFFFFFFF),
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          'Confirm',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFFFFFFF),
            letterSpacing: 0,
            height: 1,
          ),
        ),
      ),
    );
  }
}
