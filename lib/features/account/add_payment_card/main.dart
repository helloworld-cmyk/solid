import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:solid/core/ui/widget/common_page_header.dart';

import 'presentation/bloc/add_payment_card_bloc.dart';
import 'presentation/bloc/add_payment_card_event.dart';
import 'presentation/bloc/add_payment_card_state.dart';
import 'presentation/widgets/add_card_button.dart';
import 'presentation/widgets/card_form_section.dart';
import 'presentation/widgets/card_preview.dart';

@RoutePage()
class AddPaymentCardPage extends StatelessWidget {
  const AddPaymentCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddPaymentCardBloc>(
      create: (_) =>
          GetIt.I<AddPaymentCardBloc>()..add(const AddPaymentCardStarted()),
      child: BlocConsumer<AddPaymentCardBloc, AddPaymentCardState>(
        listenWhen:
            (AddPaymentCardState previous, AddPaymentCardState current) {
              return previous.formStatus != current.formStatus ||
                  previous.formMessage != current.formMessage;
            },
        listener: (BuildContext context, AddPaymentCardState state) {
          if (state.formStatus == AddPaymentCardFormStatus.validationError &&
              state.formMessage != null) {
            final ScaffoldMessengerState messenger = ScaffoldMessenger.of(
              context,
            );
            messenger
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.formMessage!),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            context.read<AddPaymentCardBloc>().add(
              const AddPaymentCardFeedbackCleared(),
            );
            return;
          }

          if (state.formStatus == AddPaymentCardFormStatus.success) {
            context.read<AddPaymentCardBloc>().add(
              const AddPaymentCardFeedbackCleared(),
            );
            context.router.maybePop();
          }
        },
        builder: (BuildContext context, AddPaymentCardState state) {
          return Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            body: SafeArea(
              top: false,
              child: Column(
                children: <Widget>[
                  CommonPageHeader(
                    title: 'ADD NEW CARD',
                    onBack: () => context.router.maybePop(),
                  ),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(height: 4),
                              CardPreview(
                                cardNumber: state.cardNumber,
                                cardHolder: state.cardHolder,
                                expMonth: state.expMonth,
                                expYear: state.expYear,
                              ),
                              const SizedBox(height: 36),
                              CardFormSection(
                                name: state.cardHolder,
                                cardNumber: state.cardNumber,
                                expMonth: state.expMonth,
                                expYear: state.expYear,
                                cvv: state.cvv,
                                onNameChanged: (String value) {
                                  context.read<AddPaymentCardBloc>().add(
                                    AddPaymentCardFieldChanged(
                                      field: AddPaymentCardFormField.cardHolder,
                                      value: value,
                                    ),
                                  );
                                },
                                onCardNumberChanged: (String value) {
                                  context.read<AddPaymentCardBloc>().add(
                                    AddPaymentCardFieldChanged(
                                      field: AddPaymentCardFormField.cardNumber,
                                      value: value,
                                    ),
                                  );
                                },
                                onExpMonthChanged: (String value) {
                                  context.read<AddPaymentCardBloc>().add(
                                    AddPaymentCardFieldChanged(
                                      field: AddPaymentCardFormField.expMonth,
                                      value: value,
                                    ),
                                  );
                                },
                                onExpYearChanged: (String value) {
                                  context.read<AddPaymentCardBloc>().add(
                                    AddPaymentCardFieldChanged(
                                      field: AddPaymentCardFormField.expYear,
                                      value: value,
                                    ),
                                  );
                                },
                                onCvvChanged: (String value) {
                                  context.read<AddPaymentCardBloc>().add(
                                    AddPaymentCardFieldChanged(
                                      field: AddPaymentCardFormField.cvv,
                                      value: value,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 100),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 25,
                          right: 25,
                          bottom: MediaQuery.of(context).padding.bottom + 16,
                          child: AddCardButton(
                            onTap: () {
                              context.read<AddPaymentCardBloc>().add(
                                const AddPaymentCardSubmitted(),
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
