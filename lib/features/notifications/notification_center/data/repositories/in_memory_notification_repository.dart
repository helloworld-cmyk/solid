import '../../domain/entities/app_notification.dart';
import '../../domain/repositories/notification_repository.dart';
import '../datasources/notification_data_source.dart';

class InMemoryNotificationRepository implements NotificationRepository {
  InMemoryNotificationRepository({required NotificationDataSource dataSource})
    : _dataSource = dataSource;

  final NotificationDataSource _dataSource;
  List<AppNotification>? _cache;

  @override
  Future<List<AppNotification>> loadNotifications() async {
    final List<AppNotification> notifications = _cache ??= await _dataSource
        .fetchNotifications();
    return List<AppNotification>.from(notifications, growable: false);
  }

  @override
  Future<List<AppNotification>> markAllAsRead() async {
    final List<AppNotification> current = await loadNotifications();
    _cache = current
        .map((AppNotification item) => item.copyWith(isUnread: false))
        .toList(growable: false);
    return List<AppNotification>.from(_cache!, growable: false);
  }

  @override
  Future<List<AppNotification>> markAsReadByIds(
    Set<String> notificationIds,
  ) async {
    final List<AppNotification> current = await loadNotifications();
    _cache = current
        .map(
          (AppNotification item) => notificationIds.contains(item.id)
              ? item.copyWith(isUnread: false)
              : item,
        )
        .toList(growable: false);
    return List<AppNotification>.from(_cache!, growable: false);
  }
}
