import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get_it/get_it.dart';

import 'package:solid/core/ui/widget/common_page_header.dart';
import 'presentation/bloc/add_address_bloc.dart';
import 'presentation/bloc/add_address_event.dart';
import 'presentation/bloc/add_address_state.dart';

import 'presentation/widgets/billing_form_section.dart';
import 'presentation/widgets/location_map_section.dart';
import 'presentation/widgets/confirm_button.dart';

@RoutePage()
class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddAddressBloc>(
      create: (_) =>
          GetIt.I<AddAddressBloc>()..add(const AddAddressFormStarted()),
      child: BlocConsumer<AddAddressBloc, AddAddressState>(
        listenWhen: (previous, current) =>
            previous.formStatus != current.formStatus ||
            previous.formMessage != current.formMessage,
        listener: (context, state) {
          if (state.formStatus == AddAddressFormStatus.validationError &&
              state.formMessage != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.formMessage!)));
            context.read<AddAddressBloc>().add(
              const AddAddressFormFeedbackCleared(),
            );
          }

          if (state.formStatus == AddAddressFormStatus.success) {
            context.read<AddAddressBloc>().add(
              const AddAddressFormFeedbackCleared(),
            );
            context.router.maybePop();
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            body: SafeArea(
              top: false,
              child: Column(
                children: [
                  CommonPageHeader(
                    title: 'NEW ADDRESS',
                    onBack: () => context.router.maybePop(),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                ),
                                child: Text(
                                  'BILLING DETAILS',
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF000000),
                                    letterSpacing: 0.5,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: Divider(
                                  color: Color(0xFFEBEBEB),
                                  thickness: 1,
                                  height: 1,
                                ),
                              ),
                              const SizedBox(height: 16),
                              BillingFormSection(
                                firstName: state.firstName,
                                lastName: state.lastName,
                                street: state.street,
                                city: state.city,
                                phone: state.phone,
                                email: state.email,
                                selectedCountry: state.selectedCountry,
                                phoneCode: state.phoneCode,
                                onFirstNameChanged: (value) {
                                  context.read<AddAddressBloc>().add(
                                    AddAddressFormFieldChanged(
                                      field: AddAddressFormField.firstName,
                                      value: value,
                                    ),
                                  );
                                },
                                onLastNameChanged: (value) {
                                  context.read<AddAddressBloc>().add(
                                    AddAddressFormFieldChanged(
                                      field: AddAddressFormField.lastName,
                                      value: value,
                                    ),
                                  );
                                },
                                onStreetChanged: (value) {
                                  context.read<AddAddressBloc>().add(
                                    AddAddressFormFieldChanged(
                                      field: AddAddressFormField.street,
                                      value: value,
                                    ),
                                  );
                                },
                                onCityChanged: (value) {
                                  context.read<AddAddressBloc>().add(
                                    AddAddressFormFieldChanged(
                                      field: AddAddressFormField.city,
                                      value: value,
                                    ),
                                  );
                                },
                                onPhoneChanged: (value) {
                                  context.read<AddAddressBloc>().add(
                                    AddAddressFormFieldChanged(
                                      field: AddAddressFormField.phone,
                                      value: value,
                                    ),
                                  );
                                },
                                onEmailChanged: (value) {
                                  context.read<AddAddressBloc>().add(
                                    AddAddressFormFieldChanged(
                                      field: AddAddressFormField.email,
                                      value: value,
                                    ),
                                  );
                                },
                                onCountryChanged: (value) {
                                  context.read<AddAddressBloc>().add(
                                    AddAddressCountryChanged(value),
                                  );
                                },
                                onPhoneCodeChanged: (value) {
                                  context.read<AddAddressBloc>().add(
                                    AddAddressPhoneCodeChanged(value),
                                  );
                                },
                              ),
                              const SizedBox(height: 28),
                              const LocationMapSection(),
                              const SizedBox(height: 28),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Set Default Address',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF000000),
                                        height: 1,
                                        letterSpacing: 0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 28,
                                      child: Switch(
                                        value: state.isDefault,
                                        onChanged: (value) {
                                          context.read<AddAddressBloc>().add(
                                            AddAddressDefaultChanged(value),
                                          );
                                        },
                                        activeThumbColor: const Color(
                                          0xFFFFFFFF,
                                        ),
                                        activeTrackColor: const Color(
                                          0xFFFF6A2B,
                                        ),
                                        inactiveThumbColor: const Color(
                                          0xFFFFFFFF,
                                        ),
                                        inactiveTrackColor: const Color(
                                          0xFFCCCCCC,
                                        ),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 100),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 25,
                          right: 25,
                          bottom: MediaQuery.of(context).padding.bottom + 16,
                          child: ConfirmButton(
                            onPressed: () {
                              context.read<AddAddressBloc>().add(
                                const AddAddressFormSubmitted(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
