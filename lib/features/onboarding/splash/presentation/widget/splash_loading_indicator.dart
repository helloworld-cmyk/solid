import 'dart:math' as math;

import 'package:flutter/material.dart';

class SplashLoadingIndicator extends StatelessWidget {
  const SplashLoadingIndicator({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size.square(28),
      painter: _SplashLoadingPainter(progress: progress),
    );
  }
}

class _SplashLoadingPainter extends CustomPainter {
  const _SplashLoadingPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final double turn = progress * math.pi * 2;
    final double outerRadius = size.shortestSide * 0.38;
    final double innerRadius = size.shortestSide * 0.22;

    final Paint outerPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.7
      ..strokeCap = StrokeCap.round
      ..color = Colors.white.withValues(alpha: 0.92);

    final Paint innerPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..color = Colors.white.withValues(alpha: 0.88);

    final Paint dotPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white.withValues(alpha: 0.96);

    canvas.save();
    canvas.translate(center.dx, center.dy);

    canvas.save();
    canvas.rotate(turn);
    canvas.drawArc(
      Rect.fromCircle(center: Offset.zero, radius: outerRadius),
      -math.pi * 1.02,
      math.pi * 1.42,
      false,
      outerPaint,
    );
    final double outerTipAngle = -math.pi * 1.02 + math.pi * 1.42;
    canvas.drawCircle(
      Offset(
        math.cos(outerTipAngle) * outerRadius,
        math.sin(outerTipAngle) * outerRadius,
      ),
      1.45,
      dotPaint,
    );
    canvas.restore();

    canvas.save();
    canvas.rotate(-turn);
    canvas.drawArc(
      Rect.fromCircle(center: Offset.zero, radius: innerRadius),
      -math.pi * 0.12,
      math.pi * 1.0,
      false,
      innerPaint,
    );
    canvas.drawCircle(const Offset(0, 0), 1.35, dotPaint);
    canvas.restore();

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _SplashLoadingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
