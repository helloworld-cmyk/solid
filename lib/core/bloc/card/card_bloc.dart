import 'package:flutter_bloc/flutter_bloc.dart';

import 'card_event.dart';
import 'card_mock_data.dart';
import 'card_model.dart';
import 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(const CardState()) {
    on<AddCardFormStarted>(_onAddCardFormStarted);
    on<AddCardFieldChanged>(_onAddCardFieldChanged);
    on<AddCardSubmitted>(_onAddCardSubmitted);
    on<AddCardFeedbackCleared>(_onAddCardFeedbackCleared);
    on<AddCard>(_onAddCard);
    on<SelectCard>(_onSelectCard);
  }

  void _onAddCardFormStarted(
    AddCardFormStarted event,
    Emitter<CardState> emit,
  ) {
    emit(
      state.copyWith(
        resetAddCardDraft: true,
        addCardStatus: AddCardSubmissionStatus.idle,
        clearAddCardFeedbackMessage: true,
      ),
    );
  }

  void _onAddCardFieldChanged(
    AddCardFieldChanged event,
    Emitter<CardState> emit,
  ) {
    emit(
      _copyWithDraftField(field: event.field, value: event.value).copyWith(
        addCardStatus: AddCardSubmissionStatus.idle,
        clearAddCardFeedbackMessage: true,
      ),
    );
  }

  void _onAddCardSubmitted(AddCardSubmitted event, Emitter<CardState> emit) {
    final String cardHolder = state.formCardHolder.trim().toUpperCase();
    final String rawCardNumber = state.formCardNumber.trim();
    final String expMonth = state.formExpMonth.trim();
    final String expYear = state.formExpYear.trim();
    final String cvv = state.formCvv.trim();

    final List<String> requiredValues = <String>[
      cardHolder,
      rawCardNumber,
      expMonth,
      expYear,
      cvv,
    ];
    if (requiredValues.any((String value) => value.isEmpty)) {
      emit(
        state.copyWith(
          addCardStatus: AddCardSubmissionStatus.failure,
          addCardFeedbackMessage: 'Please fill in all required fields.',
        ),
      );
      return;
    }

    final String digits = rawCardNumber.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 16) {
      emit(
        state.copyWith(
          addCardStatus: AddCardSubmissionStatus.failure,
          addCardFeedbackMessage: 'Card number must contain 16 digits.',
        ),
      );
      return;
    }

    final int? month = int.tryParse(expMonth);
    if (month == null || month < 1 || month > 12) {
      emit(
        state.copyWith(
          addCardStatus: AddCardSubmissionStatus.failure,
          addCardFeedbackMessage: 'Expiry month must be between 01 and 12.',
        ),
      );
      return;
    }

    if (!RegExp(r'^\d{2}$').hasMatch(expYear)) {
      emit(
        state.copyWith(
          addCardStatus: AddCardSubmissionStatus.failure,
          addCardFeedbackMessage: 'Expiry year must have 2 digits.',
        ),
      );
      return;
    }

    if (!RegExp(r'^\d{3,4}$').hasMatch(cvv)) {
      emit(
        state.copyWith(
          addCardStatus: AddCardSubmissionStatus.failure,
          addCardFeedbackMessage: 'CVV must contain 3 or 4 digits.',
        ),
      );
      return;
    }

    final PaymentCardModel card = PaymentCardModel(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      cardHolder: cardHolder,
      cardNumber: _formatCardNumber(digits),
      expiryDate: '${expMonth.padLeft(2, '0')}/${expYear.padLeft(2, '0')}',
      gradientColors: cardGradients[state.cards.length % cardGradients.length],
    );

    emit(
      state.copyWith(
        cards: <PaymentCardModel>[...state.cards, card],
        selectedCardId: card.id,
        resetAddCardDraft: true,
        addCardStatus: AddCardSubmissionStatus.success,
        clearAddCardFeedbackMessage: true,
      ),
    );
  }

  void _onAddCardFeedbackCleared(
    AddCardFeedbackCleared event,
    Emitter<CardState> emit,
  ) {
    emit(
      state.copyWith(
        addCardStatus: AddCardSubmissionStatus.idle,
        clearAddCardFeedbackMessage: true,
      ),
    );
  }

  void _onAddCard(AddCard event, Emitter<CardState> emit) {
    emit(
      state.copyWith(
        cards: <PaymentCardModel>[...state.cards, event.card],
        selectedCardId: event.card.id,
      ),
    );
  }

  void _onSelectCard(SelectCard event, Emitter<CardState> emit) {
    final bool exists = state.cards.any(
      (PaymentCardModel card) => card.id == event.cardId,
    );
    if (!exists) {
      return;
    }

    emit(state.copyWith(selectedCardId: event.cardId));
  }

  CardState _copyWithDraftField({
    required AddCardField field,
    required String value,
  }) {
    switch (field) {
      case AddCardField.cardHolder:
        return state.copyWith(draftCardHolder: value);
      case AddCardField.cardNumber:
        return state.copyWith(draftCardNumber: value);
      case AddCardField.expMonth:
        return state.copyWith(draftExpMonth: value);
      case AddCardField.expYear:
        return state.copyWith(draftExpYear: value);
      case AddCardField.cvv:
        return state.copyWith(draftCvv: value);
    }
  }

  String _formatCardNumber(String digits) {
    final StringBuffer buffer = StringBuffer();
    for (int index = 0; index < digits.length; index++) {
      if (index > 0 && index % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(digits[index]);
    }
    return buffer.toString();
  }
}
