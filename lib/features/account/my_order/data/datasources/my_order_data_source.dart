import '../models/order_model.dart';
import '../models/order_recommendation_model.dart';

abstract class MyOrderDataSource {
  Future<List<OrderModel>> getOrders();

  Future<List<OrderModel>> prependOrders(List<OrderModel> orders);

  Future<List<OrderRecommendationModel>> getRecommendations();
}
