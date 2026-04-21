import 'package:flutter/material.dart';

import '../../domain/entities/home_category.dart';
import 'home_colors.dart';
import 'home_section_title.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.categories,
    this.onViewAllTap,
    this.onCategoryTap,
  });

  final List<HomeCategory> categories;
  final VoidCallback? onViewAllTap;
  final ValueChanged<HomeCategory>? onCategoryTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HomeSectionTitle(
          title: 'CATEGORIES',
          actionText: 'All Categories',
          onActionTap: onViewAllTap,
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              final HomeCategory category = categories[index];
              return GestureDetector(
                onTap: onCategoryTap == null
                    ? null
                    : () => onCategoryTap!(category),
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: category.isAsset
                                ? AssetImage(category.imagePath)
                                      as ImageProvider
                                : NetworkImage(category.imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category.name,
                        style: const TextStyle(color: HomeColors.black),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
