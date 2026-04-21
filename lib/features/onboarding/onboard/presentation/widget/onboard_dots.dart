import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class OnboardDots extends StatelessWidget {
  const OnboardDots({
    super.key,
    required this.page,
    required this.count,
    required this.activeColor,
  });

  final double page;
  final int count;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(count, (int index) {
        final double distance = (page - index).abs().clamp(0.0, 1.0).toDouble();
        final double selection = 1 - distance;
        final double dotSize = ui.lerpDouble(5.2, 7.2, selection)!;
        final Color dotColor = Color.lerp(
          Colors.white.withValues(alpha: 0.72),
          activeColor,
          selection,
        )!;

        return Container(
          margin: EdgeInsets.only(left: index == 0 ? 0 : 7),
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
        );
      }),
    );
  }
}
