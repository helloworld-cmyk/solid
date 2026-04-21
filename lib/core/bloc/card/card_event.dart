import 'card_model.dart';

sealed class CardEvent {
  const CardEvent();
}

enum AddCardField { cardHolder, cardNumber, expMonth, expYear, cvv }

final class AddCardFormStarted extends CardEvent {
  const AddCardFormStarted();
}

final class AddCardFieldChanged extends CardEvent {
  const AddCardFieldChanged({required this.field, required this.value});

  final AddCardField field;
  final String value;
}

final class AddCardSubmitted extends CardEvent {
  const AddCardSubmitted();
}

final class AddCardFeedbackCleared extends CardEvent {
  const AddCardFeedbackCleared();
}

final class AddCard extends CardEvent {
  const AddCard(this.card);

  final PaymentCardModel card;
}

final class SelectCard extends CardEvent {
  const SelectCard(this.cardId);

  final String cardId;
}
