import 'package:flutter/material.dart';

import '../../profile_typography.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({
    super.key,
    required this.onMyOrderTap,
    required this.onWishlistTap,
  });

  final VoidCallback onMyOrderTap;
  final VoidCallback onWishlistTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: <Widget>[
          _ActionButton(
            icon: Icons.shopping_bag_outlined,
            label: 'My Order',
            onTap: onMyOrderTap,
          ),
          const SizedBox(height: 12),
          _ActionButton(
            icon: Icons.favorite_border,
            label: 'Wishlist',
            onTap: onWishlistTap,
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: ProfileColors.border),
          borderRadius: BorderRadius.zero,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 20, color: ProfileColors.black),
            const SizedBox(width: 12),
            Text(label, style: ProfileTypography.actionLabel),
          ],
        ),
      ),
    );
  }
}
