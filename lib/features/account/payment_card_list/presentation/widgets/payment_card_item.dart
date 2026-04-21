import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/bloc/card/card_model.dart';

class PaymentCardItem extends StatelessWidget {
  const PaymentCardItem({
    super.key,
    required this.card,
    required this.isSelected,
    required this.onTap,
  });

  final PaymentCardModel card;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: card.gradientColors,
          ),
          border: Border.all(
            color: isSelected ? const Color(0xFFFF6A2B) : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Stack(
          children: <Widget>[
            if (isSelected)
              const Positioned(top: 12, right: 12, child: _SelectedMark()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 24),
                  const _CardChip(),
                  const SizedBox(height: 16),
                  Text(
                    card.cardNumber,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF000000).withValues(alpha: 0.75),
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        card.cardHolder,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(
                            0xFF000000,
                          ).withValues(alpha: 0.75),
                          letterSpacing: 1.5,
                        ),
                      ),
                      Text(
                        card.expiryDate,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(
                            0xFF000000,
                          ).withValues(alpha: 0.75),
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectedMark extends StatelessWidget {
  const _SelectedMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: const BoxDecoration(
        color: Color(0xFFFF6A2B),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.check, color: Color(0xFFFFFFFF), size: 10),
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
          color: Colors.black.withValues(alpha: 0.3),
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
                    color: Colors.black.withValues(alpha: 0.3),
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
                    color: Colors.black.withValues(alpha: 0.3),
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
                  color: Colors.black.withValues(alpha: 0.3),
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
