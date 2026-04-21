import 'package:flutter/material.dart';

import '../../domain/entities/home_product.dart';
import 'home_colors.dart';
import 'product_card.dart';
import 'product_grid_section.dart';

class OnSaleSection extends StatelessWidget {
  const OnSaleSection({super.key, required this.products, this.onProductTap});

  final List<HomeProduct> products;
  final ValueChanged<HomeProduct>? onProductTap;

  @override
  Widget build(BuildContext context) {
    return ProductGridSection(
      title: 'ON SALE',
      trailing: Row(
        children: <Widget>[
          _buildTimeBox('09'),
          const Text(' : '),
          _buildTimeBox('34'),
          const Text(' : '),
          _buildTimeBox('25'),
        ],
      ),
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

  Widget _buildTimeBox(String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: HomeColors.primary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(time, style: const TextStyle(color: HomeColors.white)),
    );
  }
}
