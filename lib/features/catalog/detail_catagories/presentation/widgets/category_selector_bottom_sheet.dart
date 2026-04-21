import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/detail_catagories_bloc.dart';
import '../bloc/detail_catagories_event.dart';
import '../bloc/detail_catagories_state.dart';
import 'detail_catagories_colors.dart';

Future<void> showCategorySelectorBottomSheet(
  BuildContext context,
  DetailCatagoriesState state,
) async {
  final DetailCatagoriesBloc bloc = context.read<DetailCatagoriesBloc>();

  if (state.isCategorySheetOpen || state.categories.isEmpty) {
    return;
  }

  bloc.add(const DetailCatagoriesSheetToggled(isOpen: true));

  final String? selected = await showModalBottomSheet<String>(
    context: context,
    backgroundColor: DetailCatagoriesColors.white,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
    ),
    builder: (BuildContext context) => CategorySelectorBottomSheet(
      categories: state.categories,
      selectedCategory: state.selectedCategory,
    ),
  );

  bloc.add(const DetailCatagoriesSheetToggled(isOpen: false));

  if (selected != null && selected != state.selectedCategory) {
    bloc.add(DetailCatagoriesCategoryChanged(selected));
  }
}

class CategorySelectorBottomSheet extends StatelessWidget {
  const CategorySelectorBottomSheet({
    super.key,
    required this.categories,
    required this.selectedCategory,
  });

  final List<String> categories;
  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 10, 24, 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 48,
              height: 3,
              decoration: BoxDecoration(
                color: const Color(0xFFD2D2D2),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
            const SizedBox(height: 10),
            ...categories.asMap().entries.map((MapEntry<int, String> entry) {
              final int index = entry.key;
              final String category = entry.value;
              final bool isSelected = category == selectedCategory;

              return Column(
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: Text(
                      category,
                      style: GoogleFonts.poppins(
                        color: isSelected
                            ? DetailCatagoriesColors.primary
                            : DetailCatagoriesColors.mediumGray,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        letterSpacing: 0,
                      ),
                    ),
                    trailing: Container(
                      width: 11,
                      height: 11,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? DetailCatagoriesColors.primary
                              : DetailCatagoriesColors.lightGray,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: isSelected
                          ? Center(
                              child: Container(
                                width: 3,
                                height: 3,
                                decoration: const BoxDecoration(
                                  color: DetailCatagoriesColors.primary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                          : null,
                    ),
                    onTap: () {
                      context.router.maybePop(category);
                    },
                  ),
                  if (index != categories.length - 1)
                    const Divider(color: Color(0xFFE9E9E9), height: 1),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
