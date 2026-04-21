import 'address_model.dart';
import 'address_mock_data.dart';

class AddressState {
  const AddressState({
    this.addresses = initialAddressesMockData,
    this.selectedAddressId = '1',
  });

  final List<AddressModel> addresses;
  final String? selectedAddressId;

  AddressModel? get selectedAddress {
    for (final address in addresses) {
      if (address.id == selectedAddressId) {
        return address;
      }
    }
    return null;
  }

  AddressState copyWith({
    List<AddressModel>? addresses,
    String? selectedAddressId,
    bool clearSelectedAddress = false,
  }) {
    return AddressState(
      addresses: addresses ?? this.addresses,
      selectedAddressId: clearSelectedAddress
          ? null
          : selectedAddressId ?? this.selectedAddressId,
    );
  }
}
