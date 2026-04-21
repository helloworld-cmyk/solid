import '../entities/order.dart';
import '../entities/order_recommendation.dart';

abstract class MyOrderRepository {
  Future<List<Order>> getOrders();

  Future<List<Order>> prependOrders(List<Order> orders);

  Future<List<OrderRecommendation>> getRecommendations();
}
