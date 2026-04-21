import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/bloc/cart/cart_bloc.dart';
import 'package:solid/core/bloc/cart/cart_event.dart';
import 'package:solid/core/bloc/cart/cart_state.dart';
import 'package:solid/core/di/injection.dart';
import 'package:solid/core/router/app.router.gr.dart';
import 'package:solid/core/ui/widget/widgets.dart';

import 'domain/entities/coupon.dart';
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
                                final Coupon? appliedCoupon =
                                    checkoutState.appliedCoupon;
                                final double discountAmount =
                                    appliedCoupon?.discountFor(
                                      cartState.totalAmount,
                                    ) ??
                                    0;
                                final double totalAmount =
                                    (cartState.totalAmount - discountAmount)
                                        .clamp(0, double.infinity);

                                return Stack(
                                  children: <Widget>[
                                    CheckoutContentSection(
                                      cartItems: cartState.items,
                                      order: checkoutState.order!,
                                      couponInput: checkoutState.couponInput,
                                      appliedCoupon: appliedCoupon,
                                      isApplyingCoupon:
                                          checkoutState.isApplyingCoupon,
                                      subTotal: cartState.totalAmount,
                                      discountAmount: discountAmount,
                                      totalAmount: totalAmount,
                                      onCouponChanged: (String value) {
                                        context.read<CheckoutBloc>().add(
                                          CheckoutCouponInputChanged(value),
                                        );
                                      },
                                      onApplyCoupon: () {
                                        context.read<CheckoutBloc>().add(
                                          CheckoutCouponApplyRequested(
                                            subTotal: cartState.totalAmount,
                                          ),
                                        );
                                      },
                                      onAddressTap: () {
                                        final ScaffoldMessengerState messenger =
                                            ScaffoldMessenger.of(context);
                                        messenger
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Address management feature is coming soon.',
                                              ),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                            ),
                                          );
                                      },
                                      onPaymentTap: () {
                                        final ScaffoldMessengerState messenger =
                                            ScaffoldMessenger.of(context);
                                        messenger
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Payment card feature is coming soon.',
                                              ),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                            ),
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
                                            cartState.items.isNotEmpty &&
                                            !checkoutState.isPlacingOrder,
                                        isLoading: checkoutState.isPlacingOrder,
                                        onPressed: () {
                                          context.read<CheckoutBloc>().add(
                                            CheckoutOrderNowPressed(
                                              subTotal: cartState.totalAmount,
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
