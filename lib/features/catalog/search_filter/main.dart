import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/di/injection.dart';

import 'presentation/bloc/search_filter_bloc.dart';
import 'presentation/bloc/search_filter_event.dart';
import 'presentation/bloc/search_filter_state.dart';
import 'presentation/widgets/filter_apply_button.dart';
import 'presentation/widgets/filter_category_section.dart';
import 'presentation/widgets/filter_color_section.dart';
import 'presentation/widgets/filter_header.dart';
import 'presentation/widgets/filter_price_section.dart';
import 'presentation/widgets/filter_size_section.dart';
import 'presentation/widgets/search_filter_colors.dart';
import 'presentation/widgets/search_filter_load_error.dart';

@RoutePage()
class SearchFilterPage extends StatelessWidget {
  const SearchFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(theme.textTheme),
      ),
      child: BlocProvider<SearchFilterBloc>(
        create: (_) => sl<SearchFilterBloc>()..add(const SearchFilterStarted()),
        child: Scaffold(
          backgroundColor: SearchFilterColors.white,
          body: SafeArea(
            top: false,
            child: BlocBuilder<SearchFilterBloc, SearchFilterState>(
              builder: (BuildContext context, SearchFilterState state) {
                final double topInset = MediaQuery.paddingOf(context).top;

                if (state.isInitial || state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.isFailure || state.filter == null) {
                  return SearchFilterLoadError(
                    message:
                        state.errorMessage ??
                        'Unable to load filter options. Please try again.',
                    onRetry: () {
                      context.read<SearchFilterBloc>().add(
                        const SearchFilterReloadRequested(),
                      );
                    },
                  );
                }

                final filter = state.filter!;

                return SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(24, topInset + 16, 24, 20),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FilterHeader(onClose: () => context.router.maybePop()),
                      const SizedBox(height: 28),
                      FilterCategorySection(
                        groups: filter.categoryGroups,
                        expandedTitles: state.expandedTitles,
                        selectedItem: state.selectedCategoryItem,
                        onGroupTap: (String title) {
                          context.read<SearchFilterBloc>().add(
                            SearchFilterGroupSelected(title),
                          );
                        },
                        onItemTap: (String item) {
                          context.read<SearchFilterBloc>().add(
                            SearchFilterItemSelected(item),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      FilterColorSection(
                        colorValues: filter.colorValues,
                        selectedColorValue: state.selectedColorValue,
                        onColorSelected: (int value) {
                          context.read<SearchFilterBloc>().add(
                            SearchFilterColorSelected(value),
                          );
                        },
                      ),
                      const SizedBox(height: 34),
                      FilterSizeSection(
                        sizes: filter.sizes,
                        selectedSize: state.selectedSize,
                        onSizeSelected: (String value) {
                          context.read<SearchFilterBloc>().add(
                            SearchFilterSizeSelected(value),
                          );
                        },
                      ),
                      const SizedBox(height: 34),
                      FilterPriceSection(
                        values: state.priceValues,
                        min: filter.minPrice,
                        max: filter.maxPrice,
                        onChanged: (RangeValues values) {
                          context.read<SearchFilterBloc>().add(
                            SearchFilterPriceRangeChanged(values),
                          );
                        },
                      ),
                      const SizedBox(height: 42),
                      FilterApplyButton(
                        onPressed: () => context.router.maybePop(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
