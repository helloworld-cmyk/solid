import 'package:flutter/material.dart';
import 'package:solid/core/bloc/cart/cart_item.dart';

import 'cart_item_tile.dart';
import 'cart_progress_stepper.dart';
import 'cart_total_summary.dart';
import 'you_also_viewed_section.dart';

class CartContentSection extends StatelessWidget {
  const CartContentSection({
    super.key,
    required this.items,
    required this.totalAmount,
  });

  final List<CartItem> items;
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 16),
          const CartProgressStepper(currentStep: 0),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: items
                  .map((CartItem item) {
                    return CartItemTile(
                      id: item.id,
                      image: item.image,
                      title: item.name,
                      price: item.price,
                      quantity: item.quantity,
                    );
                  })
                  .toList(growable: false),
            ),
          ),
          const SizedBox(height: 32),
          CartTotalSummary(totalAmount: totalAmount),
          const SizedBox(height: 60),
          const YouAlsoViewedSection(),
          const SizedBox(height: 120),
        ],
      ),
    );
  }
}
