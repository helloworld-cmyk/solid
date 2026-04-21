import '../../domain/entities/app_notification.dart';

abstract class NotificationDataSource {
  Future<List<AppNotification>> fetchNotifications();
}
