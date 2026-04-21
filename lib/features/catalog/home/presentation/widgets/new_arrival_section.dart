import 'package:flutter/material.dart';

import '../../domain/entities/home_product.dart';
import 'product_card.dart';
import 'product_grid_section.dart';

class NewArrivalSection extends StatelessWidget {
  const NewArrivalSection({
    super.key,
    required this.products,
    this.onMoreProductTap,
    this.onProductTap,
  });

  final List<HomeProduct> products;
  final VoidCallback? onMoreProductTap;
  final ValueChanged<HomeProduct>? onProductTap;

  @override
  Widget build(BuildContext context) {
    return ProductGridSection(
      title: 'NEW ARRIVAL',
      actionText: 'More Product',
      onActionTap: onMoreProductTap,
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final HomeProduct product = products[index];
        return ProductCard(
          product: product,
          onTap: onProductTap == null ? null : () => onProductTap!(product),
        );
      },
    );
  }
}
