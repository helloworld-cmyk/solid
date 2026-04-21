import '../entities/app_notification.dart';
import '../repositories/notification_reader.dart';

class LoadNotificationsUseCase {
  const LoadNotificationsUseCase(this._reader);

  final NotificationReader _reader;

  Future<List<AppNotification>> call() {
    return _reader.loadNotifications();
  }
}
