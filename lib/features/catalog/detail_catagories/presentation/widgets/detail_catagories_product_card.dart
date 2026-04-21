import 'package:flutter/material.dart';
import 'package:solid/core/ui/widget/widgets.dart';

import '../../domain/entities/detail_catagories_product.dart';

class DetailCatagoriesProductCard extends StatelessWidget {
  const DetailCatagoriesProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  final DetailCatagoriesProduct product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CommonProductCard(
      imagePath: product.imagePath,
      name: product.name,
      soldLabel: product.soldLabel,
      priceText: '\$ ${product.price.toStringAsFixed(2)}',
      onTap: onTap,
    );
  }
}
