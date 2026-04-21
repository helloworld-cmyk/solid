import '../entities/order_recommendation.dart';
import '../repositories/my_order_repository.dart';

class GetMyOrderRecommendationsUseCase {
  GetMyOrderRecommendationsUseCase({required MyOrderRepository repository})
    : _repository = repository;

  final MyOrderRepository _repository;

  Future<List<OrderRecommendation>> call() {
    return _repository.getRecommendations();
  }
}
