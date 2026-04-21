import '../entities/checkout_order.dart';
import '../repositories/checkout_repository.dart';

class GetCheckoutOrderUseCase {
  const GetCheckoutOrderUseCase({required CheckoutRepository repository})
    : _repository = repository;

  final CheckoutRepository _repository;

  Future<CheckoutOrder> call() {
    return _repository.getCheckoutOrder();
  }
}
