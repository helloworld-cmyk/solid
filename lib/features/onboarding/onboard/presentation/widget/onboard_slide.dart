import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/onboard_page.dart';
import 'onboard_action_button.dart';
import 'onboard_background.dart';
import 'onboard_dots.dart';

class OnboardSlide extends StatelessWidget {
  const OnboardSlide({
    super.key,
    required this.data,
    required this.index,
    required this.pageCount,
    required this.page,
    required this.onNext,
  });

  final OnboardPage data;
  final int index;
  final int pageCount;
  final double page;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final double distance = (page - index).abs().clamp(0.0, 1.0).toDouble();
    final double direction = page - index;
    final double titleOpacity = 1 - distance * 0.48;
    final double titleOffsetX = direction * 28;
    final double titleOffsetY = distance * 10;

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        OnboardBackground(assetPath: data.assetPath),
        SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 20,
                right: 34,
                bottom: 164,
                child: Opacity(
                  opacity: titleOpacity.clamp(0.0, 1.0),
                  child: Transform.translate(
                    offset: Offset(titleOffsetX, titleOffsetY),
                    child: Text(
                      data.title,
                      style: GoogleFonts.bebasNeue(
                        color: Colors.white,
                        fontSize: 54,
                        fontWeight: FontWeight.w400,
                        height: 52 / 54,
                        letterSpacing: 0,
                        shadows: <Shadow>[
                          Shadow(
                            color: Colors.black.withValues(alpha: 0.12),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 102,
                child: Opacity(
                  opacity: titleOpacity.clamp(0.0, 1.0),
                  child: Transform.translate(
                    offset: Offset(titleOffsetX * 0.6, 0),
                    child: OnboardActionButton(onTap: onNext),
                  ),
                ),
              ),
              Positioned(
                right: 22,
                bottom: 28,
                child: OnboardDots(
                  page: page,
                  count: pageCount,
                  activeColor: Color(data.dotColorValue),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
