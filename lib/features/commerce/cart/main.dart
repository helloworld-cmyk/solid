import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/bloc/cart/cart_bloc.dart';
import 'package:solid/core/bloc/cart/cart_state.dart';
import 'package:solid/core/router/app.router.gr.dart';
import 'package:solid/core/ui/widget/widgets.dart';

import 'presentation/widgets/cart_content_section.dart';
import 'presentation/widgets/cart_empty_state.dart';
import 'presentation/widgets/proceed_to_checkout_button.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(theme.textTheme),
      ),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (BuildContext context, CartState state) {
          return Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            body: SafeArea(
              top: false,
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      CommonPageHeader(
                        title: 'CART',
                        onBack: () {
                          context.router.maybePop();
                        },
                      ),
                      Expanded(
                        child: state.items.isEmpty
                            ? CartEmptyState(
                                onGoShopping: () {
                                  context.router.navigate(const HomeRoute());
                                },
                              )
                            : CartContentSection(
                                items: state.items,
                                totalAmount: state.totalAmount,
                              ),
                      ),
                    ],
                  ),
                  if (state.items.isNotEmpty)
                    Positioned(
                      left: 25,
                      right: 25,
                      bottom: MediaQuery.of(context).padding.bottom + 16,
                      child: ProceedToCheckoutButton(
                        onPressed: () {
                          context.router.push(const CheckoutRoute());
                        },
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
