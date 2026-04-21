import '../../domain/entities/app_notification.dart';

class NotificationState {
  const NotificationState({
    this.notifications = const <AppNotification>[],
    this.isSelectionMode = false,
    this.selectedIds = const <String>{},
    this.isLoading = false,
    this.errorMessage,
  });

  final List<AppNotification> notifications;
  final bool isSelectionMode;
  final Set<String> selectedIds;
  final bool isLoading;
  final String? errorMessage;

  NotificationState copyWith({
    List<AppNotification>? notifications,
    bool? isSelectionMode,
    Set<String>? selectedIds,
    bool? isLoading,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
      isSelectionMode: isSelectionMode ?? this.isSelectionMode,
      selectedIds: selectedIds ?? this.selectedIds,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }
}
