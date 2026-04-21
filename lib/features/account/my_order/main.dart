import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/bloc/my_order/my_order_bloc.dart';
import 'package:solid/core/bloc/my_order/my_order_event.dart';
import 'package:solid/core/bloc/my_order/my_order_state.dart';
import 'package:solid/core/router/app.router.gr.dart';
import 'package:solid/core/ui/widget/widgets.dart';

import 'domain/entities/order.dart';
import 'domain/entities/order_recommendation.dart';
import 'presentation/widgets/my_order_item_tile.dart';
import 'presentation/widgets/my_order_recommendations_section.dart';
import 'presentation/widgets/my_order_tab_switcher.dart';

@RoutePage()
class MyOrderPage extends StatelessWidget {
  const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(theme.textTheme),
      ),
      child: BlocBuilder<MyOrderBloc, MyOrderState>(
        builder: (BuildContext context, MyOrderState state) {
          return Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            body: SafeArea(
              top: false,
              child: Column(
                children: <Widget>[
                  CommonPageHeader(
                    title: 'MY ORDER',
                    onBack: () async {
                      final bool didPop = await context.router.maybePop();
                      if (!didPop && context.mounted) {
                        context.router.replace(const HomeRoute());
                      }
                    },
                  ),
                  Expanded(
                    child: state.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : state.errorMessage != null && state.items.isEmpty
                        ? CommonLoadError(
                            message: state.errorMessage!,
                            onRetry: () {
                              context.read<MyOrderBloc>().add(
                                const MyOrderReloadRequested(),
                              );
                            },
                          )
                        : ListView(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(bottom: 24),
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                child: MyOrderTabSwitcher(
                                  selectedTab: MyOrderTabType.myOrder,
                                  onWishlistTap: () {
                                    context.router.navigate(
                                      const WishlistRoute(),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 26),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                child: state.items.isEmpty
                                    ? Text(
                                        'You have no orders yet. Complete checkout to see your items here.',
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF666666),
                                          fontSize: 14,
                                        ),
                                      )
                                    : Column(
                                        children: List<Widget>.generate(
                                          state.items.length,
                                          (int index) {
                                            final Order item =
                                                state.items[index];

                                            return Padding(
                                              padding: EdgeInsets.only(
                                                bottom:
                                                    index ==
                                                        state.items.length - 1
                                                    ? 0
                                                    : 30,
                                              ),
                                              child: Column(
                                                children: <Widget>[
                                                  MyOrderItemTile(
                                                    name: item.name,
                                                    imagePath: item.imagePath,
                                                    priceText: item.priceLabel,
                                                    quantity: item.quantity,
                                                    isAsset: item.isAsset,
                                                  ),
                                                  if (index !=
                                                      state.items.length -
                                                          1) ...<Widget>[
                                                    const SizedBox(height: 28),
                                                    const Divider(
                                                      height: 1,
                                                      thickness: 1,
                                                      color: Color(0xFFEEEEEE),
                                                    ),
                                                  ],
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                              ),
                              const SizedBox(height: 44),
                              MyOrderRecommendationsSection(
                                products: state.recommendations,
                                onProductTap: (OrderRecommendation product) {
                                  context.router.push(
                                    ProductRoute(
                                      image: product.imagePath,
                                      title: product.name,
                                      price: product.price,
                                    ),
                                  );
                                },
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
