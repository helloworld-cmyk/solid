import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/bloc/address/address_bloc.dart';
import 'package:solid/core/bloc/address/address_state.dart';
import 'package:solid/core/bloc/card/card_bloc.dart';
import 'package:solid/core/bloc/card/card_state.dart';
import 'package:solid/core/bloc/cart/cart_bloc.dart';
import 'package:solid/core/bloc/cart/cart_event.dart';
import 'package:solid/core/bloc/cart/cart_state.dart';
import 'package:solid/core/bloc/my_order/my_order_bloc.dart';
import 'package:solid/core/bloc/my_order/my_order_event.dart';
import 'package:solid/core/di/injection.dart';
import 'package:solid/core/router/app.router.gr.dart';
import 'package:solid/core/ui/widget/widgets.dart';

import 'presentation/bloc/checkout_bloc.dart';
import 'presentation/bloc/checkout_event.dart';
import 'presentation/bloc/checkout_state.dart';
import 'presentation/widgets/checkout_content_section.dart';
import 'presentation/widgets/order_now_button.dart';

@RoutePage()
class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(theme.textTheme),
      ),
      child: BlocProvider<CheckoutBloc>(
        create: (_) => sl<CheckoutBloc>()..add(const CheckoutStarted()),
        child: BlocListener<CheckoutBloc, CheckoutState>(
          listener: (BuildContext context, CheckoutState state) {
            if (state.orderPlacedSuccessfully) {
              final CartState cartState = context.read<CartBloc>().state;
              context.read<MyOrderBloc>().add(
                MyOrderPlacedFromCart(cartState.items),
              );
              context.read<CartBloc>().add(const CartCleared());
              context.read<CheckoutBloc>().add(const CheckoutFeedbackCleared());
              context.router.replace(const CheckoutSuccessRoute());
              return;
            }

            if (state.feedbackMessage != null) {
              final ScaffoldMessengerState messenger = ScaffoldMessenger.of(
                context,
              );
              messenger
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(state.feedbackMessage!),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: switch (state.feedbackType) {
                      CheckoutFeedbackType.error => const Color(0xFFC62828),
                      CheckoutFeedbackType.success => const Color(0xFF2E7D32),
                      CheckoutFeedbackType.info => const Color(0xFF1565C0),
                      CheckoutFeedbackType.none => null,
                    },
                  ),
                );

              context.read<CheckoutBloc>().add(const CheckoutFeedbackCleared());
            }
          },
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (BuildContext context, CheckoutState checkoutState) {
              return Scaffold(
                backgroundColor: const Color(0xFFFFFFFF),
                body: SafeArea(
                  top: false,
                  child: Column(
                    children: <Widget>[
                      CommonPageHeader(
                        title: 'CHECKOUT',
                        onBack: () => context.router.maybePop(),
                      ),
                      Expanded(
                        child: Builder(
                          builder: (BuildContext context) {
                            if (checkoutState.isInitial ||
                                checkoutState.isLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (checkoutState.isFailure ||
                                checkoutState.order == null) {
                              return CommonLoadError(
                                message:
                                    checkoutState.errorMessage ??
                                    'Unable to load checkout data. Please try again.',
                                onRetry: () {
                                  context.read<CheckoutBloc>().add(
                                    const CheckoutReloadRequested(),
                                  );
                                },
                              );
                            }

                            return BlocBuilder<CartBloc, CartState>(
                              builder: (BuildContext context, CartState cartState) {
                                final double totalAmount = cartState.totalAmount
                                    .clamp(0, double.infinity);

                                return BlocBuilder<AddressBloc, AddressState>(
                                  builder: (BuildContext context, AddressState addressState) {
                                    return BlocBuilder<CardBloc, CardState>(
                                      builder: (BuildContext context, CardState cardState) {
                                        final String paymentDescription =
                                            cardState.selectedCard == null
                                            ? 'Select a payment card'
                                            : 'Card Ending ****${cardState.selectedCard!.lastFourDigits}';

                                        return Stack(
                                          children: <Widget>[
                                            CheckoutContentSection(
                                              cartItems: cartState.items,
                                              order: checkoutState.order!,
                                              subTotal: cartState.totalAmount,
                                              totalAmount: totalAmount,
                                              selectedAddress:
                                                  addressState.selectedAddress,
                                              paymentDescription:
                                                  paymentDescription,
                                              onAddressTap: () {
                                                context.router.push(
                                                  const AddressListRoute(),
                                                );
                                              },
                                              onPaymentTap: () {
                                                context.router.push(
                                                  const PaymentCardListRoute(),
                                                );
                                              },
                                            ),
                                            Positioned(
                                              left: 25,
                                              right: 25,
                                              bottom:
                                                  MediaQuery.of(
                                                    context,
                                                  ).padding.bottom +
                                                  16,
                                              child: OrderNowButton(
                                                enabled:
                                                    cartState
                                                        .items
                                                        .isNotEmpty &&
                                                    !checkoutState
                                                        .isPlacingOrder,
                                                isLoading: checkoutState
                                                    .isPlacingOrder,
                                                onPressed: () {
                                                  context
                                                      .read<CheckoutBloc>()
                                                      .add(
                                                        CheckoutOrderNowPressed(
                                                          subTotal: cartState
                                                              .totalAmount,
                                                        ),
                                                      );
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                      },
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
