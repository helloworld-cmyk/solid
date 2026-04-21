import 'package:solid/core/bloc/card/card_bloc.dart';
import 'package:solid/core/bloc/card/card_event.dart';
import 'package:solid/core/bloc/card/card_mock_data.dart';
import 'package:solid/core/bloc/card/card_model.dart';

class AddPaymentCardUseCase {
  AddPaymentCardUseCase({required this.cardBloc});

  final CardBloc cardBloc;

  void call({
    required String cardHolder,
    required String cardNumber,
    required String expMonth,
    required String expYear,
  }) {
    final PaymentCardModel card = PaymentCardModel(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      cardHolder: cardHolder.trim().toUpperCase(),
      cardNumber: _formatCardNumber(cardNumber),
      expiryDate: '${expMonth.padLeft(2, '0')}/${expYear.padLeft(2, '0')}',
      gradientColors:
          cardGradients[cardBloc.state.cards.length % cardGradients.length],
    );

    cardBloc.add(AddCard(card));
  }

  String _formatCardNumber(String cardNumber) {
    final String digits = cardNumber.replaceAll(RegExp(r'\D'), '');
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
