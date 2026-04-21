import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid/core/bloc/cart/cart_bloc.dart';
import 'package:solid/core/router/app.router.gr.dart';

import 'common_bottom_tab_bar.dart';

class AppBottomNavTabConfig {
  const AppBottomNavTabConfig({
    required this.icon,
    required this.label,
    this.route,
    this.hasAvatarRing = false,
    this.avatarImagePath,
    this.badgeCount = 0,
  });

  final IconData icon;
  final String label;
  final PageRouteInfo<dynamic>? route;
  final bool hasAvatarRing;
  final String? avatarImagePath;
  final int badgeCount;

  CommonBottomTabData toCommonBottomTabData() {
    return CommonBottomTabData(
      icon: icon,
      label: label,
      hasAvatarRing: hasAvatarRing,
      avatarImagePath: avatarImagePath,
      badgeCount: badgeCount,
    );
  }
}

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key, required this.selectedIndex});

  final int selectedIndex;

  List<AppBottomNavTabConfig> _buildTabs(int cartQuantity) {
    return <AppBottomNavTabConfig>[
      const AppBottomNavTabConfig(
        icon: Icons.home_filled,
        label: 'Home',
        route: HomeRoute(),
      ),
      const AppBottomNavTabConfig(
        icon: Icons.favorite,
        label: 'Wishlist',
        route: WishlistRoute(),
      ),
      AppBottomNavTabConfig(
        icon: Icons.shopping_bag,
        label: 'Cart',
        route: CartRoute(),
        badgeCount: cartQuantity,
      ),
      const AppBottomNavTabConfig(
        icon: Icons.search,
        label: 'Search',
        route: SearchRoute(),
      ),
      const AppBottomNavTabConfig(
        icon: Icons.account_circle,
        label: 'Account',
        route: ProfileRoute(),
        hasAvatarRing: true,
        avatarImagePath: 'assets/home/maskgroup2.png',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final int cartQuantity = context.select(
      (CartBloc bloc) => bloc.state.totalQuantity,
    );
    final List<AppBottomNavTabConfig> tabs = _buildTabs(cartQuantity);

    return CommonBottomTabBar(
      tabs: tabs
          .map((AppBottomNavTabConfig tab) => tab.toCommonBottomTabData())
          .toList(growable: false),
      selectedIndex: selectedIndex,
      onTap: (int index) => _handleTap(context, index, tabs),
      backgroundColor: const Color(0xFFF5F5F5),
      selectedColor: const Color(0xFFFF6A2B),
      unselectedColor: const Color(0xFF8A8A8A),
      avatarFallbackIconColor: const Color(0xFF6D6D6D),
      labelStyle: const TextStyle(
        fontSize: 11,
        color: Color(0xFF8A8A8A),
        fontWeight: FontWeight.w400,
      ),
    );
  }

  void _handleTap(
    BuildContext context,
    int index,
    List<AppBottomNavTabConfig> tabs,
  ) {
    if (index == selectedIndex) {
      return;
    }

    if (index < 0 || index >= tabs.length) {
      return;
    }

    final AppBottomNavTabConfig tab = tabs[index];
    final PageRouteInfo<dynamic>? route = tab.route;

    if (route != null) {
      context.router.navigate(route);
      return;
    }

    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('${tab.label} feature is coming soon.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }
}
