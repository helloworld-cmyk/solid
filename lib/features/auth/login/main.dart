import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/bloc/auth/auth_bloc.dart';
import 'package:solid/core/bloc/auth/auth_event.dart';
import 'package:solid/core/di/injection.dart';
import 'package:solid/core/router/app.router.gr.dart';

import 'presentation/bloc/login_bloc.dart';
import 'presentation/bloc/login_event.dart';
import 'presentation/bloc/login_state.dart';
import 'presentation/widget/sign_in_email_field.dart';
import 'presentation/widget/sign_in_footer.dart';
import 'presentation/widget/sign_in_hero_banner.dart';
import 'presentation/widget/sign_in_password_field.dart';
import 'presentation/widget/sign_in_primary_button.dart';
import 'presentation/widget/sign_in_remember_row.dart';
import 'presentation/widget/sign_in_social_button.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = GoogleFonts.poppinsTextTheme(theme.textTheme);

    return Theme(
      data: theme.copyWith(
        textTheme: textTheme.copyWith(
          displayLarge: textTheme.displayLarge?.copyWith(height: 1),
          displayMedium: textTheme.displayMedium?.copyWith(height: 1),
          displaySmall: textTheme.displaySmall?.copyWith(height: 1),
          headlineMedium: textTheme.headlineMedium?.copyWith(height: 1),
          headlineSmall: textTheme.headlineSmall?.copyWith(height: 1),
          bodyMedium: textTheme.bodyMedium?.copyWith(height: 1),
          bodySmall: textTheme.bodySmall?.copyWith(height: 1),
          labelLarge: textTheme.labelLarge?.copyWith(height: 1),
          labelMedium: textTheme.labelMedium?.copyWith(height: 1),
        ),
      ),
      child: BlocProvider<LoginBloc>(
        create: (_) => sl<LoginBloc>(),
        child: BlocListener<LoginBloc, LoginState>(
          listenWhen: (LoginState previous, LoginState current) {
            return previous.status != current.status &&
                current.feedbackMessage != null;
          },
          listener: (BuildContext context, LoginState state) {
            final ScaffoldMessengerState messenger = ScaffoldMessenger.of(
              context,
            );

            messenger
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.feedbackMessage!),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: state.isSuccess
                      ? const Color(0xFF2E7D32)
                      : const Color(0xFFC62828),
                ),
              );

            if (state.isSuccess) {
              context.read<AuthBloc>().add(const AuthLoggedIn());
            }

            context.read<LoginBloc>().add(const LoginFeedbackConsumed());
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: BlocBuilder<LoginBloc, LoginState>(
              builder: (BuildContext context, LoginState state) {
                final LoginBloc loginBloc = context.read<LoginBloc>();

                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SignInHeroBanner(onBack: () => context.router.maybePop()),
                      const SizedBox(height: 50),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          31,
                          0,
                          31,
                          24 + bottomPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SignInEmailField(
                              initialValue: state.email.isEmpty
                                  ? null
                                  : state.email,
                              onChanged: (String value) {
                                loginBloc.add(LoginEmailChanged(value));
                              },
                              errorText: state.emailError,
                              enabled: !state.isSubmitting,
                            ),
                            const SizedBox(height: 18),
                            SignInPasswordField(
                              obscureText: state.isPasswordObscured,
                              onToggleVisibility: () {
                                loginBloc.add(
                                  const LoginPasswordVisibilityToggled(),
                                );
                              },
                              onChanged: (String value) {
                                loginBloc.add(LoginPasswordChanged(value));
                              },
                              errorText: state.passwordError,
                              enabled: !state.isSubmitting,
                              onFieldSubmitted: (_) {
                                loginBloc.add(const LoginSubmitted());
                              },
                            ),
                            const SizedBox(height: 12),
                            SignInRememberRow(
                              isSelected: state.isRememberMe,
                              onRememberTap: () {
                                loginBloc.add(const LoginRememberMeToggled());
                              },
                            ),
                            const SizedBox(height: 29),
                            SignInPrimaryButton(
                              label: state.isSubmitting
                                  ? 'SIGNING IN...'
                                  : 'SIGN IN',
                              onPressed: state.isSubmitting
                                  ? null
                                  : () {
                                      loginBloc.add(const LoginSubmitted());
                                    },
                            ),
                            const SizedBox(height: 10),
                            const SignInSocialButton(
                              label: 'SIGN IN WITH GOOGLE',
                              leading: GoogleLogoMark(),
                            ),
                            const SizedBox(height: 8),
                            const SignInSocialButton(
                              label: 'SIGN IN WITH FACEBOOK',
                              leading: FacebookLogoMark(),
                            ),
                            const SizedBox(height: 28),
                            SignInFooter(
                              onRegisterTap: () {
                                context.router.push(const RegisterRoute());
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
