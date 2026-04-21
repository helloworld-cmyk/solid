import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/app_notification.dart';
import '../../domain/usecases/load_notifications_use_case.dart';
import '../../domain/usecases/mark_all_notifications_as_read_use_case.dart';
import '../../domain/usecases/mark_notifications_as_read_use_case.dart';
import 'notification_event.dart';
import 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc({
    required LoadNotificationsUseCase loadNotifications,
    required MarkNotificationsAsReadUseCase markNotificationsAsRead,
    required MarkAllNotificationsAsReadUseCase markAllNotificationsAsRead,
  }) : _loadNotifications = loadNotifications,
       _markNotificationsAsRead = markNotificationsAsRead,
       _markAllNotificationsAsRead = markAllNotificationsAsRead,
       super(const NotificationState()) {
    on<LoadNotificationsRequested>(_onLoadNotifications);
    on<ToggleSelectionMode>(_onToggleSelectionMode);
    on<ToggleNotificationSelection>(_onToggleNotificationSelection);
    on<MarkSelectedAsRead>(_onMarkSelectedAsRead);
    on<MarkAllAsRead>(_onMarkAllAsRead);
  }

  final LoadNotificationsUseCase _loadNotifications;
  final MarkNotificationsAsReadUseCase _markNotificationsAsRead;
  final MarkAllNotificationsAsReadUseCase _markAllNotificationsAsRead;

  Future<void> _onLoadNotifications(
    LoadNotificationsRequested event,
    Emitter<NotificationState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, clearErrorMessage: true));
    try {
      final List<AppNotification> notifications = await _loadNotifications();
      emit(
        state.copyWith(
          notifications: notifications,
          isLoading: false,
          clearErrorMessage: true,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Unable to load notifications. Please try again.',
        ),
      );
    }
  }

  void _onToggleSelectionMode(
    ToggleSelectionMode event,
    Emitter<NotificationState> emit,
  ) {
    emit(
      state.copyWith(
        isSelectionMode: !state.isSelectionMode,
        selectedIds: const <String>{},
      ),
    );
  }

  void _onToggleNotificationSelection(
    ToggleNotificationSelection event,
    Emitter<NotificationState> emit,
  ) {
    final Set<String> newSelectedIds = Set<String>.from(state.selectedIds);
    if (newSelectedIds.contains(event.notificationId)) {
      newSelectedIds.remove(event.notificationId);
    } else {
      newSelectedIds.add(event.notificationId);
    }

    emit(state.copyWith(selectedIds: newSelectedIds));
  }

  Future<void> _onMarkSelectedAsRead(
    MarkSelectedAsRead event,
    Emitter<NotificationState> emit,
  ) async {
    if (state.selectedIds.isEmpty) {
      return;
    }

    final List<AppNotification> updatedNotifications =
        await _markNotificationsAsRead(state.selectedIds);

    emit(
      state.copyWith(
        notifications: updatedNotifications,
        isSelectionMode: false,
        selectedIds: const <String>{},
      ),
    );
  }

  Future<void> _onMarkAllAsRead(
    MarkAllAsRead event,
    Emitter<NotificationState> emit,
  ) async {
    final List<AppNotification> updatedNotifications =
        await _markAllNotificationsAsRead();
    emit(state.copyWith(notifications: updatedNotifications));
  }
}
