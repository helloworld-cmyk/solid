import 'package:flutter/material.dart';

class SplashBackground extends StatelessWidget {
  const SplashBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xFFF68A5D),
            Color(0xFFFF6F20),
            Color(0xFFE75B29),
          ],
        ),
      ),
      child: const CustomPaint(
        painter: _SplashBackgroundPainter(),
        child: SizedBox.expand(),
      ),
    );
  }
}

class _SplashBackgroundPainter extends CustomPainter {
  const _SplashBackgroundPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final Paint topGlow = Paint()
      ..shader =
          RadialGradient(
            colors: <Color>[
              Colors.white.withValues(alpha: 0.15),
              Colors.transparent,
            ],
          ).createShader(
            Rect.fromCircle(
              center: Offset(size.width * 0.76, size.height * 0.10),
              radius: size.width * 0.56,
            ),
          );
    canvas.drawCircle(
      Offset(size.width * 0.76, size.height * 0.10),
      size.width * 0.56,
      topGlow,
    );

    final Paint diagonalLayer = Paint()
      ..shader =
          LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Colors.white.withValues(alpha: 0.11),
              Colors.white.withValues(alpha: 0.03),
            ],
          ).createShader(
            Rect.fromLTWH(0, size.height * 0.34, size.width, size.height),
          );

    final Path diagonalPath = Path()
      ..moveTo(-size.width * 0.12, size.height * 0.34)
      ..lineTo(size.width * 1.12, size.height * 0.48)
      ..lineTo(size.width * 0.52, size.height * 1.06)
      ..lineTo(size.width * 0.24, size.height * 1.06)
      ..close();
    canvas.drawPath(diagonalPath, diagonalLayer);

    final Paint lowerShade = Paint()
      ..shader =
          RadialGradient(
            colors: <Color>[
              Colors.black.withValues(alpha: 0.13),
              Colors.transparent,
            ],
          ).createShader(
            Rect.fromCircle(
              center: Offset(size.width * 0.84, size.height * 0.89),
              radius: size.width * 0.54,
            ),
          );
    canvas.drawCircle(
      Offset(size.width * 0.84, size.height * 0.89),
      size.width * 0.54,
      lowerShade,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
