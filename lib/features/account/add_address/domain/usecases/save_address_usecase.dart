import 'package:solid/core/bloc/address/address_bloc.dart';
import 'package:solid/core/bloc/address/address_event.dart';
import 'package:solid/core/bloc/address/address_model.dart';

class SaveAddressUseCase {
  final AddressBloc addressBloc;

  SaveAddressUseCase({required this.addressBloc});

  void call({
    required AddressModel address,
    bool setAsDefault = false,
  }) {
    addressBloc.add(AddAddress(address: address, selectAsCurrent: setAsDefault));
  }
}
