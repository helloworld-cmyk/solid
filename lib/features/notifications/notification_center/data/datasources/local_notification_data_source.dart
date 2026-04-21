import '../../domain/entities/app_notification.dart';
import 'notification_data_source.dart';

class LocalNotificationDataSource implements NotificationDataSource {
  const LocalNotificationDataSource();

  @override
  Future<List<AppNotification>> fetchNotifications() async {
    return _seededNotifications
        .map(
          (_NotificationSeed seed) => AppNotification(
            id: seed.id,
            content: seed.content,
            timestamp: seed.timestamp,
            type: seed.type,
            isUnread: seed.isUnread,
          ),
        )
        .toList(growable: false);
  }
}

class _NotificationSeed {
  const _NotificationSeed({
    required this.id,
    required this.content,
    required this.timestamp,
    required this.type,
    required this.isUnread,
  });

  final String id;
  final String content;
  final String timestamp;
  final String type;
  final bool isUnread;
}

const List<_NotificationSeed> _seededNotifications = <_NotificationSeed>[
  _NotificationSeed(
    id: '1',
    content:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
    timestamp: '2 Day Ago',
    type: 'order',
    isUnread: true,
  ),
  _NotificationSeed(
    id: '2',
    content:
        'Porttitor rhoncus dolor purus non enim. Scelerisque eleifend donec pretium',
    timestamp: '3 Day Ago',
    type: 'shipping',
    isUnread: true,
  ),
  _NotificationSeed(
    id: '3',
    content:
        'Vivamus at augue eget arcu dictum varius duis. Sapien faucibus et molestie',
    timestamp: '4 Day Ago',
    type: 'discount',
    isUnread: true,
  ),
  _NotificationSeed(
    id: '4',
    content:
        'Blandit aliquam etiam erat velit. Id porta nibh venenatis cras sed.',
    timestamp: '5 Day Ago',
    type: 'shipping',
    isUnread: true,
  ),
  _NotificationSeed(
    id: '5',
    content:
        'In dictum non consectetur a erat nam at lectus. Vel eros donec ac',
    timestamp: '5 Day Ago',
    type: 'shipping',
    isUnread: true,
  ),
  _NotificationSeed(
    id: '6',
    content:
        'Amet risus nullam eget felis eget nunc lobortis mattis aliquam. Purus sit amet',
    timestamp: '9 Day Ago',
    type: 'discount',
    isUnread: true,
  ),
  _NotificationSeed(
    id: '7',
    content:
        'Justo nec ultrices dui sapien eget. Volutpat lacus laoreet non curabitur gravida',
    timestamp: '12 Day Ago',
    type: 'order',
    isUnread: false,
  ),
];
