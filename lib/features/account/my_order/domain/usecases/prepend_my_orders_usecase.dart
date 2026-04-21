import '../entities/order.dart';
import '../repositories/my_order_repository.dart';

class PrependMyOrdersUseCase {
  PrependMyOrdersUseCase({required MyOrderRepository repository})
    : _repository = repository;

  final MyOrderRepository _repository;

  Future<List<Order>> call(List<Order> orders) {
    return _repository.prependOrders(orders);
  }
}
