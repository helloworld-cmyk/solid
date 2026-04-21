import '../../domain/entities/app_notification.dart';
import '../../domain/repositories/notification_repository.dart';

class DelayedNotificationRepository implements NotificationRepository {
  DelayedNotificationRepository({
    required NotificationRepository delegate,
    this.delay = const Duration(milliseconds: 180),
  }) : _delegate = delegate;

  final NotificationRepository _delegate;
  final Duration delay;

  @override
  Future<List<AppNotification>> loadNotifications() async {
    await Future<void>.delayed(delay);
    return _delegate.loadNotifications();
  }

  @override
  Future<List<AppNotification>> markAllAsRead() async {
    await Future<void>.delayed(delay);
    return _delegate.markAllAsRead();
  }

  @override
  Future<List<AppNotification>> markAsReadByIds(
    Set<String> notificationIds,
  ) async {
    await Future<void>.delayed(delay);
    return _delegate.markAsReadByIds(notificationIds);
  }
}
