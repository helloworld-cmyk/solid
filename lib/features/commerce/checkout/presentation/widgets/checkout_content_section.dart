import 'package:flutter/material.dart';
import 'package:solid/core/bloc/cart/cart_item.dart';
import 'package:solid/core/bloc/address/address_model.dart';

import '../../domain/entities/checkout_order.dart';
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
    required this.subTotal,
    required this.totalAmount,
    required this.onAddressTap,
    required this.onPaymentTap,
    this.selectedAddress,
    this.paymentDescription,
  });

  final List<CartItem> cartItems;
  final CheckoutOrder order;
  final double subTotal;
  final double totalAmount;
  final VoidCallback onAddressTap;
  final VoidCallback onPaymentTap;
  final AddressModel? selectedAddress;
  final String? paymentDescription;

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
            title: selectedAddress?.name ?? order.addressTitle,
            description: selectedAddress != null
                ? '${selectedAddress!.address}\n${selectedAddress!.phone}\n${selectedAddress!.email}'
                : order.addressDescription,
            onTap: onAddressTap,
          ),
          PaymentMethodSection(
            title: order.paymentTitle,
            description: paymentDescription ?? order.paymentDescription,
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
            placeholder: order.couponPlaceholder,
            applyLabel: order.applyCouponLabel,
          ),
          const SizedBox(height: 20),
          CheckoutTotalSection(subTotal: subTotal, totalAmount: totalAmount),
          const SizedBox(height: 120),
        ],
      ),
    );
  }
}
