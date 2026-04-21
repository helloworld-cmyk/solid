import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/di/injection.dart';
import 'package:solid/core/router/app.router.gr.dart';
import 'package:solid/core/ui/widget/widgets.dart';

import 'domain/entities/home_category.dart';
import 'domain/entities/home_product.dart';
import 'presentation/bloc/home_bloc.dart';
import 'presentation/bloc/home_event.dart';
import 'presentation/bloc/home_state.dart';
import 'presentation/widgets/category_section.dart';
import 'presentation/widgets/home_app_bar.dart';
import 'presentation/widgets/home_colors.dart';
import 'presentation/widgets/home_hero_banner.dart';
import 'presentation/widgets/home_load_error.dart';
import 'presentation/widgets/hot_deal_section.dart';
import 'presentation/widgets/new_arrival_section.dart';
import 'presentation/widgets/on_sale_section.dart';
import 'presentation/widgets/promotional_banner.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(theme.textTheme),
      ),
      child: BlocProvider<HomeBloc>(
        create: (_) => sl<HomeBloc>()..add(const HomeStarted()),
        child: Scaffold(
          backgroundColor: HomeColors.white,
          appBar: HomeAppBar(
            onNotificationTap: () {
              context.router.push(const NotificationCenterRoute());
            },
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (BuildContext context, HomeState state) {
              if (state.isInitial || state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.isFailure) {
                return HomeLoadError(
                  message: state.errorMessage ?? 'Unable to load home feed.',
                  onRetry: () {
                    context.read<HomeBloc>().add(const HomeReloadRequested());
                  },
                );
              }

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    const HomeHeroBanner(),
                    const SizedBox(height: 16),
                    CategorySection(
                      categories: state.feed.categories,
                      onViewAllTap: () {
                        context.router.push(CatagoriesRoute());
                      },
                      onCategoryTap: (HomeCategory category) {
                        context.router.push(
                          CatagoriesRoute(initialCategory: category.name),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    HotDealSection(
                      products: state.feed.hotDeals,
                      onProductTap: (HomeProduct product) {
                        context.router.push(
                          ProductRoute(
                            image: product.imagePath,
                            title: product.name,
                            price: product.price,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    const PromotionalBanner(),
                    const SizedBox(height: 24),
                    NewArrivalSection(
                      products: state.feed.newArrivals,
                      onMoreProductTap: () {
                        final ScaffoldMessengerState messenger =
                            ScaffoldMessenger.of(context);
                        messenger
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                              content: Text(
                                'More Product feature is coming soon.',
                              ),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                      },
                      onProductTap: (HomeProduct product) {
                        context.router.push(
                          ProductRoute(
                            image: product.imagePath,
                            title: product.name,
                            price: product.price,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    OnSaleSection(
                      products: state.feed.onSale,
                      onProductTap: (HomeProduct product) {
                        context.router.push(
                          ProductRoute(
                            image: product.imagePath,
                            title: product.name,
                            price: product.price,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: const AppBottomNavBar(selectedIndex: 0),
        ),
      ),
    );
  }
}
