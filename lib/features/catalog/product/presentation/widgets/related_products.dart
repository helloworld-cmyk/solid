import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/ui/widget/widgets.dart';

import '../../domain/entities/product_detail.dart';
import 'product_colors.dart';

class RelatedProducts extends StatelessWidget {
  const RelatedProducts({super.key, required this.products, this.onProductTap});

  final List<RelatedProduct> products;
  final ValueChanged<RelatedProduct>? onProductTap;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: <Widget>[
              Container(width: 2, height: 24, color: ProductColors.primary),
              const SizedBox(width: 12),
              Text(
                'RELATED PRODUCT',
                style: GoogleFonts.bebasNeue(
                  fontSize: 26,
                  color: ProductColors.black,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 280,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 25),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              final RelatedProduct product = products[index];
              return SizedBox(
                width: 160,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CommonProductCard(
                    imagePath: product.imagePath,
                    isAsset: product.isAsset,
                    name: product.name,
                    soldLabel: product.soldLabel,
                    priceText: '\$ ${product.price.toStringAsFixed(2)}',
                    onTap: onProductTap == null
                        ? null
                        : () => onProductTap!(product),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
