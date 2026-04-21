import '../entities/app_notification.dart';

abstract class NotificationReader {
  Future<List<AppNotification>> loadNotifications();
}
