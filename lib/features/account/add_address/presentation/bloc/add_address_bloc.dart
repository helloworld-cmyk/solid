import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid/core/bloc/address/address_model.dart';

import '../../domain/usecases/save_address_usecase.dart';
import 'add_address_event.dart';
import 'add_address_state.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  final SaveAddressUseCase _saveAddressUseCase;

  AddAddressBloc(this._saveAddressUseCase) : super(const AddAddressState()) {
    on<AddAddressFormStarted>(_onFormStarted);
    on<AddAddressFormFieldChanged>(_onFormFieldChanged);
    on<AddAddressCountryChanged>(_onCountryChanged);
    on<AddAddressPhoneCodeChanged>(_onPhoneCodeChanged);
    on<AddAddressDefaultChanged>(_onDefaultChanged);
    on<AddAddressFormSubmitted>(_onFormSubmitted);
    on<AddAddressFormFeedbackCleared>(_onFormFeedbackCleared);
  }

  void _onFormStarted(
    AddAddressFormStarted event,
    Emitter<AddAddressState> emit,
  ) {
    emit(
      state.copyWith(
        resetForm: true,
        formStatus: AddAddressFormStatus.idle,
        clearFormMessage: true,
      ),
    );
  }

  void _onFormFieldChanged(
    AddAddressFormFieldChanged event,
    Emitter<AddAddressState> emit,
  ) {
    switch (event.field) {
      case AddAddressFormField.firstName:
        emit(state.copyWith(firstName: event.value));
        return;
      case AddAddressFormField.lastName:
        emit(state.copyWith(lastName: event.value));
        return;
      case AddAddressFormField.street:
        emit(state.copyWith(street: event.value));
        return;
      case AddAddressFormField.city:
        emit(state.copyWith(city: event.value));
        return;
      case AddAddressFormField.phone:
        emit(state.copyWith(phone: event.value));
        return;
      case AddAddressFormField.email:
        emit(state.copyWith(email: event.value));
        return;
    }
  }

  void _onCountryChanged(
    AddAddressCountryChanged event,
    Emitter<AddAddressState> emit,
  ) {
    emit(state.copyWith(selectedCountry: event.country));
  }

  void _onPhoneCodeChanged(
    AddAddressPhoneCodeChanged event,
    Emitter<AddAddressState> emit,
  ) {
    emit(state.copyWith(phoneCode: event.phoneCode));
  }

  void _onDefaultChanged(
    AddAddressDefaultChanged event,
    Emitter<AddAddressState> emit,
  ) {
    emit(state.copyWith(isDefault: event.isDefault));
  }

  void _onFormSubmitted(
    AddAddressFormSubmitted event,
    Emitter<AddAddressState> emit,
  ) {
    final firstName = state.firstName.trim();
    final lastName = state.lastName.trim();
    final street = state.street.trim();
    final city = state.city.trim();
    final phone = state.phone.trim();
    final email = state.email.trim();

    final requiredValues = [firstName, lastName, street, city, phone, email];
    if (requiredValues.any((value) => value.isEmpty)) {
      emit(
        state.copyWith(
          formStatus: AddAddressFormStatus.validationError,
          formMessage: 'Please fill in all required fields.',
        ),
      );
      return;
    }

    final address = AddressModel(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      name: '$firstName $lastName',
      address: '$street, $city, ${state.selectedCountry}',
      email: email,
      phone: '${state.phoneCode} $phone',
    );

    _saveAddressUseCase(address: address, setAsDefault: state.isDefault);

    emit(
      state.copyWith(
        resetForm: true,
        formStatus: AddAddressFormStatus.success,
        clearFormMessage: true,
      ),
    );
  }

  void _onFormFeedbackCleared(
    AddAddressFormFeedbackCleared event,
    Emitter<AddAddressState> emit,
  ) {
    emit(
      state.copyWith(
        formStatus: AddAddressFormStatus.idle,
        clearFormMessage: true,
      ),
    );
  }
}
