import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid/core/di/injection.dart';
import 'package:solid/core/router/app.router.gr.dart';

import 'presentation/bloc/onboard_bloc.dart';
import 'presentation/bloc/onboard_state.dart';
import 'presentation/widget/onboard_slide.dart';

@RoutePage()
class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardBloc>(
      create: (_) => sl<OnboardBloc>()..start(),
      child: BlocConsumer<OnboardBloc, OnboardState>(
        listenWhen: (OnboardState previous, OnboardState current) {
          return !previous.shouldNavigateToLogin &&
              current.shouldNavigateToLogin;
        },
        listener: (BuildContext context, OnboardState state) {
          context.read<OnboardBloc>().consumeLoginNavigation();
          context.router.replace(const LoginRoute());
        },
        buildWhen: (OnboardState previous, OnboardState current) {
          return previous.pagePosition != current.pagePosition ||
              previous.pages != current.pages;
        },
        builder: (BuildContext context, OnboardState state) {
          final OnboardBloc onboardBloc = context.read<OnboardBloc>();

          return Scaffold(
            backgroundColor: const Color(0xFF111111),
            body: PageView.builder(
              controller: onboardBloc.pageController,
              physics: const PageScrollPhysics(),
              itemCount: state.pages.length,
              onPageChanged: onboardBloc.onPageChanged,
              itemBuilder: (BuildContext context, int index) {
                return OnboardSlide(
                  data: state.pages[index],
                  index: index,
                  pageCount: state.pages.length,
                  page: state.pagePosition,
                  onNext: () {
                    onboardBloc.goToNextPage();
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
