import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/bloc/cart/cart_bloc.dart';
import 'package:solid/core/bloc/cart/cart_event.dart';
import 'package:solid/core/bloc/cart/cart_item.dart';
import 'package:solid/core/bloc/wishlist/wishlist_bloc.dart';
import 'package:solid/core/bloc/wishlist/wishlist_event.dart';
import 'package:solid/core/router/app.router.gr.dart';

import 'add_to_cart_success_modal.dart';
import 'product_colors.dart';

class StickyBottomBar extends StatelessWidget {
  const StickyBottomBar({
    super.key,
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  final String id;
  final String name;
  final String image;
  final double price;

  @override
  Widget build(BuildContext context) {
    final bool isWishlisted = context.select(
      (WishlistBloc bloc) => bloc.state.contains(id),
    );

    return Container(
      padding: EdgeInsets.fromLTRB(
        25,
        12,
        25,
        MediaQuery.of(context).padding.bottom + 12,
      ),
      decoration: BoxDecoration(
        color: ProductColors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, -4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Text(
            '\$ ${price.toStringAsFixed(2)}',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: ProductColors.black,
            ),
          ),
          const SizedBox(width: 12),
          Container(height: 30, width: 1, color: const Color(0xFFE8E8E8)),
          const SizedBox(width: 12),
          IconButton(
            onPressed: () {
              context.read<WishlistBloc>().add(
                WishlistItemAdded(
                  id: id,
                  name: name,
                  imagePath: image,
                  price: price,
                  isAsset: !image.startsWith('http'),
                ),
              );

              context.router.navigate(const WishlistRoute());
            },
            icon: Icon(
              isWishlisted ? Icons.favorite : Icons.favorite_border,
              color: ProductColors.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  context.read<CartBloc>().add(
                    CartItemAdded(
                      CartItem(
                        id: id,
                        name: name,
                        image: image,
                        price: price,
                      ),
                    ),
                  );

                  showAddToCartSuccess(context, productName: name);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ProductColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Add To Cart',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ProductColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
