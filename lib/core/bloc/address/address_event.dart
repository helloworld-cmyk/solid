import 'address_model.dart';

sealed class AddressEvent {
  const AddressEvent();
}

final class AddAddress extends AddressEvent {
  const AddAddress({required this.address, this.selectAsCurrent = true});

  final AddressModel address;
  final bool selectAsCurrent;
}

final class SelectAddress extends AddressEvent {
  const SelectAddress(this.addressId);

  final String addressId;
}

final class DeleteAddress extends AddressEvent {
  const DeleteAddress(this.addressId);

  final String addressId;
}
