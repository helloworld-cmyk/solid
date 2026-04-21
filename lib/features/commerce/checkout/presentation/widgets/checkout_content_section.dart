import 'package:flutter/material.dart';
import 'package:solid/core/bloc/cart/cart_item.dart';

import '../../domain/entities/checkout_order.dart';
import '../../domain/entities/coupon.dart';
import 'checkout_address_section.dart';
import 'checkout_stepper.dart';
import 'checkout_total_section.dart';
import 'coupon_section.dart';
import 'order_item_tile.dart';
import 'payment_method_section.dart';

class CheckoutContentSection extends StatelessWidget {
  const CheckoutContentSection({
    super.key,
    required this.cartItems,
    required this.order,
    required this.couponInput,
    required this.appliedCoupon,
    required this.isApplyingCoupon,
    required this.subTotal,
    required this.discountAmount,
    required this.totalAmount,
    required this.onCouponChanged,
    required this.onApplyCoupon,
    required this.onAddressTap,
    required this.onPaymentTap,
  });

  final List<CartItem> cartItems;
  final CheckoutOrder order;
  final String couponInput;
  final Coupon? appliedCoupon;
  final bool isApplyingCoupon;
  final double subTotal;
  final double discountAmount;
  final double totalAmount;
  final ValueChanged<String> onCouponChanged;
  final VoidCallback onApplyCoupon;
  final VoidCallback onAddressTap;
  final VoidCallback onPaymentTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 16),
          const CheckoutStepper(currentStep: 1),
          const SizedBox(height: 32),
          CheckoutAddressSection(
            title: order.addressTitle,
            description: order.addressDescription,
            onTap: onAddressTap,
          ),
          PaymentMethodSection(
            title: order.paymentTitle,
            description: order.paymentDescription,
            iconAsset: order.paymentIconAsset,
            onTap: onPaymentTap,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: cartItems.isEmpty
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text('Your cart is empty.'),
                  )
                : Column(
                    children: cartItems
                        .map((CartItem item) {
                          return Column(
                            children: <Widget>[
                              OrderItemTile(
                                image: item.image,
                                title: item.name,
                                price: item.price,
                                quantity: item.quantity,
                              ),
                              const Divider(
                                color: Color(0xFFE9E9E9),
                                height: 1,
                              ),
                            ],
                          );
                        })
                        .toList(growable: false),
                  ),
          ),
          CouponSection(
            couponInput: couponInput,
            placeholder: order.couponPlaceholder,
            applyLabel: order.applyCouponLabel,
            isApplying: isApplyingCoupon,
            appliedCouponCode: appliedCoupon?.code,
            onCouponChanged: onCouponChanged,
            onApply: onApplyCoupon,
          ),
          const SizedBox(height: 20),
          CheckoutTotalSection(
            subTotal: subTotal,
            discountAmount: discountAmount,
            totalAmount: totalAmount,
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }
}
