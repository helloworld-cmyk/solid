import '../entities/app_notification.dart';
import '../repositories/notification_updater.dart';

class MarkNotificationsAsReadUseCase {
  const MarkNotificationsAsReadUseCase(this._updater);

  final NotificationUpdater _updater;

  Future<List<AppNotification>> call(Set<String> notificationIds) {
    return _updater.markAsReadByIds(notificationIds);
  }
}
