import '../models/order_model.dart';
import '../models/order_recommendation_model.dart';
import 'my_order_data_source.dart';

class MyOrderDataSourceImpl implements MyOrderDataSource {
  MyOrderDataSourceImpl() : _orders = <OrderModel>[];

  final List<OrderModel> _orders;

  @override
  Future<List<OrderModel>> getOrders() async {
    return List<OrderModel>.from(_orders, growable: false);
  }

  @override
  Future<List<OrderModel>> prependOrders(List<OrderModel> orders) async {
    if (orders.isEmpty) {
      return getOrders();
    }

    _orders
      ..clear()
      ..addAll(orders);
    return getOrders();
  }

  @override
  Future<List<OrderRecommendationModel>> getRecommendations() async {
    return List<OrderRecommendationModel>.from(
      _recommendations,
      growable: false,
    );
  }
}

const List<OrderRecommendationModel> _recommendations =
    <OrderRecommendationModel>[
      OrderRecommendationModel(
        id: 'order_reco_1',
        name: 'Cotton T-shirt Text',
        imagePath: 'assets/catagories/men/men4.png',
        price: 49,
        soldLabel: 'Sold (50 Products)',
      ),
      OrderRecommendationModel(
        id: 'order_reco_2',
        name: 'Slit Denim Skirt',
        imagePath: 'assets/catagories/bags/bag1.jpeg',
        price: 89,
        originalPrice: 129,
        soldLabel: 'Sold (35 Products)',
      ),
      OrderRecommendationModel(
        id: 'order_reco_3',
        name: 'Embroidered T-shirt',
        imagePath: 'assets/catagories/kids/kid1.jpeg',
        price: 39,
        soldLabel: 'Sold (48 Products)',
      ),
      OrderRecommendationModel(
        id: 'order_reco_4',
        name: 'Coat With Belt',
        imagePath: 'assets/catagories/women/women4.jpg',
        price: 19,
        originalPrice: 49,
        soldLabel: 'Sold (22 Products)',
      ),
    ];
