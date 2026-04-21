import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistItemTile extends StatelessWidget {
  const WishlistItemTile({
    super.key,
    required this.name,
    required this.imagePath,
    required this.priceText,
    this.isAsset = true,
    this.onCartTap,
    this.onRemoveTap,
  });

  final String name;
  final String imagePath;
  final String priceText;
  final bool isAsset;
  final VoidCallback? onCartTap;
  final VoidCallback? onRemoveTap;

  @override
  Widget build(BuildContext context) {
    final Widget imageWidget = isAsset
        ? Image.asset(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) {
              return const ColoredBox(
                color: Color(0xFFF5F5F5),
                child: Icon(
                  Icons.image_outlined,
                  size: 18,
                  color: Color(0xFFB8B8B8),
                ),
              );
            },
          )
        : Image.network(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) {
              return const ColoredBox(
                color: Color(0xFFF5F5F5),
                child: Icon(
                  Icons.image_outlined,
                  size: 18,
                  color: Color(0xFFB8B8B8),
                ),
              );
            },
          );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 42,
          height: 52,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: imageWidget,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                priceText,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFFF6A2B),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _CircleButton(
              diameter: 34,
              backgroundColor: const Color(0xFF1B1B1D),
              borderColor: const Color(0xFF1B1B1D),
              onTap: onCartTap,
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 16,
                color: Color(0xFFFFFFFF),
              ),
            ),
            const SizedBox(width: 10),
            _CircleButton(
              diameter: 32,
              backgroundColor: const Color(0xFFFFFFFF),
              borderColor: const Color(0xFFD8D8D8),
              onTap: onRemoveTap,
              child: const Icon(
                Icons.close,
                size: 14,
                color: Color(0xFF666666),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CircleButton extends StatelessWidget {
  const _CircleButton({
    required this.diameter,
    required this.backgroundColor,
    required this.borderColor,
    required this.child,
    this.onTap,
  });

  final double diameter;
  final Color backgroundColor;
  final Color borderColor;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Ink(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
            border: Border.all(color: borderColor),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}