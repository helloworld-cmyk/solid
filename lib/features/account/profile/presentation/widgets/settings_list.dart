import 'package:flutter/material.dart';

import '../../profile_typography.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({
    super.key,
    required this.onAccountSettingTap,
    required this.onNotificationTap,
    required this.onPaymentInformationTap,
    required this.onFeatureTap,
    required this.onSignOutTap,
  });

  final VoidCallback onAccountSettingTap;
  final VoidCallback onNotificationTap;
  final VoidCallback onPaymentInformationTap;
  final ValueChanged<String> onFeatureTap;
  final VoidCallback onSignOutTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _SettingItem(
          icon: Icons.person_outline,
          label: 'Account Setting',
          onTap: onAccountSettingTap,
        ),
        _SettingItem(
          icon: Icons.notifications_none,
          label: 'Notification',
          onTap: onNotificationTap,
        ),
        _SettingItem(
          icon: Icons.payment_outlined,
          label: 'Payment Information',
          onTap: onPaymentInformationTap,
        ),
        _SettingItem(
          icon: Icons.lock_outline,
          label: 'Privacy Setting',
          onTap: () {
            onFeatureTap('Privacy Setting');
          },
        ),
        _SettingItem(
          icon: Icons.settings_outlined,
          label: 'General Setting',
          onTap: () {
            onFeatureTap('General Setting');
          },
        ),
        _SettingItem(
          icon: Icons.language_outlined,
          label: 'Language',
          onTap: () {
            onFeatureTap('Language');
          },
        ),
        _SettingItem(
          icon: Icons.group_outlined,
          label: 'Change Account',
          onTap: () {
            onFeatureTap('Change Account');
          },
        ),
        _SettingItem(
          icon: Icons.logout,
          label: 'Sign Out',
          labelColor: Colors.red,
          showArrow: false,
          onTap: onSignOutTap,
        ),
      ],
    );
  }
}

class _SettingItem extends StatelessWidget {
  const _SettingItem({
    required this.icon,
    required this.label,
    this.labelColor,
    this.showArrow = true,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color? labelColor;
  final bool showArrow;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: labelColor ?? ProfileColors.black, size: 22),
      title: Text(
        label,
        style: labelColor != null
            ? ProfileTypography.signOut
            : ProfileTypography.menuItem,
      ),
      trailing: showArrow
          ? const Icon(
              Icons.chevron_right,
              size: 20,
              color: ProfileColors.black,
            )
          : null,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
    );
  }
}
