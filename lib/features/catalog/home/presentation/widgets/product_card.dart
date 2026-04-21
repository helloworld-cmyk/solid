import 'package:flutter/material.dart';
import 'package:solid/core/ui/widget/widgets.dart';

import '../../domain/entities/home_product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, this.onTap});

  final HomeProduct product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CommonProductCard(
      imagePath: product.imagePath,
      isAsset: product.isAsset,
      name: product.name,
      soldLabel: 'Sold (${product.soldCount} Products)',
      priceText: '\$ ${product.price.toStringAsFixed(2)}',
      onTap: onTap,
    );
  }
}
