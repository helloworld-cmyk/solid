import '../entities/checkout_order.dart';
import '../entities/coupon.dart';

abstract class CheckoutRepository {
  Future<CheckoutOrder> getCheckoutOrder();

  Future<Coupon?> findCouponByCode(String code);

  Future<void> placeOrder({required double totalAmount});
}
