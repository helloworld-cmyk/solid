import 'notification_reader.dart';
import 'notification_updater.dart';

abstract class NotificationRepository
    implements NotificationReader, NotificationUpdater {}
