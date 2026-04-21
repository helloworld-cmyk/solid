import '../../domain/entities/checkout_order.dart';
import '../../domain/entities/coupon.dart';
import '../../domain/repositories/checkout_repository.dart';
import '../datasources/checkout_data_source.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  const CheckoutRepositoryImpl({required CheckoutDataSource dataSource})
    : _dataSource = dataSource;

  final CheckoutDataSource _dataSource;

  @override
  Future<CheckoutOrder> getCheckoutOrder() async {
    final model = await _dataSource.getCheckoutOrder();
    return model.toEntity();
  }

  @override
  Future<Coupon?> findCouponByCode(String code) async {
    final model = await _dataSource.findCouponByCode(code);
    return model?.toEntity();
  }

  @override
  Future<void> placeOrder({required double totalAmount}) {
    return _dataSource.placeOrder(totalAmount: totalAmount);
  }
}
