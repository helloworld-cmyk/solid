import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    final double pulse = (math.sin(progress * math.pi * 2) + 1) / 2;

    return Transform.scale(
      scale: 0.98 + pulse * 0.04,
      child: SizedBox(
        width: 300,
        height: 300,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 286,
              height: 286,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.09 + pulse * 0.03),
              ),
            ),
            Container(
              width: 212 + pulse * 8,
              height: 212 + pulse * 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.11 + pulse * 0.03),
              ),
            ),
            Text(
              'N',
              style: GoogleFonts.poppins(
                color: Colors.white.withValues(alpha: 0.96),
                fontSize: 100,
                fontWeight: FontWeight.w200,
                letterSpacing: 1.4,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
