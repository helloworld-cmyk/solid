import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonPageHeader extends StatelessWidget {
  const CommonPageHeader({
    super.key,
    required this.title,
    this.onBack,
    this.leading,
    this.actions,
  });

  final String title;
  final VoidCallback? onBack;
  final Widget? leading;
  final List<Widget>? actions;

  static const Color _backgroundColor = Color(0xFFFFFFFF);
  static const double _horizontalPadding = 16;
  static const double _topPadding = 8;
  static const double _bottomPadding = 16;

  @override
  Widget build(BuildContext context) {
    final double topInset = MediaQuery.of(context).padding.top;

    Widget leadingWidget;
    if (leading != null) {
      leadingWidget = leading!;
    } else if (onBack != null) {
      leadingWidget = IconButton(
        padding: EdgeInsets.zero,
        splashRadius: 20,
        onPressed: onBack,
        icon: const Icon(
          Icons.arrow_back_ios_new,
          size: 16,
          color: Color(0xFF000000),
        ),
      );
    } else {
      leadingWidget = const SizedBox.shrink();
    }

    return ColoredBox(
      color: _backgroundColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          _horizontalPadding,
          topInset + _topPadding,
          _horizontalPadding,
          _bottomPadding,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(width: 40, height: 40, child: leadingWidget),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.bebasNeue(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF000000),
                  letterSpacing: 0.4,
                ),
              ),
            ),
            SizedBox(
              width: actions != null ? null : 40,
              child: actions != null
                  ? Row(mainAxisSize: MainAxisSize.min, children: actions!)
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
