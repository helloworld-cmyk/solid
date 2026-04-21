import '../entities/order.dart';
import '../repositories/my_order_repository.dart';

class GetMyOrdersUseCase {
  GetMyOrdersUseCase({required MyOrderRepository repository})
    : _repository = repository;

  final MyOrderRepository _repository;

  Future<List<Order>> call() {
    return _repository.getOrders();
  }
}
