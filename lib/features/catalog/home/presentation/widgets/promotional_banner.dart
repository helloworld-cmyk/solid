import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_colors.dart';

class PromotionalBanner extends StatelessWidget {
  const PromotionalBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[_TopBanner(), _BottomBanner()]);
  }
}

class _TopBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 375 / 190,
      child: Stack(
        children: <Widget>[
          Image.asset(
            'assets/home/newseason.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withValues(alpha: 0.4),
          ),
          Positioned(
            left: 16,
            top: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: HomeColors.white.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'The Collection',
                    style: GoogleFonts.poppins(
                      color: HomeColors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 1,
                      letterSpacing: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'NEW SEASON',
                  style: GoogleFonts.bebasNeue(
                    color: HomeColors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    letterSpacing: 0,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Text(
                      'Start From ',
                      style: GoogleFonts.poppins(
                        color: HomeColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        letterSpacing: 0,
                      ),
                    ),
                    Text(
                      '\$30',
                      style: GoogleFonts.bebasNeue(
                        color: HomeColors.primary,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(right: 16, bottom: 16, child: _ArrowButton()),
        ],
      ),
    );
  }
}

class _BottomBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 375 / 190,
      child: Stack(
        children: <Widget>[
          Image.asset(
            'assets/home/wintersale.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withValues(alpha: 0.4),
          ),
          Positioned(
            left: 16,
            top: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: HomeColors.white.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    '50% Off',
                    style: GoogleFonts.poppins(
                      color: HomeColors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 1,
                      letterSpacing: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Text(
                      'WINTER ',
                      style: GoogleFonts.bebasNeue(
                        color: HomeColors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        letterSpacing: 0,
                      ),
                    ),
                    Text(
                      'SALE',
                      style: GoogleFonts.bebasNeue(
                        color: HomeColors.primary,
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 200,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing.',
                    style: GoogleFonts.poppins(
                      color: HomeColors.white.withValues(alpha: 0.8),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(right: 16, bottom: 16, child: _ArrowButton()),
        ],
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: HomeColors.primary,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.arrow_forward_ios,
        color: HomeColors.white,
        size: 16,
      ),
    );
  }
}
