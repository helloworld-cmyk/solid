import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/di/injection.dart';
import 'package:solid/core/router/app.router.gr.dart';

import 'domain/entities/search_content.dart';
import 'domain/entities/search_product_item.dart';
import 'domain/usecases/get_search_content_usecase.dart';
import 'presentation/widgets/filter_chips_section.dart';
import 'presentation/widgets/search_colors.dart';
import 'presentation/widgets/search_load_error.dart';
import 'presentation/widgets/you_also_viewed_section.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(theme.textTheme),
      ),
      child: FutureBuilder<SearchContent>(
        future: sl<GetSearchContentUseCase>()(),
        builder: (BuildContext context, AsyncSnapshot<SearchContent> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              backgroundColor: SearchColors.white,
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return Scaffold(
              backgroundColor: SearchColors.white,
              body: SearchLoadError(
                onRetry: () {
                  context.router.replace(const SearchRoute());
                },
              ),
            );
          }

          final SearchContent content = snapshot.data!;

          return Scaffold(
            backgroundColor: SearchColors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () => context.router.maybePop(),
                            borderRadius: BorderRadius.circular(20),
                            child: const Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: SearchColors.black,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(color: SearchColors.border),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search Product...',
                                  hintStyle: GoogleFonts.poppins(
                                    color: SearchColors.lightGray,
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                  isDense: true,
                                ),
                                style: GoogleFonts.poppins(
                                  color: SearchColors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          InkWell(
                            onTap: () {
                              context.router.push(const SearchFilterRoute());
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: const Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.tune,
                                color: SearchColors.mediumGray,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    FilterChipsSection(categories: content.filterCategories),
                    const SizedBox(height: 32),
                    YouAlsoViewedSection(
                      products: content.products,
                      onProductTap: (SearchProductItem product) {
                        context.router.push(
                          ProductRoute(
                            image: product.imagePath,
                            title: product.name,
                            price: product.price,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
