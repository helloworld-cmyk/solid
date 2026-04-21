sealed class NotificationEvent {
  const NotificationEvent();
}

final class LoadNotificationsRequested extends NotificationEvent {
  const LoadNotificationsRequested();
}

final class ToggleSelectionMode extends NotificationEvent {
  const ToggleSelectionMode();
}

final class ToggleNotificationSelection extends NotificationEvent {
  const ToggleNotificationSelection(this.notificationId);

  final String notificationId;
}

final class MarkSelectedAsRead extends NotificationEvent {
  const MarkSelectedAsRead();
}

final class MarkAllAsRead extends NotificationEvent {
  const MarkAllAsRead();
}
