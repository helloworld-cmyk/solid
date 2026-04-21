import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detail_catagories_colors.dart';

class DetailCatagoriesHeroHeader extends StatelessWidget {
  const DetailCatagoriesHeroHeader({
    super.key,
    required this.onBackTap,
    required this.title,
    required this.imagePath,
  });

  final VoidCallback onBackTap;
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 238,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const DecoratedBox(
            decoration: BoxDecoration(
              color: DetailCatagoriesColors.heroBackground,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(imagePath, height: 238, fit: BoxFit.cover),
          ),
          Positioned(
            left: 25,
            bottom: 8,
            child: Text(
              title,
              style: GoogleFonts.bebasNeue(
                color: DetailCatagoriesColors.white,
                fontSize: 80,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.2,
                height: 1,
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: MediaQuery.paddingOf(context).top + 8,
            child: IconButton(
              onPressed: onBackTap,
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 16,
                color: DetailCatagoriesColors.white,
              ),
              splashRadius: 20,
            ),
          ),
        ],
      ),
    );
  }
}
