import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/bloc/cart/cart_bloc.dart';
import 'package:solid/core/bloc/cart/cart_event.dart';
import 'package:solid/core/bloc/cart/cart_item.dart';
import 'package:solid/core/bloc/wishlist/wishlist_bloc.dart';
import 'package:solid/core/bloc/wishlist/wishlist_event.dart';
import 'package:solid/core/bloc/wishlist/wishlist_state.dart';
import 'package:solid/core/router/app.router.gr.dart';
import 'package:solid/core/ui/widget/widgets.dart';

import 'domain/entities/wishlist_item.dart';
import 'domain/entities/wishlist_recommendation.dart';
import 'presentation/widgets/wishlist_item_tile.dart';
import 'presentation/widgets/wishlist_recommendations_section.dart';
import 'presentation/widgets/wishlist_tab_switcher.dart';

@RoutePage()
class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(theme.textTheme),
      ),
      child: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (BuildContext context, WishlistState state) {
          return Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            body: SafeArea(
              top: false,
              child: Column(
                children: <Widget>[
                  CommonPageHeader(
                    title: 'WISHLIST',
                    onBack: () => context.router.maybePop(),
                  ),
                  Expanded(
                    child: state.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : state.errorMessage != null && state.items.isEmpty
                        ? CommonLoadError(
                            message: state.errorMessage!,
                            onRetry: () {
                              context.read<WishlistBloc>().add(
                                const WishlistStarted(),
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
                                child: WishlistTabSwitcher(
                                  selectedTab: WishlistTabType.wishlist,
                                  onOrderTap: () {
                                    context.router.navigate(
                                      const MyOrderRoute(),
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
                                        'Your wishlist is empty. Tap the heart on a product to save it here.',
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF666666),
                                          fontSize: 14,
                                        ),
                                      )
                                    : Column(
                                        children: List<Widget>.generate(
                                          state.items.length,
                                          (int index) {
                                            final WishlistItem item =
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
                                                  WishlistItemTile(
                                                    name: item.name,
                                                    imagePath: item.imagePath,
                                                    priceText: item.priceText,
                                                    isAsset: item.isAsset,
                                                    onCartTap: () {
                                                      context
                                                          .read<CartBloc>()
                                                          .add(
                                                            CartItemAdded(
                                                              CartItem(
                                                                id: item.id,
                                                                name: item.name,
                                                                image: item
                                                                    .imagePath,
                                                                price:
                                                                    item.price,
                                                              ),
                                                            ),
                                                          );

                                                      final ScaffoldMessengerState
                                                      messenger =
                                                          ScaffoldMessenger.of(
                                                            context,
                                                          );
                                                      messenger
                                                        ..hideCurrentSnackBar()
                                                        ..showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              '${item.name} has been added to your cart.',
                                                            ),
                                                            behavior:
                                                                SnackBarBehavior
                                                                    .floating,
                                                          ),
                                                        );
                                                    },
                                                    onRemoveTap: () {
                                                      context
                                                          .read<WishlistBloc>()
                                                          .add(
                                                            WishlistItemRemoved(
                                                              item.id,
                                                            ),
                                                          );
                                                    },
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
                              WishlistRecommendationsSection(
                                products: state.recommendations,
                                onProductTap: (WishlistRecommendation product) {
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
            bottomNavigationBar: const AppBottomNavBar(selectedIndex: 1),
          );
        },
      ),
    );
  }
}
