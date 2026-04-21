import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutTotalSection extends StatelessWidget {
  const CheckoutTotalSection({
    super.key,
    required this.subTotal,
    required this.totalAmount,
  });

  final double subTotal;
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: <Widget>[
          _SummaryRow(
            title: 'Subtotal',
            value: '\$ ${subTotal.toStringAsFixed(2)}',
            valueColor: const Color(0xFF000000),
            titleColor: const Color(0xFF666666),
          ),
          const SizedBox(height: 16),
          _SummaryRow(
            title: 'Total',
            value: '\$ ${totalAmount.toStringAsFixed(2)}',
            valueColor: const Color(0xFFFF6A2B),
            titleColor: const Color(0xFF000000),
            titleSize: 20,
            valueSize: 20,
            titleWeight: FontWeight.w500,
            valueWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.title,
    required this.value,
    required this.titleColor,
    required this.valueColor,
    this.titleSize = 14,
    this.valueSize = 14,
    this.titleWeight = FontWeight.w400,
    this.valueWeight = FontWeight.w500,
  });

  final String title;
  final String value;
  final Color titleColor;
  final Color valueColor;
  final double titleSize;
  final double valueSize;
  final FontWeight titleWeight;
  final FontWeight valueWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: titleSize,
            fontWeight: titleWeight,
            color: titleColor,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: valueSize,
            fontWeight: valueWeight,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
