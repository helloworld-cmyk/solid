import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/di/injection.dart';
import 'package:solid/core/router/app.router.gr.dart';
import 'package:solid/core/ui/widget/widgets.dart';

import 'domain/entities/category_item.dart';
import 'presentation/bloc/catagories_bloc.dart';
import 'presentation/bloc/catagories_event.dart';
import 'presentation/bloc/catagories_state.dart';
import 'presentation/widgets/catagories_card.dart';
import 'presentation/widgets/catagories_load_error.dart';

@RoutePage()
class CatagoriesPage extends StatelessWidget {
  const CatagoriesPage({super.key, this.initialCategory});

  final String? initialCategory;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      child: BlocProvider<CatagoriesBloc>(
        create: (_) => sl<CatagoriesBloc>()..add(const CatagoriesStarted()),
        child: Scaffold(
          backgroundColor: const Color(0xFFF2F2F2),
          body: Column(
            children: <Widget>[
              CommonPageHeader(
                title: 'CATEGORIES',
                onBack: () => context.router.maybePop(),
              ),
              Expanded(
                child: BlocBuilder<CatagoriesBloc, CatagoriesState>(
                  builder: (BuildContext context, CatagoriesState state) {
                    if (state.isInitial || state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.isFailure) {
                      return CatagoriesLoadError(
                        message:
                            state.errorMessage ??
                            'Unable to load categories. Please try again.',
                        onRetry: () {
                          context.read<CatagoriesBloc>().add(
                            const CatagoriesReloadRequested(),
                          );
                        },
                      );
                    }

                    final String? normalizedInitialCategory = initialCategory
                        ?.trim()
                        .toLowerCase();

                    return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(25, 16, 25, 24),
                      itemCount: state.items.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 20),
                      itemBuilder: (BuildContext context, int index) {
                        final CategoryItem item = state.items[index];
                        final bool isHighlighted =
                            normalizedInitialCategory != null &&
                            item.title.toLowerCase() ==
                                normalizedInitialCategory;

                        return CatagoriesCard(
                          title: item.title,
                          imagePath: item.imagePath,
                          bottomLineWidth: item.lineWidth,
                          isHighlighted: isHighlighted,
                          onTap: () {
                            context.router.push(
                              DetailCatagoriesRoute(categoryTitle: item.title),
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
      ),
    );
  }
}
