import 'package:get_it/get_it.dart';

import '../notification_center/di/notification_center_injection.dart';

class NotificationsInjection {
  const NotificationsInjection._();

  static void register(GetIt getIt) {
    NotificationCenterInjection.register(getIt);
  }
}
