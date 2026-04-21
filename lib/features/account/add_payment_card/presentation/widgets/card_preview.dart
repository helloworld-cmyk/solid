import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPreview extends StatelessWidget {
  const CardPreview({
    super.key,
    required this.cardNumber,
    required this.cardHolder,
    required this.expMonth,
    required this.expYear,
  });

  final String cardNumber;
  final String cardHolder;
  final String expMonth;
  final String expYear;

  String get _displayNumber {
    final String digits = cardNumber.replaceAll(RegExp(r'\s'), '');
    final String padded = digits.padRight(16, '•');
    return '${padded.substring(0, 4)}   ${padded.substring(4, 8)}   ${padded.substring(8, 12)}   ${padded.substring(12, 16)}';
  }

  String get _displayHolder {
    if (cardHolder.isEmpty) {
      return 'YOUR NAME';
    }
    return cardHolder.toUpperCase();
  }

  String get _displayExpiry {
    final String month = expMonth.isEmpty ? 'MM' : expMonth.padLeft(2, '0');
    final String year = expYear.isEmpty ? 'YY' : expYear.padLeft(2, '0');
    return '$month/$year';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Color(0xFFF5F0EA), Color(0xFFEBE6E0)],
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 8),
            const _CardChip(),
            const SizedBox(height: 20),
            Text(
              _displayNumber,
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF000000).withValues(alpha: 0.7),
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    _displayHolder,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF000000).withValues(alpha: 0.65),
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                Text(
                  _displayExpiry,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF000000).withValues(alpha: 0.65),
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CardChip extends StatelessWidget {
  const _CardChip();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 10,
            right: 10,
            top: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.symmetric(
                  vertical: BorderSide(
                    color: Colors.black.withValues(alpha: 0.25),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Colors.black.withValues(alpha: 0.25),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 16,
              height: 12,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black.withValues(alpha: 0.25),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
