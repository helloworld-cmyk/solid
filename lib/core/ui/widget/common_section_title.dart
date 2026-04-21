import 'package:flutter/material.dart';

class CommonSectionTitle extends StatelessWidget {
  const CommonSectionTitle({
    super.key,
    required this.title,
    this.actionText,
    this.onActionTap,
    this.trailing,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    this.accentColor = const Color(0xFFFF6A2B),
    this.accentWidth = 2,
    this.accentHeight = 30,
    this.accentRadius = 2,
    this.titleSpacing = 8,
    this.titleStyle,
    this.actionStyle,
    this.actionUnderlineColor = const Color(0xFF666666),
  });

  final String title;
  final String? actionText;
  final VoidCallback? onActionTap;
  final Widget? trailing;
  final EdgeInsetsGeometry padding;
  final Color accentColor;
  final double accentWidth;
  final double accentHeight;
  final double accentRadius;
  final double titleSpacing;
  final TextStyle? titleStyle;
  final TextStyle? actionStyle;
  final Color actionUnderlineColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: accentWidth,
                height: accentHeight,
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(accentRadius),
                ),
              ),
              SizedBox(width: titleSpacing),
              Text(title, style: titleStyle),
            ],
          ),
          if (trailing != null)
            trailing!
          else if (actionText != null)
            GestureDetector(
              onTap: onActionTap,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: actionUnderlineColor, width: 1),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  actionText!,
                  textAlign: TextAlign.right,
                  style: actionStyle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
