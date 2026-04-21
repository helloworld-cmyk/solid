import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'splash_loading_indicator.dart';

class SplashFooter extends StatelessWidget {
  const SplashFooter({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    final double pulse = (math.sin(progress * math.pi * 2) + 1) / 2;
    final double floatY = math.sin(progress * math.pi * 2) * 1.6;

    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: Transform.translate(
        offset: Offset(0, floatY),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SplashLoadingIndicator(progress: progress),
            const SizedBox(height: 12),
            Opacity(
              opacity: 0.82 + pulse * 0.1,
              child: Text(
                'Copyright By NILAH - Designed By La-Studio',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
