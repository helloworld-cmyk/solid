import 'package:solid/features/account/my_order/domain/entities/order.dart';
import 'package:solid/features/account/my_order/domain/entities/order_recommendation.dart';

class MyOrderState {
  const MyOrderState({
    this.isLoading = false,
    this.items = const <Order>[],
    this.recommendations = const <OrderRecommendation>[],
    this.errorMessage,
  });

  final bool isLoading;
  final List<Order> items;
  final List<OrderRecommendation> recommendations;
  final String? errorMessage;

  MyOrderState copyWith({
    bool? isLoading,
    List<Order>? items,
    List<OrderRecommendation>? recommendations,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return MyOrderState(
      isLoading: isLoading ?? this.isLoading,
      items: items ?? this.items,
      recommendations: recommendations ?? this.recommendations,
      errorMessage: clearErrorMessage
          ? null
          : (errorMessage ?? this.errorMessage),
    );
  }
}
