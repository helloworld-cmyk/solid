import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'search_filter_colors.dart';

class SearchFilterLoadError extends StatelessWidget {
  const SearchFilterLoadError({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.error_outline,
              size: 34,
              color: SearchFilterColors.mediumGray,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: SearchFilterColors.darkGray,
              ),
            ),
            const SizedBox(height: 18),
            TextButton(
              onPressed: onRetry,
              child: Text(
                'Try Again',
                style: GoogleFonts.poppins(
                  color: SearchFilterColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}