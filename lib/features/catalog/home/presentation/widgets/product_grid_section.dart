import 'package:flutter/material.dart';
import 'package:solid/core/ui/widget/widgets.dart';

class ProductGridSection extends StatelessWidget {
  const ProductGridSection({
    super.key,
    required this.title,
    required this.itemCount,
    required this.itemBuilder,
    this.actionText,
    this.onActionTap,
    this.trailing,
  });

  final String title;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final String? actionText;
  final VoidCallback? onActionTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return CommonProductGridSection(
      title: title,
      actionText: actionText,
      onActionTap: onActionTap,
      trailing: trailing,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
