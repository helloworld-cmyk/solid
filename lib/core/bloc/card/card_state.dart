import 'card_mock_data.dart';
import 'card_model.dart';

enum AddCardSubmissionStatus { idle, success, failure }

class CardState {
  const CardState({
    this.cards = initialCardsMockData,
    this.selectedCardId = '1',
    this.draftCardHolder = '',
    this.draftCardNumber = '',
    this.draftExpMonth = '',
    this.draftExpYear = '',
    this.draftCvv = '',
    this.addCardStatus = AddCardSubmissionStatus.idle,
    this.addCardFeedbackMessage,
  });

  final List<PaymentCardModel> cards;
  final String? selectedCardId;
  final String draftCardHolder;
  final String draftCardNumber;
  final String draftExpMonth;
  final String draftExpYear;
  final String draftCvv;
  final AddCardSubmissionStatus addCardStatus;
  final String? addCardFeedbackMessage;

  bool get isAddCardSuccess => addCardStatus == AddCardSubmissionStatus.success;
  bool get isAddCardFailure => addCardStatus == AddCardSubmissionStatus.failure;

  String get formCardHolder => draftCardHolder;
  String get formCardNumber => draftCardNumber;
  String get formExpMonth => draftExpMonth;
  String get formExpYear => draftExpYear;
  String get formCvv => draftCvv;

  PaymentCardModel? get selectedCard {
    for (final PaymentCardModel card in cards) {
      if (card.id == selectedCardId) {
        return card;
      }
    }
    return null;
  }

  CardState copyWith({
    List<PaymentCardModel>? cards,
    String? selectedCardId,
    String? draftCardHolder,
    String? draftCardNumber,
    String? draftExpMonth,
    String? draftExpYear,
    String? draftCvv,
    AddCardSubmissionStatus? addCardStatus,
    String? addCardFeedbackMessage,
    bool clearSelectedCard = false,
    bool clearAddCardFeedbackMessage = false,
    bool resetAddCardDraft = false,
  }) {
    return CardState(
      cards: cards ?? this.cards,
      selectedCardId: clearSelectedCard
          ? null
          : selectedCardId ?? this.selectedCardId,
      draftCardHolder: resetAddCardDraft
          ? ''
          : draftCardHolder ?? this.draftCardHolder,
      draftCardNumber: resetAddCardDraft
          ? ''
          : draftCardNumber ?? this.draftCardNumber,
      draftExpMonth: resetAddCardDraft
          ? ''
          : draftExpMonth ?? this.draftExpMonth,
      draftExpYear: resetAddCardDraft ? '' : draftExpYear ?? this.draftExpYear,
      draftCvv: resetAddCardDraft ? '' : draftCvv ?? this.draftCvv,
      addCardStatus: addCardStatus ?? this.addCardStatus,
      addCardFeedbackMessage: clearAddCardFeedbackMessage
          ? null
          : addCardFeedbackMessage ?? this.addCardFeedbackMessage,
    );
  }
}
