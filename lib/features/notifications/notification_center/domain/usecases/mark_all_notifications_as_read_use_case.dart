import '../entities/app_notification.dart';
import '../repositories/notification_updater.dart';

class MarkAllNotificationsAsReadUseCase {
  const MarkAllNotificationsAsReadUseCase(this._updater);

  final NotificationUpdater _updater;

  Future<List<AppNotification>> call() {
    return _updater.markAllAsRead();
  }
}
