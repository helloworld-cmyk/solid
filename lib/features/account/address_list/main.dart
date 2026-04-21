import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:solid/core/bloc/address/address_bloc.dart';
import 'package:solid/core/bloc/address/address_event.dart';
import 'package:solid/core/bloc/address/address_state.dart';
import 'package:solid/core/router/app.router.gr.dart';
import 'package:solid/core/ui/widget/common_page_header.dart';
import 'presentation/widgets/add_address_button.dart';
import 'presentation/widgets/address_item.dart';

@RoutePage()
class AddressListPage extends StatelessWidget {
  const AddressListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              CommonPageHeader(
                title: 'ADDRESS',
                onBack: () => context.router.maybePop(),
              ),
              Expanded(
                child: BlocBuilder<AddressBloc, AddressState>(
                  builder: (context, state) {
                    if (state.addresses.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            'No address yet. Add a new address to continue.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: const Color(0xFF8F8F8F)),
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 100),
                      itemCount: state.addresses.length,
                      itemBuilder: (context, index) {
                        final address = state.addresses[index];
                        return AddressItem(
                          address: address,
                          isSelected: state.selectedAddressId == address.id,
                          onDelete: () {
                            context.read<AddressBloc>().add(
                              DeleteAddress(address.id),
                            );
                          },
                          onTap: () {
                            context.read<AddressBloc>().add(
                              SelectAddress(address.id),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            left: 25,
            right: 25,
            bottom: MediaQuery.of(context).padding.bottom + 16,
            child: AddAddressButton(
              onTap: () {
                context.router.push(const AddAddressRoute());
              },
            ),
          ),
        ],
      ),
    );
  }
}
