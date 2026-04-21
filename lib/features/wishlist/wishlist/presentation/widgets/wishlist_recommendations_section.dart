import 'package:flutter/material.dart';
import 'package:solid/core/ui/widget/widgets.dart';

import '../../domain/entities/wishlist_recommendation.dart';

class WishlistRecommendationsSection extends StatelessWidget {
  const WishlistRecommendationsSection({
    super.key,
    required this.products,
    this.onProductTap,
  });

  final List<WishlistRecommendation> products;
  final ValueChanged<WishlistRecommendation>? onProductTap;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const SizedBox.shrink();
    }

    return CommonProductGridSection(
      title: 'YOU ALSO VIEWED',
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final WishlistRecommendation product = products[index];
        return CommonProductCard(
          imagePath: product.imagePath,
          isAsset: product.isAsset,
          name: product.name,
          soldLabel: product.soldLabel,
          priceText: product.priceText,
          originalPriceText: product.originalPriceText,
          onTap: onProductTap == null ? null : () => onProductTap!(product),
        );
      },
    );
  }
}