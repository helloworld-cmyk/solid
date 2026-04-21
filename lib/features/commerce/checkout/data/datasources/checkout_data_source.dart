import '../models/checkout_order_model.dart';
import '../models/coupon_model.dart';

abstract class CheckoutDataSource {
  Future<CheckoutOrderModel> getCheckoutOrder();

  Future<CouponModel?> findCouponByCode(String code);

  Future<void> placeOrder({required double totalAmount});
}
