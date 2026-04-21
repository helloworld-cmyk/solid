import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/di/injection.dart';

import 'presentation/bloc/register_bloc.dart';
import 'presentation/bloc/register_event.dart';
import 'presentation/bloc/register_state.dart';
import 'presentation/widget/sign_up_back_button.dart';
import 'presentation/widget/sign_up_colors.dart';
import 'presentation/widget/sign_up_line_field.dart';
import 'presentation/widget/sign_up_name_row.dart';
import 'presentation/widget/sign_up_password_field.dart';
import 'presentation/widget/sign_up_phone_field.dart';
import 'presentation/widget/sign_up_primary_button.dart';
import 'presentation/widget/sign_up_social_button.dart';

@RoutePage()
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EdgeInsets viewPadding = MediaQuery.of(context).padding;
    final ThemeData theme = Theme.of(context);
    final TextTheme signUpTextTheme = GoogleFonts.poppinsTextTheme(
      theme.textTheme,
    );

    return Theme(
      data: theme.copyWith(
        textTheme: signUpTextTheme.copyWith(
          displayLarge: signUpTextTheme.displayLarge?.copyWith(height: 1),
          displayMedium: signUpTextTheme.displayMedium?.copyWith(height: 1),
          displaySmall: signUpTextTheme.displaySmall?.copyWith(height: 1),
          headlineMedium: signUpTextTheme.headlineMedium?.copyWith(height: 1),
          headlineSmall: signUpTextTheme.headlineSmall?.copyWith(height: 1),
          bodySmall: signUpTextTheme.bodySmall?.copyWith(height: 1),
          bodyMedium: signUpTextTheme.bodyMedium?.copyWith(height: 1),
          labelLarge: signUpTextTheme.labelLarge?.copyWith(
            height: 1,
            letterSpacing: 0.2,
          ),
          labelMedium: signUpTextTheme.labelMedium?.copyWith(
            height: 1,
            letterSpacing: 0.2,
          ),
        ),
      ),
      child: BlocProvider<RegisterBloc>(
        create: (_) => sl<RegisterBloc>(),
        child: BlocListener<RegisterBloc, RegisterState>(
          listenWhen: (RegisterState previous, RegisterState current) {
            return previous.status != current.status &&
                current.feedbackMessage != null;
          },
          listener: (BuildContext context, RegisterState state) {
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
                      ? const Color(0xFF388E3C)
                      : const Color(0xFFC62828),
                ),
              );

            context.read<RegisterBloc>().add(const RegisterFeedbackConsumed());

            if (state.isSuccess) {
              context.router.maybePop();
            }
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (BuildContext context, RegisterState state) {
                final RegisterBloc registerBloc = context.read<RegisterBloc>();

                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(
                    24,
                    viewPadding.top + 10,
                    24,
                    20 + viewPadding.bottom,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SignUpBackButton(
                          onTap: () {
                            context.router.maybePop();
                          },
                        ),
                      ),
                      const SizedBox(height: 34),
                      Text(
                        'Create your account',
                        style: GoogleFonts.bebasNeue(
                          textStyle: theme.textTheme.displaySmall,
                          fontSize: 30,
                          height: 1,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                          color: kSignUpText,
                        ),
                      ),
                      const SizedBox(height: 64),
                      SignUpNameRow(
                        firstNameInitialValue: state.firstName.isEmpty
                            ? null
                            : state.firstName,
                        lastNameInitialValue: state.lastName.isEmpty
                            ? null
                            : state.lastName,
                        firstNameErrorText: state.firstNameError,
                        lastNameErrorText: state.lastNameError,
                        enabled: !state.isSubmitting,
                        onFirstNameChanged: (String value) {
                          registerBloc.add(RegisterFirstNameChanged(value));
                        },
                        onLastNameChanged: (String value) {
                          registerBloc.add(RegisterLastNameChanged(value));
                        },
                      ),
                      const SizedBox(height: 30),
                      SignUpLineField(
                        label: 'Email',
                        initialValue: state.email.isEmpty ? null : state.email,
                        onChanged: (String value) {
                          registerBloc.add(RegisterEmailChanged(value));
                        },
                        errorText: state.emailError,
                        enabled: !state.isSubmitting,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 30),
                      SignUpPhoneField(
                        initialValue: state.phoneNumber.isEmpty
                            ? null
                            : state.phoneNumber,
                        onChanged: (String value) {
                          registerBloc.add(RegisterPhoneNumberChanged(value));
                        },
                        errorText: state.phoneNumberError,
                        enabled: !state.isSubmitting,
                      ),
                      const SizedBox(height: 30),
                      SignUpPasswordField(
                        label: 'Password',
                        obscureText: state.isPasswordObscured,
                        onToggleVisibility: () {
                          registerBloc.add(
                            const RegisterPasswordVisibilityToggled(),
                          );
                        },
                        onChanged: (String value) {
                          registerBloc.add(RegisterPasswordChanged(value));
                        },
                        errorText: state.passwordError,
                        enabled: !state.isSubmitting,
                      ),
                      const SizedBox(height: 30),
                      SignUpPasswordField(
                        label: 'Confirm Password',
                        obscureText: state.isConfirmPasswordObscured,
                        onToggleVisibility: () {
                          registerBloc.add(
                            const RegisterConfirmPasswordVisibilityToggled(),
                          );
                        },
                        onChanged: (String value) {
                          registerBloc.add(
                            RegisterConfirmPasswordChanged(value),
                          );
                        },
                        errorText: state.confirmPasswordError,
                        enabled: !state.isSubmitting,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) {
                          registerBloc.add(const RegisterSubmitted());
                        },
                      ),
                      const SizedBox(height: 52),
                      SignUpPrimaryButton(
                        label: state.isSubmitting ? 'SIGNING UP...' : 'SIGN UP',
                        onPressed: state.isSubmitting
                            ? null
                            : () {
                                registerBloc.add(const RegisterSubmitted());
                              },
                      ),
                      const SizedBox(height: 10),
                      const SignUpSocialButton(
                        label: 'SIGN UP WITH GOOGLE',
                        leading: SignUpGoogleLogoMark(),
                      ),
                      const SizedBox(height: 8),
                      const SignUpSocialButton(
                        label: 'SIGN UP WITH FACEBOOK',
                        leading: SignUpFacebookLogoMark(),
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
