import 'package:flutter/material.dart';
import 'package:solid/core/ui/widget/widgets.dart';

import '../../domain/entities/search_product_item.dart';

class YouAlsoViewedSection extends StatelessWidget {
  const YouAlsoViewedSection({
    super.key,
    required this.products,
    this.onProductTap,
  });

  final List<SearchProductItem> products;
  final ValueChanged<SearchProductItem>? onProductTap;

  @override
  Widget build(BuildContext context) {
    return CommonProductGridSection(
      title: 'YOU ALSO VIEWED',
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final SearchProductItem product = products[index];
        return CommonProductCard(
          imagePath: product.imagePath,
          name: product.name,
          soldLabel: product.soldLabel,
          priceText:
              product.displayPrice ?? '\$ ${product.price.toStringAsFixed(2)}',
          onTap: onProductTap == null ? null : () => onProductTap!(product),
        );
      },
    );
  }
}
