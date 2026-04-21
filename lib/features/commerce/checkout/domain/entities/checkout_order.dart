class CheckoutOrder {
  const CheckoutOrder({
    required this.addressTitle,
    required this.addressDescription,
    required this.paymentTitle,
    required this.paymentDescription,
    required this.paymentIconAsset,
    this.couponPlaceholder = 'Coupon Code',
    this.applyCouponLabel = 'Apply Coupon',
  });

  final String addressTitle;
  final String addressDescription;
  final String paymentTitle;
  final String paymentDescription;
  final String paymentIconAsset;
  final String couponPlaceholder;
  final String applyCouponLabel;
}
