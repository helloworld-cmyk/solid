import '../../domain/entities/order.dart';
import '../../domain/entities/order_recommendation.dart';
import '../../domain/repositories/my_order_repository.dart';
import '../datasources/my_order_data_source.dart';
import '../models/order_model.dart';

class MyOrderRepositoryImpl implements MyOrderRepository {
  const MyOrderRepositoryImpl({required MyOrderDataSource dataSource})
    : _dataSource = dataSource;

  final MyOrderDataSource _dataSource;

  @override
  Future<List<Order>> getOrders() async {
    final List<OrderModel> models = await _dataSource.getOrders();
    return models.map((OrderModel model) => model.toEntity()).toList();
  }

  @override
  Future<List<Order>> prependOrders(List<Order> orders) async {
    final List<OrderModel> models = orders
        .map((Order entity) => OrderModel.fromEntity(entity))
        .toList();

    final List<OrderModel> updated = await _dataSource.prependOrders(models);
    return updated.map((OrderModel model) => model.toEntity()).toList();
  }

  @override
  Future<List<OrderRecommendation>> getRecommendations() async {
    final models = await _dataSource.getRecommendations();
    return models.map((model) => model.toEntity()).toList(growable: false);
  }
}
