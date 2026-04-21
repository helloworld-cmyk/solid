import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid/core/bloc/cart/cart_item.dart';
import 'package:solid/features/account/my_order/domain/entities/order.dart';
import 'package:solid/features/account/my_order/domain/entities/order_recommendation.dart';
import 'package:solid/features/account/my_order/domain/usecases/get_my_order_recommendations_usecase.dart';
import 'package:solid/features/account/my_order/domain/usecases/get_my_orders_usecase.dart';
import 'package:solid/features/account/my_order/domain/usecases/prepend_my_orders_usecase.dart';

import 'my_order_event.dart';
import 'my_order_state.dart';

class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  MyOrderBloc({
    required GetMyOrdersUseCase getMyOrders,
    required GetMyOrderRecommendationsUseCase getRecommendations,
    required PrependMyOrdersUseCase prependMyOrders,
  }) : _getMyOrders = getMyOrders,
       _getRecommendations = getRecommendations,
       _prependMyOrders = prependMyOrders,
       super(const MyOrderState()) {
    on<MyOrderStarted>(_onStarted);
    on<MyOrderReloadRequested>(_onReloadRequested);
    on<MyOrderPlacedFromCart>(_onPlacedFromCart);

    add(const MyOrderStarted());
  }

  final GetMyOrdersUseCase _getMyOrders;
  final GetMyOrderRecommendationsUseCase _getRecommendations;
  final PrependMyOrdersUseCase _prependMyOrders;

  Future<void> _onStarted(
    MyOrderStarted event,
    Emitter<MyOrderState> emit,
  ) async {
    await _loadOrders(emit);
  }

  Future<void> _onReloadRequested(
    MyOrderReloadRequested event,
    Emitter<MyOrderState> emit,
  ) async {
    await _loadOrders(emit);
  }

  Future<void> _onPlacedFromCart(
    MyOrderPlacedFromCart event,
    Emitter<MyOrderState> emit,
  ) async {
    if (event.items.isEmpty) {
      return;
    }

    final int nowMicros = DateTime.now().microsecondsSinceEpoch;
    final List<Order> placedOrders = List<Order>.generate(
      event.items.length,
      (int index) => _mapCartItemToOrder(
        event.items[index],
        uniqueId: '${event.items[index].id}_${nowMicros}_$index',
      ),
      growable: false,
    );

    try {
      final List<Order> updatedOrders = await _prependMyOrders(placedOrders);
      emit(state.copyWith(items: updatedOrders, clearErrorMessage: true));
    } catch (_) {
      emit(
        state.copyWith(
          errorMessage: 'Unable to update orders. Please try again.',
        ),
      );
    }
  }

  Future<void> _loadOrders(Emitter<MyOrderState> emit) async {
    emit(state.copyWith(isLoading: true, clearErrorMessage: true));

    try {
      final List<Order> orders = await _getMyOrders();
      final List<OrderRecommendation> recommendations =
          await _getRecommendations();

      emit(
        state.copyWith(
          isLoading: false,
          items: orders,
          recommendations: recommendations,
          clearErrorMessage: true,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Unable to load orders. Please try again.',
        ),
      );
    }
  }

  Order _mapCartItemToOrder(CartItem item, {required String uniqueId}) {
    final String image = item.image.trim();
    final bool isAsset =
        !(image.startsWith('http://') || image.startsWith('https://'));

    return Order(
      id: uniqueId,
      name: item.name,
      imagePath: item.image,
      price: item.price,
      quantity: item.quantity,
      isAsset: isAsset,
    );
  }
}
