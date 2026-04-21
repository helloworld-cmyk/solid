import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/di/injection.dart';
import 'package:solid/core/router/app.router.gr.dart';

import 'domain/entities/detail_catagories_product.dart';
import 'presentation/bloc/detail_catagories_bloc.dart';
import 'presentation/bloc/detail_catagories_event.dart';
import 'presentation/bloc/detail_catagories_state.dart';
import 'presentation/widgets/category_filter_field.dart';
import 'presentation/widgets/category_selector_bottom_sheet.dart';
import 'presentation/widgets/detail_catagories_colors.dart';
import 'presentation/widgets/detail_catagories_hero_header.dart';
import 'presentation/widgets/detail_catagories_load_error.dart';
import 'presentation/widgets/detail_catagories_product_card.dart';

@RoutePage()
class DetailCatagoriesPage extends StatelessWidget {
  const DetailCatagoriesPage({super.key, required this.categoryTitle});

  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      child: BlocProvider<DetailCatagoriesBloc>(
        create: (_) =>
            sl<DetailCatagoriesBloc>()
              ..add(DetailCatagoriesStarted(categoryTitle: categoryTitle)),
        child: Scaffold(
          backgroundColor: DetailCatagoriesColors.pageBackground,
          body: SafeArea(
            top: false,
            child: Column(
              children: <Widget>[
                BlocBuilder<DetailCatagoriesBloc, DetailCatagoriesState>(
                  buildWhen:
                      (
                        DetailCatagoriesState previous,
                        DetailCatagoriesState current,
                      ) {
                        return previous.heroImagePath != current.heroImagePath;
                      },
                  builder: (BuildContext context, DetailCatagoriesState state) {
                    return DetailCatagoriesHeroHeader(
                      onBackTap: () => context.router.maybePop(),
                      title: categoryTitle,
                      imagePath: state.heroImagePath,
                    );
                  },
                ),
                Expanded(
                  child: BlocBuilder<DetailCatagoriesBloc, DetailCatagoriesState>(
                    builder: (BuildContext context, DetailCatagoriesState state) {
                      if (state.isInitial || state.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state.isFailure) {
                        return DetailCatagoriesLoadError(
                          message:
                              state.errorMessage ??
                              'Unable to load category details. Please try again.',
                          onRetry: () {
                            context.read<DetailCatagoriesBloc>().add(
                              const DetailCatagoriesReloadRequested(),
                            );
                          },
                        );
                      }

                      return SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(25, 16, 25, 24),
                        child: Column(
                          children: <Widget>[
                            CategoryFilterField(
                              title: state.selectedCategory,
                              isExpanded: state.isCategorySheetOpen,
                              onTap: () => showCategorySelectorBottomSheet(
                                context,
                                state,
                              ),
                            ),
                            const SizedBox(height: 16),
                            GridView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                    childAspectRatio: 0.65,
                                  ),
                              itemCount: state.products.length,
                              itemBuilder: (BuildContext context, int index) {
                                final DetailCatagoriesProduct product =
                                    state.products[index];

                                return DetailCatagoriesProductCard(
                                  product: product,
                                  onTap: () {
                                    context.router.push(
                                      ProductRoute(
                                        image: product.imagePath,
                                        title: product.name,
                                        price: product.price,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
