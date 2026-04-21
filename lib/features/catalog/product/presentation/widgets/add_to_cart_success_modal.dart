import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/router/app.router.gr.dart';

import 'product_colors.dart';

class AddToCartSuccessModal extends StatelessWidget {
  const AddToCartSuccessModal({
    super.key,
    required this.productName,
    required this.onClose,
    required this.onViewCart,
  });

  final String productName;
  final VoidCallback onClose;
  final VoidCallback onViewCart;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      backgroundColor: Colors.white,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 60, 30, 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF9F9F9),
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.shopping_bag,
                        size: 60,
                        color: ProductColors.primary,
                      ),
                      Positioned(
                        top: 15,
                        right: 15,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4CAF50),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Success',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                    height: 1,
                    color: ProductColors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '$productName has been added to your cart.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: const Color(0xFF8A8A8A),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: onViewCart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ProductColors.primary,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(230, 45),
                    padding: EdgeInsets.zero,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'VIEW CART',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              onPressed: onClose,
              icon: const Icon(Icons.close, color: ProductColors.black),
              splashRadius: 20,
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> showAddToCartSuccess(
  BuildContext context, {
  required String productName,
}) {
  final router = context.router;

  return showDialog<void>(
    context: context,
    builder: (BuildContext _) {
      return AddToCartSuccessModal(
        productName: productName,
        onClose: () {
          router.maybePop();
        },
        onViewCart: () {
          router.maybePop();
          router.push(const CartRoute());
        },
      );
    },
  );
}
