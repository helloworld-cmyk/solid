import '../../domain/entities/checkout_order.dart';

class CheckoutOrderModel {
  const CheckoutOrderModel({
    required this.addressTitle,
    required this.addressDescription,
    required this.paymentTitle,
    required this.paymentDescription,
    required this.paymentIconAsset,
    required this.couponPlaceholder,
    required this.applyCouponLabel,
  });

  final String addressTitle;
  final String addressDescription;
  final String paymentTitle;
  final String paymentDescription;
  final String paymentIconAsset;
  final String couponPlaceholder;
  final String applyCouponLabel;

  CheckoutOrder toEntity() {
    return CheckoutOrder(
      addressTitle: addressTitle,
      addressDescription: addressDescription,
      paymentTitle: paymentTitle,
      paymentDescription: paymentDescription,
      paymentIconAsset: paymentIconAsset,
      couponPlaceholder: couponPlaceholder,
      applyCouponLabel: applyCouponLabel,
    );
  }
}
