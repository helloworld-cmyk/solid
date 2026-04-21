sealed class AddPaymentCardEvent {
  const AddPaymentCardEvent();
}

enum AddPaymentCardFormField { cardHolder, cardNumber, expMonth, expYear, cvv }

final class AddPaymentCardStarted extends AddPaymentCardEvent {
  const AddPaymentCardStarted();
}

final class AddPaymentCardFieldChanged extends AddPaymentCardEvent {
  const AddPaymentCardFieldChanged({required this.field, required this.value});

  final AddPaymentCardFormField field;
  final String value;
}

final class AddPaymentCardSubmitted extends AddPaymentCardEvent {
  const AddPaymentCardSubmitted();
}

final class AddPaymentCardFeedbackCleared extends AddPaymentCardEvent {
  const AddPaymentCardFeedbackCleared();
}
