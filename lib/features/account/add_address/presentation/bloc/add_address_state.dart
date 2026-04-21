enum AddAddressFormStatus { idle, validationError, success }

const String _defaultCountry = 'UNITED STATES';
const String _defaultPhoneCode = '+1';

class AddAddressState {
  const AddAddressState({
    this.firstName = '',
    this.lastName = '',
    this.street = '',
    this.city = '',
    this.phone = '',
    this.email = '',
    this.selectedCountry = _defaultCountry,
    this.phoneCode = _defaultPhoneCode,
    this.isDefault = true,
    this.formStatus = AddAddressFormStatus.idle,
    this.formMessage,
  });

  final String firstName;
  final String lastName;
  final String street;
  final String city;
  final String phone;
  final String email;
  final String selectedCountry;
  final String phoneCode;
  final bool isDefault;
  final AddAddressFormStatus formStatus;
  final String? formMessage;

  AddAddressState copyWith({
    String? firstName,
    String? lastName,
    String? street,
    String? city,
    String? phone,
    String? email,
    String? selectedCountry,
    String? phoneCode,
    bool? isDefault,
    AddAddressFormStatus? formStatus,
    String? formMessage,
    bool clearFormMessage = false,
    bool resetForm = false,
  }) {
    return AddAddressState(
      firstName: resetForm ? '' : firstName ?? this.firstName,
      lastName: resetForm ? '' : lastName ?? this.lastName,
      street: resetForm ? '' : street ?? this.street,
      city: resetForm ? '' : city ?? this.city,
      phone: resetForm ? '' : phone ?? this.phone,
      email: resetForm ? '' : email ?? this.email,
      selectedCountry: resetForm
          ? _defaultCountry
          : selectedCountry ?? this.selectedCountry,
      phoneCode: resetForm ? _defaultPhoneCode : phoneCode ?? this.phoneCode,
      isDefault: resetForm ? true : isDefault ?? this.isDefault,
      formStatus: formStatus ?? this.formStatus,
      formMessage: clearFormMessage ? null : formMessage ?? this.formMessage,
    );
  }
}
