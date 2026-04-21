import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/apply_coupon_usecase.dart';
import '../../domain/usecases/get_checkout_order_usecase.dart';
import '../../domain/usecases/place_order_usecase.dart';
import 'checkout_event.dart';
import 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc({
    required GetCheckoutOrderUseCase getCheckoutOrderUseCase,
    required ApplyCouponUseCase applyCouponUseCase,
    required PlaceOrderUseCase placeOrderUseCase,
  }) : _getCheckoutOrderUseCase = getCheckoutOrderUseCase,
       _applyCouponUseCase = applyCouponUseCase,
       _placeOrderUseCase = placeOrderUseCase,
       super(const CheckoutState()) {
    on<CheckoutStarted>(_onStarted);
    on<CheckoutReloadRequested>(_onReloadRequested);
    on<CheckoutCouponInputChanged>(_onCouponInputChanged);
    on<CheckoutCouponApplyRequested>(_onCouponApplyRequested);
    on<CheckoutOrderNowPressed>(_onOrderNowPressed);
    on<CheckoutFeedbackCleared>(_onFeedbackCleared);
  }

  final GetCheckoutOrderUseCase _getCheckoutOrderUseCase;
  final ApplyCouponUseCase _applyCouponUseCase;
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

  void _onCouponInputChanged(
    CheckoutCouponInputChanged event,
    Emitter<CheckoutState> emit,
  ) {
    final String normalizedInput = event.input.trim().toUpperCase();
    final bool shouldClearAppliedCoupon =
        state.appliedCoupon != null &&
        state.appliedCoupon!.code.toUpperCase() != normalizedInput;

    emit(
      state.copyWith(
        couponInput: event.input,
        clearAppliedCoupon: shouldClearAppliedCoupon,
        clearFeedbackMessage: true,
        feedbackType: CheckoutFeedbackType.none,
        orderPlacedSuccessfully: false,
      ),
    );
  }

  Future<void> _onCouponApplyRequested(
    CheckoutCouponApplyRequested event,
    Emitter<CheckoutState> emit,
  ) async {
    if (state.isApplyingCoupon || state.isPlacingOrder || !state.isReady) {
      return;
    }

    emit(
      state.copyWith(
        isApplyingCoupon: true,
        clearFeedbackMessage: true,
        feedbackType: CheckoutFeedbackType.none,
        orderPlacedSuccessfully: false,
      ),
    );

    final ApplyCouponResult result = await _applyCouponUseCase(
      ApplyCouponParams(code: state.couponInput, subTotal: event.subTotal),
    );

    if (result.isSuccess) {
      emit(
        state.copyWith(
          isApplyingCoupon: false,
          appliedCoupon: result.coupon,
          feedbackMessage: result.coupon!.description,
          feedbackType: CheckoutFeedbackType.success,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        isApplyingCoupon: false,
        clearAppliedCoupon: true,
        feedbackMessage: result.message,
        feedbackType: CheckoutFeedbackType.error,
      ),
    );
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
      PlaceOrderParams(subTotal: event.subTotal, coupon: state.appliedCoupon),
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
