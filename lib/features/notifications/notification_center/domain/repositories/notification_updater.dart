import '../entities/app_notification.dart';

abstract class NotificationUpdater {
  Future<List<AppNotification>> markAllAsRead();

  Future<List<AppNotification>> markAsReadByIds(Set<String> notificationIds);
}
