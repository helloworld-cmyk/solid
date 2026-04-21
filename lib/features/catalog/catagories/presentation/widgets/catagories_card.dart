import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatagoriesCard extends StatelessWidget {
  const CatagoriesCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
    this.height = 185,
    this.bottomLineWidth = 58,
    this.isHighlighted = false,
  });

  final String title;
  final String imagePath;
  final VoidCallback onTap;
  final double height;
  final double bottomLineWidth;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: SizedBox(
            height: height,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Colors.black.withValues(alpha: 0.22),
                        Colors.transparent,
                      ],
                      stops: const <double>[0.05, 0.55],
                    ),
                  ),
                ),
                if (isHighlighted)
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                Positioned(
                  left: 22,
                  bottom: 28,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: GoogleFonts.bebasNeue(
                          fontSize: 55,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0,
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: bottomLineWidth,
                        height: 2,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
