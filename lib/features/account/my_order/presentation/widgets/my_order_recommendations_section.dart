import 'package:flutter/material.dart';
import 'package:solid/core/ui/widget/widgets.dart';

import '../../domain/entities/order_recommendation.dart';

class MyOrderRecommendationsSection extends StatelessWidget {
  const MyOrderRecommendationsSection({
    super.key,
    required this.products,
    this.onProductTap,
  });

  final List<OrderRecommendation> products;
  final ValueChanged<OrderRecommendation>? onProductTap;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const SizedBox.shrink();
    }

    return CommonProductGridSection(
      title: 'YOU ALSO VIEWED',
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final OrderRecommendation product = products[index];
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
