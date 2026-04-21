import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum WishlistTabType { myOrder, wishlist }

class WishlistTabSwitcher extends StatelessWidget {
  const WishlistTabSwitcher({
    super.key,
    required this.selectedTab,
    this.onOrderTap,
    this.onWishlistTap,
  });

  final WishlistTabType selectedTab;
  final VoidCallback? onOrderTap;
  final VoidCallback? onWishlistTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: <Widget>[
          Expanded(
            child: _TabPill(
              label: 'My Order',
              icon: Icons.shopping_bag_outlined,
              isSelected: selectedTab == WishlistTabType.myOrder,
              onTap: onOrderTap,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: _TabPill(
              label: 'Wishlist',
              icon: Icons.favorite,
              isSelected: selectedTab == WishlistTabType.wishlist,
              onTap: onWishlistTap,
            ),
          ),
        ],
      ),
    );
  }
}

class _TabPill extends StatelessWidget {
  const _TabPill({
    required this.label,
    required this.icon,
    required this.isSelected,
    this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Color foregroundColor = isSelected
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF000000);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Ink(
          height: 32,
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFFFF6A2B)
                : const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFFFF6A2B)
                  : const Color(0xFFD7D7D7),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 14, color: foregroundColor),
              const SizedBox(width: 8),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: foregroundColor,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}