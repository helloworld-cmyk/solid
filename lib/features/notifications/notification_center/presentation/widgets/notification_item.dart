import 'package:flutter/material.dart';

import '../../domain/entities/app_notification.dart';
import '../mappers/notification_icon_resolver.dart';
import '../theme/notification_colors.dart';
import '../theme/notification_typography.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notification,
    required this.iconResolver,
    this.isSelectionMode = false,
    this.isSelected = false,
    this.onSelectedChanged,
  });

  final AppNotification notification;
  final NotificationIconResolver iconResolver;
  final bool isSelectionMode;
  final bool isSelected;
  final ValueChanged<bool?>? onSelectedChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (isSelectionMode)
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 16.0),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: isSelected,
                      onChanged: onSelectedChanged,
                      activeColor: NotificationColors.primary,
                      side: const BorderSide(
                        color: NotificationColors.extraLightGray,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF9F9F9),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        iconResolver.resolve(notification.type),
                        color: notification.isUnread
                            ? NotificationColors.primary
                            : NotificationColors.iconMuted,
                        size: 24,
                      ),
                    ),
                  ),
                  if (notification.isUnread)
                    Positioned(
                      top: 2,
                      right: 2,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      notification.content,
                      style: NotificationTypography.itemTitle,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      notification.timestamp,
                      style: NotificationTypography.timestamp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Divider(
            color: NotificationColors.subtleLine,
            height: 1,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
