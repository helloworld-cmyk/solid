sealed class CheckoutEvent {
  const CheckoutEvent();
}

final class CheckoutStarted extends CheckoutEvent {
  const CheckoutStarted();
}

final class CheckoutReloadRequested extends CheckoutEvent {
  const CheckoutReloadRequested();
}

final class CheckoutCouponInputChanged extends CheckoutEvent {
  const CheckoutCouponInputChanged(this.input);

  final String input;
}

final class CheckoutCouponApplyRequested extends CheckoutEvent {
  const CheckoutCouponApplyRequested({required this.subTotal});

  final double subTotal;
}

final class CheckoutOrderNowPressed extends CheckoutEvent {
  const CheckoutOrderNowPressed({required this.subTotal});

  final double subTotal;
}

final class CheckoutFeedbackCleared extends CheckoutEvent {
  const CheckoutFeedbackCleared();
}
