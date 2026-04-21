import '../../domain/entities/coupon.dart';
import '../models/checkout_order_model.dart';
import '../models/coupon_model.dart';
import 'checkout_data_source.dart';

class CheckoutDataSourceImpl implements CheckoutDataSource {
  const CheckoutDataSourceImpl();

  static const CheckoutOrderModel _mockOrder = CheckoutOrderModel(
    addressTitle: 'Savannah Robertson',
    addressDescription:
        '3144 Koontz Lane, California\nBill.sanders@example.com | (209) 555-0104',
    paymentTitle: 'Payment Method',
    paymentDescription: 'Card Ending **** 5412',
    paymentIconAsset: 'assets/icon/bank.png',
    couponPlaceholder: 'Coupon Code',
    applyCouponLabel: 'Apply Coupon',
  );

  static const List<CouponModel> _mockCoupons = <CouponModel>[
    CouponModel(
      code: 'SAVE10',
      type: CouponType.percentage,
      value: 10,
      description: '10% off for orders from \$100',
      minimumOrderAmount: 100,
    ),
    CouponModel(
      code: 'WELCOME5',
      type: CouponType.fixedAmount,
      value: 5,
      description: 'Flat \$5 off for all orders',
      minimumOrderAmount: 0,
    ),
  ];

  @override
  Future<CheckoutOrderModel> getCheckoutOrder() async {
    await Future<void>.delayed(const Duration(milliseconds: 120));
    return _mockOrder;
  }

  @override
  Future<CouponModel?> findCouponByCode(String code) async {
    await Future<void>.delayed(const Duration(milliseconds: 140));
    final String normalizedCode = code.trim().toUpperCase();

    for (final CouponModel coupon in _mockCoupons) {
      if (coupon.code == normalizedCode) {
        return coupon;
      }
    }

    return null;
  }

  @override
  Future<void> placeOrder({required double totalAmount}) async {
    await Future<void>.delayed(const Duration(milliseconds: 350));
  }
}
