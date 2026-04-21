import '../../domain/entities/checkout_order.dart';
import '../../domain/entities/coupon.dart';

enum CheckoutStatus { initial, loading, ready, failure }

enum CheckoutFeedbackType { none, info, error, success }

class CheckoutState {
  const CheckoutState({
    this.status = CheckoutStatus.initial,
    this.order,
    this.couponInput = '',
    this.appliedCoupon,
    this.isApplyingCoupon = false,
    this.isPlacingOrder = false,
    this.errorMessage,
    this.feedbackMessage,
    this.feedbackType = CheckoutFeedbackType.none,
    this.orderPlacedSuccessfully = false,
  });

  final CheckoutStatus status;
  final CheckoutOrder? order;
  final String couponInput;
  final Coupon? appliedCoupon;
  final bool isApplyingCoupon;
  final bool isPlacingOrder;
  final String? errorMessage;
  final String? feedbackMessage;
  final CheckoutFeedbackType feedbackType;
  final bool orderPlacedSuccessfully;

  bool get isInitial => status == CheckoutStatus.initial;
  bool get isLoading => status == CheckoutStatus.loading;
  bool get isReady => status == CheckoutStatus.ready;
  bool get isFailure => status == CheckoutStatus.failure;

  CheckoutState copyWith({
    CheckoutStatus? status,
    CheckoutOrder? order,
    String? couponInput,
    Coupon? appliedCoupon,
    bool clearAppliedCoupon = false,
    bool? isApplyingCoupon,
    bool? isPlacingOrder,
    String? errorMessage,
    bool clearErrorMessage = false,
    String? feedbackMessage,
    bool clearFeedbackMessage = false,
    CheckoutFeedbackType? feedbackType,
    bool? orderPlacedSuccessfully,
  }) {
    return CheckoutState(
      status: status ?? this.status,
      order: order ?? this.order,
      couponInput: couponInput ?? this.couponInput,
      appliedCoupon: clearAppliedCoupon
          ? null
          : appliedCoupon ?? this.appliedCoupon,
      isApplyingCoupon: isApplyingCoupon ?? this.isApplyingCoupon,
      isPlacingOrder: isPlacingOrder ?? this.isPlacingOrder,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
      feedbackMessage: clearFeedbackMessage
          ? null
          : feedbackMessage ?? this.feedbackMessage,
      feedbackType: feedbackType ?? this.feedbackType,
      orderPlacedSuccessfully:
          orderPlacedSuccessfully ?? this.orderPlacedSuccessfully,
    );
  }
}
