import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/bloc/auth/auth_bloc.dart';
import 'package:solid/core/bloc/auth/auth_event.dart';
import 'package:solid/core/router/app.router.gr.dart';
import 'package:solid/core/ui/widget/widgets.dart';

import 'presentation/widgets/profile_header.dart';
import 'presentation/widgets/quick_actions.dart';
import 'presentation/widgets/settings_list.dart';
import 'profile_typography.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(theme.textTheme),
      ),
      child: Scaffold(
        backgroundColor: ProfileColors.white,
        body: SafeArea(
          top: false,
          child: Column(
            children: <Widget>[
              CommonPageHeader(
                title: 'ACCOUNT',
                leading: IconButton(
                  onPressed: () async {
                    final bool didPop = await context.router.maybePop();
                    if (!didPop && context.mounted) {
                      context.router.replace(const HomeRoute());
                    }
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: IconButton(
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: ProfileColors.black,
                      ),
                      onPressed: () {
                        context.router.push(const ChangeProfileRoute());
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      const ProfileHeader(),
                      const SizedBox(height: 16),
                      QuickActions(
                        onMyOrderTap: () {
                          context.router.push(const MyOrderRoute());
                        },
                        onWishlistTap: () {
                          context.router.push(const WishlistRoute());
                        },
                      ),
                      const SizedBox(height: 24),
                      SettingsList(
                        onAccountSettingTap: () {
                          context.router.push(const ChangeProfileRoute());
                        },
                        onNotificationTap: () {
                          context.router.push(const NotificationCenterRoute());
                        },
                        onPaymentInformationTap: () {
                          context.router.push(const PaymentCardListRoute());
                        },
                        onFeatureTap: (String featureName) {
                          final ScaffoldMessengerState messenger =
                              ScaffoldMessenger.of(context);
                          messenger
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: Text(
                                  '$featureName feature is coming soon.',
                                ),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                        },
                        onSignOutTap: () {
                          context.read<AuthBloc>().add(const AuthLoggedOut());
                        },
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const AppBottomNavBar(selectedIndex: 4),
      ),
    );
  }
}
