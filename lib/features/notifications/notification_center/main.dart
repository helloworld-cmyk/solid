import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/di/injection.dart';
import 'package:solid/core/ui/widget/widgets.dart';

import 'presentation/bloc/notification_bloc.dart';
import 'presentation/bloc/notification_event.dart';
import 'presentation/bloc/notification_state.dart';
import 'presentation/mappers/notification_icon_resolver.dart';
import 'presentation/theme/notification_colors.dart';
import 'presentation/theme/notification_typography.dart';
import 'presentation/widgets/notification_item.dart';

@RoutePage()
class NotificationCenterPage extends StatelessWidget {
  const NotificationCenterPage({super.key});

  static final NotificationIconResolver _iconResolver =
      NotificationIconResolver.standard();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      child: BlocProvider<NotificationBloc>(
        create: (BuildContext context) =>
            sl<NotificationBloc>()..add(const LoadNotificationsRequested()),
        child: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (BuildContext context, NotificationState state) {
            return Scaffold(
              backgroundColor: NotificationColors.white,
              body: SafeArea(
                top: false,
                child: Column(
                  children: <Widget>[
                    CommonPageHeader(
                      title: 'NOTIFICATION',
                      leading: IconButton(
                        onPressed: () => context.router.maybePop(),
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 18,
                        ),
                      ),
                      actions: <Widget>[
                        if (state.isSelectionMode)
                          IconButton(
                            icon: const Icon(
                              Icons.playlist_add_check,
                              color: NotificationColors.black,
                            ),
                            onPressed: () => context
                                .read<NotificationBloc>()
                                .add(const MarkAllAsRead()),
                          ),
                        IconButton(
                          icon: const Icon(
                            Icons.more_horiz,
                            color: NotificationColors.black,
                          ),
                          onPressed: () => context.read<NotificationBloc>().add(
                            const ToggleSelectionMode(),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: state.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Stack(
                              children: <Widget>[
                                ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  padding: EdgeInsets.only(
                                    bottom: state.isSelectionMode ? 100 : 20,
                                  ),
                                  itemCount: state.notifications.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                        final notification =
                                            state.notifications[index];
                                        return NotificationItem(
                                          notification: notification,
                                          iconResolver: _iconResolver,
                                          isSelectionMode:
                                              state.isSelectionMode,
                                          isSelected: state.selectedIds
                                              .contains(notification.id),
                                          onSelectedChanged: (bool? value) {
                                            context
                                                .read<NotificationBloc>()
                                                .add(
                                                  ToggleNotificationSelection(
                                                    notification.id,
                                                  ),
                                                );
                                          },
                                        );
                                      },
                                ),
                                if (state.isSelectionMode &&
                                    state.selectedIds.isNotEmpty)
                                  Positioned(
                                    bottom: 34,
                                    left: 24,
                                    right: 24,
                                    child: ElevatedButton(
                                      onPressed: () => context
                                          .read<NotificationBloc>()
                                          .add(const MarkSelectedAsRead()),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            NotificationColors.primary,
                                        foregroundColor:
                                            NotificationColors.white,
                                        minimumSize: const Size(
                                          double.infinity,
                                          56,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            28,
                                          ),
                                        ),
                                        elevation: 0,
                                      ),
                                      child: Text(
                                        'Mark As Read',
                                        style: NotificationTypography.itemTitle
                                            .copyWith(
                                              color: NotificationColors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
