import 'package:flutter/material.dart';

class CommonBottomTabData {
  const CommonBottomTabData({
    required this.icon,
    required this.label,
    this.hasAvatarRing = false,
    this.avatarImagePath,
    this.badgeCount = 0,
  });

  final IconData icon;
  final String label;
  final bool hasAvatarRing;
  final String? avatarImagePath;
  final int badgeCount;
}

class CommonBottomTabBar extends StatelessWidget {
  const CommonBottomTabBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    this.onTap,
    this.backgroundColor = const Color(0xFFF5F5F5),
    this.selectedColor = const Color(0xFFFF6A2B),
    this.unselectedColor = const Color(0xFF8A8A8A),
    this.avatarFallbackIconColor = const Color(0xFF6D6D6D),
    this.topRadius = 20,
    this.horizontalPadding = 6,
    this.topPadding = 8,
    this.bottomPadding = 8,
    this.iconSize = 22,
    this.labelStyle,
  });

  final List<CommonBottomTabData> tabs;
  final int selectedIndex;
  final ValueChanged<int>? onTap;
  final Color backgroundColor;
  final Color selectedColor;
  final Color unselectedColor;
  final Color avatarFallbackIconColor;
  final double topRadius;
  final double horizontalPadding;
  final double topPadding;
  final double bottomPadding;
  final double iconSize;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final double bottomInset = MediaQuery.of(context).padding.bottom;
    final TextStyle effectiveLabelStyle =
        labelStyle ??
        TextStyle(
          fontSize: 11,
          color: unselectedColor,
          fontWeight: FontWeight.w400,
        );

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(topRadius)),
      ),
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        topPadding,
        horizontalPadding,
        bottomPadding + bottomInset,
      ),
      child: Row(
        children: List<Widget>.generate(tabs.length, (int index) {
          final CommonBottomTabData tab = tabs[index];
          return Expanded(
            child: _CommonBottomTabItem(
              tab: tab,
              isSelected: selectedIndex == index,
              selectedColor: selectedColor,
              unselectedColor: unselectedColor,
              avatarFallbackIconColor: avatarFallbackIconColor,
              iconSize: iconSize,
              labelStyle: effectiveLabelStyle,
              onTap: () {
                if (selectedIndex == index) {
                  return;
                }
                onTap?.call(index);
              },
            ),
          );
        }),
      ),
    );
  }
}

class _CommonBottomTabItem extends StatelessWidget {
  const _CommonBottomTabItem({
    required this.tab,
    required this.isSelected,
    required this.selectedColor,
    required this.unselectedColor,
    required this.avatarFallbackIconColor,
    required this.iconSize,
    required this.labelStyle,
    required this.onTap,
  });

  final CommonBottomTabData tab;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final Color avatarFallbackIconColor;
  final double iconSize;
  final TextStyle labelStyle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color iconColor = isSelected ? selectedColor : unselectedColor;
    final bool hasBadge = tab.badgeCount > 0;
    final String badgeText = tab.badgeCount > 99
        ? '99+'
        : tab.badgeCount.toString();

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (tab.hasAvatarRing)
              Container(
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: iconColor, width: 1.2),
                ),
                child: tab.avatarImagePath == null
                    ? Icon(
                        Icons.person,
                        size: 14,
                        color: avatarFallbackIconColor,
                      )
                    : ClipOval(
                        child: Image.asset(
                          tab.avatarImagePath!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => Icon(
                            Icons.person,
                            size: 14,
                            color: avatarFallbackIconColor,
                          ),
                        ),
                      ),
              )
            else
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Icon(tab.icon, size: iconSize, color: iconColor),
                  if (hasBadge)
                    Positioned(
                      top: -7,
                      right: -12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF6A2B),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(minWidth: 18),
                        child: Text(
                          badgeText,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            const SizedBox(height: 5),
            Text(tab.label, style: labelStyle),
          ],
        ),
      ),
    );
  }
}
