import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid/core/bloc/card/card_bloc.dart';
import 'package:solid/core/bloc/card/card_event.dart';
import 'package:solid/core/bloc/card/card_state.dart';
import 'package:solid/core/router/app.router.gr.dart';
import 'package:solid/core/ui/widget/common_page_header.dart';

import 'presentation/widgets/add_new_card_button.dart';
import 'presentation/widgets/payment_card_item.dart';

@RoutePage()
class PaymentCardListPage extends StatelessWidget {
  const PaymentCardListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              CommonPageHeader(
                title: 'PAYMENT METHOD',
                onBack: () => context.router.maybePop(),
              ),
              Expanded(
                child: BlocBuilder<CardBloc, CardState>(
                  builder: (BuildContext context, CardState state) {
                    if (state.cards.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            'No payment card yet. Add a new card to continue.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: const Color(0xFF8F8F8F)),
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 100),
                      itemCount: state.cards.length,
                      itemBuilder: (BuildContext context, int index) {
                        final card = state.cards[index];
                        return PaymentCardItem(
                          card: card,
                          isSelected: state.selectedCardId == card.id,
                          onTap: () {
                            context.read<CardBloc>().add(SelectCard(card.id));
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
            child: AddNewCardButton(
              onTap: () {
                context.router.push(const AddPaymentCardRoute());
              },
            ),
          ),
        ],
      ),
    );
  }
}
