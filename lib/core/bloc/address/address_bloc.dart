import 'package:flutter_bloc/flutter_bloc.dart';
import 'address_event.dart';
import 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(const AddressState()) {
    on<AddAddress>(_onAddAddress);
    on<SelectAddress>(_onSelectAddress);
    on<DeleteAddress>(_onDeleteAddress);
  }

  void _onAddAddress(AddAddress event, Emitter<AddressState> emit) {
    final updatedAddresses = [...state.addresses, event.address];
    final shouldSelect =
        event.selectAsCurrent || state.selectedAddressId == null;

    emit(
      state.copyWith(
        addresses: updatedAddresses,
        selectedAddressId: shouldSelect
            ? event.address.id
            : state.selectedAddressId,
      ),
    );
  }

  void _onSelectAddress(SelectAddress event, Emitter<AddressState> emit) {
    final exists = state.addresses.any(
      (address) => address.id == event.addressId,
    );
    if (!exists) {
      return;
    }

    emit(state.copyWith(selectedAddressId: event.addressId));
  }

  void _onDeleteAddress(DeleteAddress event, Emitter<AddressState> emit) {
    final updatedAddresses = state.addresses
        .where((address) => address.id != event.addressId)
        .toList();

    if (updatedAddresses.isEmpty) {
      emit(
        state.copyWith(addresses: updatedAddresses, clearSelectedAddress: true),
      );
      return;
    }

    final hasSelectedAddress = updatedAddresses.any(
      (address) => address.id == state.selectedAddressId,
    );

    emit(
      state.copyWith(
        addresses: updatedAddresses,
        selectedAddressId: hasSelectedAddress
            ? state.selectedAddressId
            : updatedAddresses.first.id,
      ),
    );
  }
}
