import 'package:get_it/get_it.dart';

import '../data/datasources/local_notification_data_source.dart';
import '../data/datasources/notification_data_source.dart';
import '../data/repositories/delayed_notification_repository.dart';
import '../data/repositories/in_memory_notification_repository.dart';
import '../domain/repositories/notification_reader.dart';
import '../domain/repositories/notification_repository.dart';
import '../domain/repositories/notification_updater.dart';
import '../domain/usecases/load_notifications_use_case.dart';
import '../domain/usecases/mark_all_notifications_as_read_use_case.dart';
import '../domain/usecases/mark_notifications_as_read_use_case.dart';
import '../presentation/bloc/notification_bloc.dart';

class NotificationCenterInjection {
  const NotificationCenterInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<NotificationDataSource>()) {
      getIt.registerLazySingleton<NotificationDataSource>(
        LocalNotificationDataSource.new,
      );
    }

    if (!getIt.isRegistered<NotificationRepository>()) {
      getIt.registerLazySingleton<NotificationRepository>(
        () => DelayedNotificationRepository(
          delegate: InMemoryNotificationRepository(
            dataSource: getIt<NotificationDataSource>(),
          ),
        ),
      );
    }

    if (!getIt.isRegistered<NotificationReader>()) {
      getIt.registerLazySingleton<NotificationReader>(
        () => getIt<NotificationRepository>(),
      );
    }

    if (!getIt.isRegistered<NotificationUpdater>()) {
      getIt.registerLazySingleton<NotificationUpdater>(
        () => getIt<NotificationRepository>(),
      );
    }

    if (!getIt.isRegistered<LoadNotificationsUseCase>()) {
      getIt.registerLazySingleton<LoadNotificationsUseCase>(
        () => LoadNotificationsUseCase(getIt<NotificationReader>()),
      );
    }

    if (!getIt.isRegistered<MarkNotificationsAsReadUseCase>()) {
      getIt.registerLazySingleton<MarkNotificationsAsReadUseCase>(
        () => MarkNotificationsAsReadUseCase(getIt<NotificationUpdater>()),
      );
    }

    if (!getIt.isRegistered<MarkAllNotificationsAsReadUseCase>()) {
      getIt.registerLazySingleton<MarkAllNotificationsAsReadUseCase>(
        () => MarkAllNotificationsAsReadUseCase(getIt<NotificationUpdater>()),
      );
    }

    if (!getIt.isRegistered<NotificationBloc>()) {
      getIt.registerFactory<NotificationBloc>(
        () => NotificationBloc(
          loadNotifications: getIt<LoadNotificationsUseCase>(),
          markNotificationsAsRead: getIt<MarkNotificationsAsReadUseCase>(),
          markAllNotificationsAsRead:
              getIt<MarkAllNotificationsAsReadUseCase>(),
        ),
      );
    }
  }
}
