import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_checkout_order_usecase.dart';
import '../../domain/usecases/place_order_usecase.dart';
import 'checkout_event.dart';
import 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc({
    required GetCheckoutOrderUseCase getCheckoutOrderUseCase,
    required PlaceOrderUseCase placeOrderUseCase,
  }) : _getCheckoutOrderUseCase = getCheckoutOrderUseCase,
       _placeOrderUseCase = placeOrderUseCase,
       super(const CheckoutState()) {
    on<CheckoutStarted>(_onStarted);
    on<CheckoutReloadRequested>(_onReloadRequested);
    on<CheckoutOrderNowPressed>(_onOrderNowPressed);
    on<CheckoutFeedbackCleared>(_onFeedbackCleared);
  }

  final GetCheckoutOrderUseCase _getCheckoutOrderUseCase;
  final PlaceOrderUseCase _placeOrderUseCase;

  Future<void> _onStarted(
    CheckoutStarted event,
    Emitter<CheckoutState> emit,
  ) async {
    if (!state.isInitial) {
      return;
    }
    await _loadOrder(emit);
  }

  Future<void> _onReloadRequested(
    CheckoutReloadRequested event,
    Emitter<CheckoutState> emit,
  ) async {
    await _loadOrder(emit);
  }

  Future<void> _onOrderNowPressed(
    CheckoutOrderNowPressed event,
    Emitter<CheckoutState> emit,
  ) async {
    if (state.isPlacingOrder || !state.isReady) {
      return;
    }

    emit(
      state.copyWith(
        isPlacingOrder: true,
        clearFeedbackMessage: true,
        feedbackType: CheckoutFeedbackType.none,
        orderPlacedSuccessfully: false,
      ),
    );

    final PlaceOrderResult result = await _placeOrderUseCase(
      PlaceOrderParams(subTotal: event.subTotal),
    );

    if (result.isSuccess) {
      emit(
        state.copyWith(
          isPlacingOrder: false,
          orderPlacedSuccessfully: true,
          feedbackMessage: 'Order placed successfully.',
          feedbackType: CheckoutFeedbackType.success,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        isPlacingOrder: false,
        orderPlacedSuccessfully: false,
        feedbackMessage: result.message,
        feedbackType: CheckoutFeedbackType.error,
      ),
    );
  }

  void _onFeedbackCleared(
    CheckoutFeedbackCleared event,
    Emitter<CheckoutState> emit,
  ) {
    emit(
      state.copyWith(
        clearFeedbackMessage: true,
        feedbackType: CheckoutFeedbackType.none,
        orderPlacedSuccessfully: false,
      ),
    );
  }

  Future<void> _loadOrder(Emitter<CheckoutState> emit) async {
    emit(
      state.copyWith(
        status: CheckoutStatus.loading,
        clearErrorMessage: true,
        clearFeedbackMessage: true,
        feedbackType: CheckoutFeedbackType.none,
        orderPlacedSuccessfully: false,
      ),
    );

    try {
      final order = await _getCheckoutOrderUseCase();
      emit(
        state.copyWith(
          status: CheckoutStatus.ready,
          order: order,
          clearErrorMessage: true,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: CheckoutStatus.failure,
          errorMessage: 'Unable to load checkout data. Please try again.',
        ),
      );
    }
  }
}
