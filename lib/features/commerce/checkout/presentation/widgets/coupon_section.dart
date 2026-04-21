import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CouponSection extends StatelessWidget {
  const CouponSection({
    super.key,
    required this.placeholder,
    required this.applyLabel,
  });

  final String placeholder;
  final String applyLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  textInputAction: TextInputAction.done,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF000000),
                  ),
                  decoration: InputDecoration(
                    hintText: placeholder,
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFCFCFCF),
                    ),
                    isDense: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: null,
                child: Text(
                  applyLabel,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Color(0xFFE9E9E9), height: 1),
        ],
      ),
    );
  }
}
