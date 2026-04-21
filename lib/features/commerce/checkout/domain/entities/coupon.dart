enum CouponType { fixedAmount, percentage }

class Coupon {
  const Coupon({
    required this.code,
    required this.type,
    required this.value,
    required this.description,
    this.minimumOrderAmount = 0,
  });

  final String code;
  final CouponType type;
  final double value;
  final String description;
  final double minimumOrderAmount;

  double discountFor(double subTotal) {
    if (subTotal <= 0 || subTotal < minimumOrderAmount) {
      return 0;
    }

    final double rawDiscount = switch (type) {
      CouponType.fixedAmount => value,
      CouponType.percentage => (subTotal * value) / 100,
    };

    if (rawDiscount <= 0) {
      return 0;
    }

    if (rawDiscount > subTotal) {
      return subTotal;
    }

    return rawDiscount;
  }
}
