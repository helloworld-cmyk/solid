enum AddPaymentCardFormStatus { idle, validationError, success }

class AddPaymentCardState {
  const AddPaymentCardState({
    this.cardHolder = '',
    this.cardNumber = '',
    this.expMonth = '',
    this.expYear = '',
    this.cvv = '',
    this.formStatus = AddPaymentCardFormStatus.idle,
    this.formMessage,
  });

  final String cardHolder;
  final String cardNumber;
  final String expMonth;
  final String expYear;
  final String cvv;
  final AddPaymentCardFormStatus formStatus;
  final String? formMessage;

  AddPaymentCardState copyWith({
    String? cardHolder,
    String? cardNumber,
    String? expMonth,
    String? expYear,
    String? cvv,
    AddPaymentCardFormStatus? formStatus,
    String? formMessage,
    bool clearFormMessage = false,
    bool resetForm = false,
  }) {
    return AddPaymentCardState(
      cardHolder: resetForm ? '' : cardHolder ?? this.cardHolder,
      cardNumber: resetForm ? '' : cardNumber ?? this.cardNumber,
      expMonth: resetForm ? '' : expMonth ?? this.expMonth,
      expYear: resetForm ? '' : expYear ?? this.expYear,
      cvv: resetForm ? '' : cvv ?? this.cvv,
      formStatus: formStatus ?? this.formStatus,
      formMessage: clearFormMessage ? null : formMessage ?? this.formMessage,
    );
  }
}
