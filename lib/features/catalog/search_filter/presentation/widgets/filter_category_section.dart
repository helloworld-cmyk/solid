import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/search_filter.dart';
import 'search_filter_colors.dart';

class FilterCategorySection extends StatelessWidget {
  const FilterCategorySection({
    super.key,
    required this.groups,
    required this.expandedTitles,
    required this.selectedItem,
    required this.onGroupTap,
    required this.onItemTap,
  });

  final List<SearchFilterCategoryGroup> groups;
  final List<String> expandedTitles;
  final String selectedItem;
  final ValueChanged<String> onGroupTap;
  final ValueChanged<String> onItemTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: groups
          .map((SearchFilterCategoryGroup group) {
            final bool isExpanded = expandedTitles.contains(group.title);

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () => onGroupTap(group.title),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              group.title,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: isExpanded
                                    ? FontWeight.w500
                                    : FontWeight.w400,
                                color: isExpanded
                                    ? SearchFilterColors.primary
                                    : SearchFilterColors.black,
                                height: 1.2,
                              ),
                            ),
                          ),
                          TweenAnimationBuilder<double>(
                            tween: Tween<double>(
                              begin: 0,
                              end: isExpanded ? 0.5 : 0,
                            ),
                            duration: const Duration(milliseconds: 260),
                            curve: Curves.easeInOutCubic,
                            builder:
                                (
                                  BuildContext context,
                                  double turns,
                                  Widget? child,
                                ) {
                                  return Transform.rotate(
                                    angle: turns * math.pi,
                                    child: child,
                                  );
                                },
                            child: Icon(
                              Icons.chevron_right,
                              size: 18,
                              color: isExpanded
                                  ? SearchFilterColors.black
                                  : SearchFilterColors.darkGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: SearchFilterColors.border,
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 280),
                    reverseDuration: const Duration(milliseconds: 220),
                    switchInCurve: Curves.easeOutCubic,
                    switchOutCurve: Curves.easeInCubic,
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          return ClipRect(
                            child: SizeTransition(
                              axisAlignment: -1,
                              sizeFactor: animation,
                              child: FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            ),
                          );
                        },
                    child: isExpanded
                        ? Padding(
                            key: ValueKey<String>('expanded-${group.title}'),
                            padding: const EdgeInsets.only(top: 14, bottom: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: group.items
                                  .map((String item) {
                                    return InkWell(
                                      onTap: () => onItemTap(item),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 16,
                                        ),
                                        child: Text(
                                          item,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: item == selectedItem
                                                ? FontWeight.w500
                                                : FontWeight.w400,
                                            color: item == selectedItem
                                                ? SearchFilterColors.mediumGray
                                                : SearchFilterColors.lightGray,
                                            height: 1.2,
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                                  .toList(growable: false),
                            ),
                          )
                        : const SizedBox(key: ValueKey<String>('collapsed')),
                  ),
                ],
              ),
            );
          })
          .toList(growable: false),
    );
  }
}
