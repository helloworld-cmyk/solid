import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/bloc/changeprofile/profile_bloc.dart';
import 'package:solid/core/bloc/changeprofile/profile_event.dart';
import 'package:solid/core/bloc/changeprofile/profile_state.dart';
import 'package:solid/core/ui/widget/widgets.dart';
import 'package:solid/core/utils/profile_avatar_refresher.dart';

import 'change_profile_style.dart';
import 'presentation/widgets/profile_detail_row.dart';
import 'presentation/widgets/profile_identity_section.dart';

@RoutePage()
class ChangeProfilePage extends StatefulWidget {
  const ChangeProfilePage({super.key});

  @override
  State<ChangeProfilePage> createState() => _ChangeProfilePageState();
}

class _ChangeProfilePageState extends State<ChangeProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      requestProfileAvatarFromBackend(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(theme.textTheme),
      ),
      child: Scaffold(
        backgroundColor: ChangeProfileColors.white,
        body: SafeArea(
          top: false,
          child: Column(
            children: <Widget>[
              CommonPageHeader(
                title: 'PROFILE',
                leading: IconButton(
                  onPressed: () {
                    context.router.maybePop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      final ScaffoldMessengerState messenger =
                          ScaffoldMessenger.of(context);
                      messenger
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(
                            content: Text('Profile updated successfully.'),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      context.router.maybePop();
                    },
                    child: Text(
                      'Save',
                      style: ChangeProfileTypography.actionLink,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              Expanded(
                child: BlocBuilder<GlobalProfileBloc, GlobalProfileState>(
                  builder: (BuildContext context, GlobalProfileState state) {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 28, 25, 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ProfileIdentitySection(
                              avatarPath: state.avatarPath,
                              name: state.fullName,
                              username: state.previewUsername,
                            ),
                            const SizedBox(height: 54),
                            ProfileDetailRow(
                              label: 'Name',
                              value: state.fullName,
                              onChanged: (String value) {
                                context.read<GlobalProfileBloc>().add(
                                  GlobalProfileFieldChanged(
                                    field: ProfileField.fullName,
                                    value: value,
                                  ),
                                );
                              },
                            ),
                            ProfileDetailRow(
                              label: 'Username',
                              value: state.editableUsername,
                              onChanged: (String value) {
                                context.read<GlobalProfileBloc>().add(
                                  GlobalProfileFieldChanged(
                                    field: ProfileField.username,
                                    value: value,
                                  ),
                                );
                              },
                            ),
                            ProfileDetailRow(
                              label: 'Date of birth',
                              value: state.dateOfBirth,
                              onChanged: (String value) {
                                context.read<GlobalProfileBloc>().add(
                                  GlobalProfileFieldChanged(
                                    field: ProfileField.dateOfBirth,
                                    value: value,
                                  ),
                                );
                              },
                            ),
                            ProfileDetailRow(
                              label: 'Phone Number',
                              value: state.phoneNumber,
                              keyboardType: TextInputType.phone,
                              onChanged: (String value) {
                                context.read<GlobalProfileBloc>().add(
                                  GlobalProfileFieldChanged(
                                    field: ProfileField.phoneNumber,
                                    value: value,
                                  ),
                                );
                              },
                            ),
                            ProfileDetailRow(
                              label: 'Gender',
                              value: state.gender,
                              onChanged: (String value) {
                                context.read<GlobalProfileBloc>().add(
                                  GlobalProfileFieldChanged(
                                    field: ProfileField.gender,
                                    value: value,
                                  ),
                                );
                              },
                            ),
                            ProfileDetailRow(
                              label: 'Email',
                              value: state.email,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (String value) {
                                context.read<GlobalProfileBloc>().add(
                                  GlobalProfileFieldChanged(
                                    field: ProfileField.email,
                                    value: value,
                                  ),
                                );
                              },
                            ),
                            ProfileDetailRow(
                              label: 'Region',
                              value: state.region,
                              textInputAction: TextInputAction.done,
                              onChanged: (String value) {
                                context.read<GlobalProfileBloc>().add(
                                  GlobalProfileFieldChanged(
                                    field: ProfileField.region,
                                    value: value,
                                  ),
                                );
                              },
                            ),
                            ProfileDetailRow(
                              label: 'Password',
                              trailing: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Change Password',
                                  style: ChangeProfileTypography.actionLink,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
