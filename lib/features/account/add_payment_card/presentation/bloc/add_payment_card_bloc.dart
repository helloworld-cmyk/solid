import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/add_payment_card_usecase.dart';
import 'add_payment_card_event.dart';
import 'add_payment_card_state.dart';

class AddPaymentCardBloc
    extends Bloc<AddPaymentCardEvent, AddPaymentCardState> {
  AddPaymentCardBloc(this._addPaymentCardUseCase)
    : super(const AddPaymentCardState()) {
    on<AddPaymentCardStarted>(_onStarted);
    on<AddPaymentCardFieldChanged>(_onFieldChanged);
    on<AddPaymentCardSubmitted>(_onSubmitted);
    on<AddPaymentCardFeedbackCleared>(_onFeedbackCleared);
  }

  final AddPaymentCardUseCase _addPaymentCardUseCase;

  void _onStarted(
    AddPaymentCardStarted event,
    Emitter<AddPaymentCardState> emit,
  ) {
    emit(
      state.copyWith(
        resetForm: true,
        formStatus: AddPaymentCardFormStatus.idle,
        clearFormMessage: true,
      ),
    );
  }

  void _onFieldChanged(
    AddPaymentCardFieldChanged event,
    Emitter<AddPaymentCardState> emit,
  ) {
    switch (event.field) {
      case AddPaymentCardFormField.cardHolder:
        emit(
          state.copyWith(
            cardHolder: event.value,
            formStatus: AddPaymentCardFormStatus.idle,
            clearFormMessage: true,
          ),
        );
      case AddPaymentCardFormField.cardNumber:
        emit(
          state.copyWith(
            cardNumber: event.value,
            formStatus: AddPaymentCardFormStatus.idle,
            clearFormMessage: true,
          ),
        );
      case AddPaymentCardFormField.expMonth:
        emit(
          state.copyWith(
            expMonth: event.value,
            formStatus: AddPaymentCardFormStatus.idle,
            clearFormMessage: true,
          ),
        );
      case AddPaymentCardFormField.expYear:
        emit(
          state.copyWith(
            expYear: event.value,
            formStatus: AddPaymentCardFormStatus.idle,
            clearFormMessage: true,
          ),
        );
      case AddPaymentCardFormField.cvv:
        emit(
          state.copyWith(
            cvv: event.value,
            formStatus: AddPaymentCardFormStatus.idle,
            clearFormMessage: true,
          ),
        );
    }
  }

  void _onSubmitted(
    AddPaymentCardSubmitted event,
    Emitter<AddPaymentCardState> emit,
  ) {
    final String cardHolder = state.cardHolder.trim();
    final String cardNumber = state.cardNumber.trim();
    final String expMonth = state.expMonth.trim();
    final String expYear = state.expYear.trim();
    final String cvv = state.cvv.trim();

    if (<String>[
      cardHolder,
      cardNumber,
      expMonth,
      expYear,
      cvv,
    ].any((String value) => value.isEmpty)) {
      emit(
        state.copyWith(
          formStatus: AddPaymentCardFormStatus.validationError,
          formMessage: 'Please fill in all required fields.',
        ),
      );
      return;
    }

    final String digits = cardNumber.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 16) {
      emit(
        state.copyWith(
          formStatus: AddPaymentCardFormStatus.validationError,
          formMessage: 'Card number must contain 16 digits.',
        ),
      );
      return;
    }

    final int? month = int.tryParse(expMonth);
    if (month == null || month < 1 || month > 12) {
      emit(
        state.copyWith(
          formStatus: AddPaymentCardFormStatus.validationError,
          formMessage: 'Expiry month must be between 01 and 12.',
        ),
      );
      return;
    }

    if (!RegExp(r'^\d{2}$').hasMatch(expYear)) {
      emit(
        state.copyWith(
          formStatus: AddPaymentCardFormStatus.validationError,
          formMessage: 'Expiry year must have 2 digits.',
        ),
      );
      return;
    }

    if (!RegExp(r'^\d{3,4}$').hasMatch(cvv)) {
      emit(
        state.copyWith(
          formStatus: AddPaymentCardFormStatus.validationError,
          formMessage: 'CVV must contain 3 or 4 digits.',
        ),
      );
      return;
    }

    _addPaymentCardUseCase(
      cardHolder: cardHolder,
      cardNumber: digits,
      expMonth: expMonth,
      expYear: expYear,
    );

    emit(
      state.copyWith(
        resetForm: true,
        formStatus: AddPaymentCardFormStatus.success,
        clearFormMessage: true,
      ),
    );
  }

  void _onFeedbackCleared(
    AddPaymentCardFeedbackCleared event,
    Emitter<AddPaymentCardState> emit,
  ) {
    emit(
      state.copyWith(
        formStatus: AddPaymentCardFormStatus.idle,
        clearFormMessage: true,
      ),
    );
  }
}
