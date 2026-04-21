import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid/core/bloc/cart/cart_bloc.dart';
import 'package:solid/core/bloc/cart/cart_event.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    super.key,
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.quantity,
  });

  final String id;
  final String image;
  final String title;
  final double price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final bool isNetworkImage =
        image.startsWith('http://') || image.startsWith('https://');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: isNetworkImage
                    ? Image.network(
                        image,
                        width: 70,
                        height: 90,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) {
                          return Container(
                            width: 70,
                            height: 90,
                            color: const Color(0xFFF5F5F5),
                            child: const Icon(
                              Icons.image_not_supported,
                              color: Color(0xFF999999),
                            ),
                          );
                        },
                      )
                    : Image.asset(
                        image,
                        width: 70,
                        height: 90,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) {
                          return Container(
                            width: 70,
                            height: 90,
                            color: const Color(0xFFF5F5F5),
                            child: const Icon(
                              Icons.image_not_supported,
                              color: Color(0xFF999999),
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF000000),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$ ${price.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFFF6A2B),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.remove, size: 14),
                      onPressed: () {
                        if (quantity > 1) {
                          context.read<CartBloc>().add(
                            CartItemQuantityUpdated(
                              productId: id,
                              quantity: quantity - 1,
                            ),
                          );
                        } else {
                          context.read<CartBloc>().add(CartItemRemoved(id));
                        }
                      },
                      constraints: const BoxConstraints(),
                      padding: const EdgeInsets.all(8),
                      splashRadius: 20,
                    ),
                    Text(
                      quantity.toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF000000),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, size: 14),
                      onPressed: () {
                        context.read<CartBloc>().add(
                          CartItemQuantityUpdated(
                            productId: id,
                            quantity: quantity + 1,
                          ),
                        );
                      },
                      constraints: const BoxConstraints(),
                      padding: const EdgeInsets.all(8),
                      splashRadius: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFFE9E9E9), height: 1),
        ],
      ),
    );
  }
}
