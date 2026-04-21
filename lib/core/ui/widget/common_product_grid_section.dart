import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common_section_title.dart';

class CommonProductGridSection extends StatelessWidget {
  const CommonProductGridSection({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.title,
    this.actionText,
    this.onActionTap,
    this.trailing,
  });

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final String? title;
  final String? actionText;
  final VoidCallback? onActionTap;
  final Widget? trailing;

  static const EdgeInsetsGeometry _sectionPadding = EdgeInsets.zero;
  static const EdgeInsetsGeometry _titlePadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 16,
  );
  static const EdgeInsetsGeometry _gridPadding = EdgeInsets.symmetric(
    horizontal: 16,
  );
  static const double _titleBottomSpacing = 0;
  static const double _crossAxisSpacing = 16;
  static const double _mainAxisSpacing = 16;
  static const double _childAspectRatio = 0.65;
  static const Color _titleColor = Color(0xFF000000);
  static const Color _actionColor = Color(0xFF666666);
  static const Color _accentColor = Color(0xFFFF6A2B);
  static const double _accentWidth = 2;
  static const double _accentHeight = 30;
  static const double _accentRadius = 2;

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = GoogleFonts.bebasNeue(
      color: _titleColor,
      fontSize: 30,
      letterSpacing: 1.2,
    );
    final TextStyle actionStyle = GoogleFonts.poppins(
      color: _actionColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
    );

    return Padding(
      padding: _sectionPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (title != null)
            CommonSectionTitle(
              title: title!,
              actionText: actionText,
              onActionTap: onActionTap,
              trailing: trailing,
              padding: _titlePadding,
              titleStyle: titleStyle,
              actionStyle: actionStyle,
              accentColor: _accentColor,
              accentWidth: _accentWidth,
              accentHeight: _accentHeight,
              accentRadius: _accentRadius,
            ),
          if (title != null && _titleBottomSpacing > 0)
            SizedBox(height: _titleBottomSpacing),
          Padding(
            padding: _gridPadding,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: _crossAxisSpacing,
                mainAxisSpacing: _mainAxisSpacing,
                childAspectRatio: _childAspectRatio,
              ),
              itemCount: itemCount,
              itemBuilder: itemBuilder,
            ),
          ),
        ],
      ),
    );
  }
}
