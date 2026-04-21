import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutStepper extends StatelessWidget {
  const CheckoutStepper({super.key, required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _buildStepCircle(0),
              _buildDottedLine(),
              _buildStepCircle(1),
              _buildDottedLine(),
              _buildStepCircle(2),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildStepLabel('Cart', 0),
                    _buildStepLabel('Delivery', 2),
                  ],
                ),
                _buildCenteredStepLabel('Checkout', 1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepCircle(int step) {
    final bool isActive = step <= currentStep;

    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF000000) : const Color(0xFFFFFFFF),
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive ? const Color(0xFF000000) : const Color(0xFFE8E8E8),
          width: isActive ? 0 : 1,
        ),
      ),
    );
  }

  Widget _buildDottedLine() {
    return Expanded(
      child: Container(
        height: 1,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double boxWidth = constraints.constrainWidth();
            const double dashWidth = 2;
            const double dashSpace = 2;
            final int dashCount = (boxWidth / (dashWidth + dashSpace)).floor();

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List<Widget>.generate(dashCount, (_) {
                return const SizedBox(
                  width: dashWidth,
                  height: 1,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xFFE8E8E8)),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStepLabel(String label, int step) {
    final bool isActive = step <= currentStep;

    return Text(
      label,
      style: GoogleFonts.poppins(
        fontSize: 10,
        color: isActive ? const Color(0xFF000000) : const Color(0xFF666666),
        fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
      ),
    );
  }

  Widget _buildCenteredStepLabel(String label, int step) {
    return Align(
      alignment: Alignment.center,
      child: _buildStepLabel(label, step),
    );
  }
}
